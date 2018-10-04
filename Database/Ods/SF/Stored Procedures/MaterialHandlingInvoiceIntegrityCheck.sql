
-- ===================================================
-- Author:		Randy Minder
-- Create date: 27-September, 3018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[MaterialHandlingInvoiceIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[MaterialHandlingInvoiceIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.MaterialHandlingInvoice;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.MH_Invoice__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-MaterialHandlingInvoice', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

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
		FROM ODS.SF.MaterialHandlingInvoice
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwMH_Invoice_c
	)
		,RowDifferences
	AS
	(
		SELECT
			T.Account
		   ,T.ActivityType
		   ,T.AccountSlVendorId
		   ,T.AccountSlCustomerId
		   ,T.AccountUnityExternalId
		   ,T.AccountFieldOfficeSlCustomerId
		   ,T.AccountFieldOfficeSlVendorId
		   ,T.AccountFieldOfficeUnityExternalId
		   ,T.AccountTerms
		   ,T.CallType
		   ,T.Certificate
		   ,T.Company
		   ,T.ConsumedFromLocation
		   ,T.Contact
		   ,T.ContactUnityExternalId
		   --,T.CreatedDate
		   ,T.CreatedById
		   ,T.CustomerPo
		   ,T.DateInvoiced
		   ,T.EndDateAndTime
		   ,T.FieldOffice
		   ,T.HideLine
		   ,T.Id
		   ,ROUND(CAST(T.InvoiceDetailsCost AS FLOAT), 3)	  AS InvoiceDetailsCost
		   ,ROUND(CAST(T.InvoiceDetailsRevenue AS FLOAT), 3)  AS InvoiceDetailsRevenue
		   ,ROUND(CAST(T.InvoiceDetailsSubTotal AS FLOAT), 3) AS InvoiceDetailsSubTotal
		   ,ROUND(CAST(T.InvoiceMargin AS FLOAT), 3)		  AS InvoiceMargin
		   ,T.InvoiceTerms
		   ,ROUND(CAST(T.InvoiceSalesTaxRollup AS FLOAT), 3)  AS InvoiceSalesTaxRollup
		   ,ROUND(CAST(T.InvoiceTotal AS FLOAT), 3)			  AS InvoiceTotal
		   ,ROUND(CAST(T.InvoiceTotalFormula AS FLOAT), 3)	  AS InvoiceTotalFormula
		   ,ROUND(CAST(T.InvoiceTotalRollup AS FLOAT), 3)	  AS InvoiceTotalRollup
		   ,ROUND(CAST(T.InvoiceTotalRollup1 AS FLOAT), 3)	  AS InvoiceTotalRollup1
		   ,T.IsDeleted
		   ,ROUND(CAST(T.LaborTime AS FLOAT), 3)			  AS LaborTime
		   --,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastModifiedById
		   --,T.LastModifiedDate
		   ,T.Location
		   ,T.LocationAddress
		   ,T.LocationCity
		   ,T.LocationState
		   ,T.LocationZip
		   ,T.Name
		   ,T.OwnerId
		   ,T.PostToPeriod
		   ,T.RecommendedService
		   ,T.RecordTypeId
		   ,ROUND(CAST(T.SalesTax AS FLOAT), 3)				  AS SalesTax
		   ,T.Segment
		   ,T.SegmentFormula
		   ,T.ServiceNotes
		   ,T.ServiceTeam
		   ,T.ServiceTeamAddress
		   ,T.ServiceTeamCity
		   ,T.ServiceTeamState
		   ,T.ServiceTeamZip
		   ,T.ServiceTeamLegalName
		   ,T.SlInvoiceDate
		   ,T.SlInvoiceId
		   ,T.SlStatus
		   ,T.SpWorkPerformed
		   ,T.StartDateAndTime
		   ,T.Status
		   ,ROUND(CAST(T.SubTotal AS FLOAT), 3)				  AS SubTotal
		   ,T.Supercenter
		   ,T.SupercenterFormula
		   --,T.SystemModstamp
		   ,ROUND(CAST(T.TaxAdded AS FLOAT), 3)				  AS TaxAdded
		   ,ROUND(CAST(T.TotalTax AS FLOAT), 3)				  AS TotalTax
		   ,T.Voucher
		   ,ROUND(CAST(T.VoucherRollupTotal AS FLOAT), 3)	  AS VoucherRollupTotal
		   ,ROUND(CAST(T.WorkOrderLaborTotal AS FLOAT), 3)	  AS WorkOrderLaborTotal
		   ,T.WorkOrderType
		   ,ROUND(CAST(T.WorkOrderPartsTotal AS FLOAT), 3)	  AS WorkOrderPartsTotal
		   ,ROUND(CAST(T.WorkOrderTfsTaxTotal AS FLOAT), 3)	  AS WorkOrderTfsTaxTotal
		   ,T.WorkDescription
		   ,T.WorkOrder
		   ,T.WorkOrderDocumentNumber
		--,T.LastUpdate
		FROM ODSStaging.SF.vwMH_Invoice_c T
			INNER JOIN CommonRows		  T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			T.Account
		   ,T.ActivityType
		   ,T.AccountSlVendorId
		   ,T.AccountSlCustomerId
		   ,T.AccountUnityExternalId
		   ,T.AccountFieldOfficeSlCustomerId
		   ,T.AccountFieldOfficeSlVendorId
		   ,T.AccountFieldOfficeUnityExternalId
		   ,T.AccountTerms
		   ,T.CallType
		   ,T.Certificate
		   ,T.Company
		   ,T.ConsumedFromLocation
		   ,T.Contact
		   ,T.ContactUnityExternalId
		   --,T.CreatedDate
		   ,T.CreatedById
		   ,T.CustomerPo
		   ,T.DateInvoiced
		   ,T.EndDateAndTime
		   ,T.FieldOffice
		   ,T.HideLine
		   ,T.Id
		   ,ROUND(T.InvoiceDetailsCost, 3)	   AS InvoiceDetailsCost
		   ,ROUND(T.InvoiceDetailsRevenue, 3)  AS InvoiceDetailsRevenue
		   ,ROUND(T.InvoiceDetailsSubTotal, 3) AS InvoiceDetailsSubTotal
		   ,ROUND(T.InvoiceMargin, 3)		   AS InvoiceMargin
		   ,T.InvoiceTerms
		   ,ROUND(T.InvoiceSalesTaxRollup, 3)  AS InvoiceSalesTaxRollup
		   ,ROUND(T.InvoiceTotal, 3)		   AS InvoiceTotal
		   ,ROUND(T.InvoiceTotalFormula, 3)	   AS InvoiceTotalFormula
		   ,ROUND(T.InvoiceTotalRollup, 3)	   AS InvoiceTotalRollup
		   ,ROUND(T.InvoiceTotalRollup1, 3)	   AS InvoiceTotalRollup1
		   ,T.IsDeleted
		   ,ROUND(T.LaborTime, 3)			   AS LaborTime
		   --,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastModifiedById
		   --,T.LastModifiedDate
		   ,T.Location
		   ,T.LocationAddress
		   ,T.LocationCity
		   ,T.LocationState
		   ,T.LocationZip
		   ,T.Name
		   ,T.OwnerId
		   ,T.PostToPeriod
		   ,T.RecommendedService
		   ,T.RecordTypeId
		   ,ROUND(T.SalesTax, 3)			   AS SalesTax
		   ,T.Segment
		   ,T.SegmentFormula
		   ,T.ServiceNotes
		   ,T.ServiceTeam
		   ,T.ServiceTeamAddress
		   ,T.ServiceTeamCity
		   ,T.ServiceTeamState
		   ,T.ServiceTeamZip
		   ,T.ServiceTeamLegalName
		   ,T.SlInvoiceDate
		   ,T.SlInvoiceId
		   ,T.SlStatus
		   ,T.SpWorkPerformed
		   ,T.StartDateAndTime
		   ,T.Status
		   ,ROUND(T.SubTotal, 3)			   AS SubTotal
		   ,T.Supercenter
		   ,T.SupercenterFormula
		   --,T.SystemModstamp
		   ,ROUND(T.TaxAdded, 3)			   AS TaxAdded
		   ,ROUND(T.TotalTax, 3)			   AS TotalTax
		   ,T.Voucher
		   ,ROUND(T.VoucherRollupTotal, 3)	   AS VoucherRollupTotal
		   ,ROUND(T.WorkOrderLaborTotal, 3)	   AS WorkOrderLaborTotal
		   ,T.WorkOrderType
		   ,ROUND(T.WorkOrderPartsTotal, 3)	   AS WorkOrderPartsTotal
		   ,ROUND(T.WorkOrderTfsTaxTotal, 3)   AS WorkOrderTfsTaxTotal
		   ,T.WorkDescription
		   ,T.WorkOrder
		   ,T.WorkOrderDocumentNumber
		--,T.LastUpdate
		FROM ODS.SF.vwMaterialHandlingInvoice T
			INNER JOIN CommonRows			  T2 ON T2.Id = T.Id
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
	FROM RowDifferences							  T
		INNER JOIN ODSStaging.SF.MH_Invoice__c	  T2 ON T.Id = T2.Id
		INNER JOIN ODS.SF.MaterialHandlingInvoice T3 ON T.Id = T3.Id
	WHERE T2.LastModifiedDate <= T3.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-MaterialHandlingInvoice', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.MH_Invoice__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;