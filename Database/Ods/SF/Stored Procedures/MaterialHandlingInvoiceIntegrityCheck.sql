-- ===================================================
-- Author:		Randy Minder
-- Create date: 27-September, 2018
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
		-- by using the INTERSECT command on the PK columns of the tables.
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
		   ,ROUND(CAST(T.InvoiceDetailsCost AS FLOAT), 2)	  AS InvoiceDetailsCost
		   ,ROUND(CAST(T.InvoiceDetailsRevenue AS FLOAT), 2)  AS InvoiceDetailsRevenue
		   ,ROUND(CAST(T.InvoiceDetailsSubTotal AS FLOAT), 2) AS InvoiceDetailsSubTotal
		   ,ROUND(CAST(T.InvoiceMargin AS FLOAT), 2)		  AS InvoiceMargin
		   ,T.InvoiceTerms
		   ,ROUND(CAST(T.InvoiceSalesTaxRollup AS FLOAT), 2)  AS InvoiceSalesTaxRollup
		   ,ROUND(CAST(T.InvoiceTotal AS FLOAT), 2)			  AS InvoiceTotal
		   ,ROUND(CAST(T.InvoiceTotalFormula AS FLOAT), 2)	  AS InvoiceTotalFormula
		   ,ROUND(CAST(T.InvoiceTotalRollup AS FLOAT), 2)	  AS InvoiceTotalRollup
		   ,ROUND(CAST(T.InvoiceTotalRollup1 AS FLOAT), 2)	  AS InvoiceTotalRollup1
		   ,T.IsDeleted
		   ,ROUND(CAST(T.LaborTime AS FLOAT), 2)			  AS LaborTime
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
		   ,ROUND(CAST(T.SalesTax AS FLOAT), 2)				  AS SalesTax
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
		   ,ROUND(CAST(T.SubTotal AS FLOAT), 2)				  AS SubTotal
		   ,T.Supercenter
		   ,T.SupercenterFormula
		   --,T.SystemModstamp
		   ,ROUND(CAST(T.TaxAdded AS FLOAT), 2)				  AS TaxAdded
		   ,ROUND(CAST(T.TotalTax AS FLOAT), 2)				  AS TotalTax
		   ,T.Voucher
		   ,ROUND(CAST(T.VoucherRollupTotal AS FLOAT), 2)	  AS VoucherRollupTotal
		   ,ROUND(CAST(T.WorkOrderLaborTotal AS FLOAT), 2)	  AS WorkOrderLaborTotal
		   ,T.WorkOrderType
		   ,ROUND(CAST(T.WorkOrderPartsTotal AS FLOAT), 2)	  AS WorkOrderPartsTotal
		   ,ROUND(CAST(T.WorkOrderTfsTaxTotal AS FLOAT), 2)	  AS WorkOrderTfsTaxTotal
		   ,T.WorkDescription
		   ,T.WorkOrder
		   ,T.WorkOrderDocumentNumber
		   --,T.LastUpdate
		FROM ODS.SF.vwMaterialHandlingInvoice T
			INNER JOIN CommonRows			  T2 ON T2.Id = T.Id
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
		   ,ROUND(T.InvoiceDetailsCost, 2)	   AS InvoiceDetailsCost
		   ,ROUND(T.InvoiceDetailsRevenue, 2)  AS InvoiceDetailsRevenue
		   ,ROUND(T.InvoiceDetailsSubTotal, 2) AS InvoiceDetailsSubTotal
		   ,ROUND(T.InvoiceMargin, 2)		   AS InvoiceMargin
		   ,T.InvoiceTerms
		   ,ROUND(T.InvoiceSalesTaxRollup, 2)  AS InvoiceSalesTaxRollup
		   ,ROUND(T.InvoiceTotal, 2)		   AS InvoiceTotal
		   ,ROUND(T.InvoiceTotalFormula, 2)	   AS InvoiceTotalFormula
		   ,ROUND(T.InvoiceTotalRollup, 2)	   AS InvoiceTotalRollup
		   ,ROUND(T.InvoiceTotalRollup1, 2)	   AS InvoiceTotalRollup1
		   ,T.IsDeleted
		   ,ROUND(T.LaborTime, 2)			   AS LaborTime
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
		   ,ROUND(T.SalesTax, 2)			   AS SalesTax
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
		   ,ROUND(T.SubTotal, 2)			   AS SubTotal
		   ,T.Supercenter
		   ,T.SupercenterFormula
		   --,T.SystemModstamp
		   ,ROUND(T.TaxAdded, 2)			   AS TaxAdded
		   ,ROUND(T.TotalTax, 2)			   AS TotalTax
		   ,T.Voucher
		   ,ROUND(T.VoucherRollupTotal, 2)	   AS VoucherRollupTotal
		   ,ROUND(T.WorkOrderLaborTotal, 2)	   AS WorkOrderLaborTotal
		   ,T.WorkOrderType
		   ,ROUND(T.WorkOrderPartsTotal, 2)	   AS WorkOrderPartsTotal
		   ,ROUND(T.WorkOrderTfsTaxTotal, 2)   AS WorkOrderTfsTaxTotal
		   ,T.WorkDescription
		   ,T.WorkOrder
		   ,T.WorkOrderDocumentNumber
		--,T.LastUpdate
		FROM ODSStaging.SF.vwMH_Invoice_c T
			INNER JOIN CommonRows		  T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table
	SELECT Id
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-MaterialHandlingInvoice', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;