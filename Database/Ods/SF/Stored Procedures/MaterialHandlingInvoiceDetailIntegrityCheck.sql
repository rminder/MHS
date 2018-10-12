
-- ===================================================
-- Author:		Randy Minder
-- Create date: 27-September, 3018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[MaterialHandlingInvoiceDetailIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[MaterialHandlingInvoiceDetailIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.MaterialHandlingInvoiceDetail;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.MH_Invoice_Details__c;

	IF (@OdsRowCount > @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-MaterialHandlingInvoiceDetail', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables. We'll end up with rows in SF that are
		-- not in Ods.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.MaterialHandlingInvoiceDetail
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwMH_Invoice_c
	)
		,RowDifferences
	AS
	(
		SELECT
			T.Id
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.WorkOrder
		   ,T.Vendor
		   ,T.LineType
		   ,T.Part
		   ,ROUND(T.LinePricePerUnit, 3)	  AS LinePricePerUnit
		   ,ROUND(T.LineQuantity, 3)		  AS LineQuantity
		   ,ROUND(T.SalesTax, 3)			  AS SalesTax
		   ,T.Invoice
		   ,T.AddToInvoice
		   ,T.DateInvoiced
		   ,T.ActivityType
		   ,ROUND(T.TotalLinePrice, 3)		  AS TotalLinePrice
		   ,T.WorkDetail
		   ,T.TLinePricePerUnit
		   ,T.InvoiceStatus
		   ,T.WorkDescription
		   ,T.UnitOfMeasure
		   ,T.HideLine
		   ,ROUND(T.TotalLinePriceFormula, 3) AS TotalLinePriceFormula
		   ,ROUND(T.SortOrder, 3)			  AS SortOrder
		   ,ROUND(T.DetailLineCost, 3)		  AS DetailLineCost
		   ,T.AccountVendorSlVendorId
		   ,T.InterfaceProcessed
		   ,T.AccountVendorSlCustomerId
		   ,T.AccountVendorUnityAccountExternalId
		   ,T.Product2PartUnityProductExternalId
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwMH_Invoice_Details__c T
			INNER JOIN CommonRows				   T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			T.Id
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.WorkOrder
		   ,T.Vendor
		   ,T.LineType
		   ,T.Part
		   ,ROUND(T.LinePricePerUnit, 3)	  AS LinePricePerUnit
		   ,ROUND(T.LineQuantity, 3)		  AS LineQuantity
		   ,ROUND(T.SalesTax, 3)			  AS SalesTax
		   ,T.Invoice
		   ,T.AddToInvoice
		   ,T.DateInvoiced
		   ,T.ActivityType
		   ,ROUND(T.TotalLinePrice, 3)		  AS TotalLinePrice
		   ,T.WorkDetail
		   ,T.TLinePricePerUnit
		   ,T.InvoiceStatus
		   ,T.WorkDescription
		   ,T.UnitOfMeasure
		   ,T.HideLine
		   ,ROUND(T.TotalLinePriceFormula, 3) AS TotalLinePriceFormula
		   ,ROUND(T.SortOrder, 3)			  AS SortOrder
		   ,ROUND(T.DetailLineCost, 3)		  AS DetailLineCost
		   ,T.AccountVendorSlVendorId
		   ,T.InterfaceProcessed
		   ,T.AccountVendorSlCustomerId
		   ,T.AccountVendorUnityAccountExternalId
		   ,T.Product2PartUnityProductExternalId
		   ,T.LastUpdate
		FROM ODS.SF.vwMaterialHandlingInvoiceDetail T
			INNER JOIN CommonRows					T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Note, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SfLastModifiedDate
	   ,T3.LastModifiedDate AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences									T
		INNER JOIN ODSStaging.SF.MH_Invoice_Details__c	T2 ON T.Id = T2.Id
		INNER JOIN ODS.SF.MaterialHandlingInvoiceDetail T3 ON T.Id = T3.Id
	WHERE T2.LastModifiedDate <= T3.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-MaterialHandlingInvoiceDetail', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.MH_Invoice_Details__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;