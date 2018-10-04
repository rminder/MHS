-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxServiceOrderLineIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxServiceOrderLineIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxServiceOrderLine;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__Service_Order_Line__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceOrderLine', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxServiceOrderLine
		INTERSECT
		SELECT CAST(Id AS VARCHAR(18)) AS ID
		FROM ODSStaging.SF.vwSVMXC__Service_Order_Line__c
	)
	SELECT Id
	INTO #CommonRowsTable
	FROM CommonRows;

	CREATE NONCLUSTERED INDEX IX_CommonRowsTable_Id ON #CommonRowsTable (Id);

	WITH RowDifferences
	AS
	(
		SELECT
			T.[Id]
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceOrder
		   ,T.ActivityType
		   ,ROUND(T.ActualPrice2, 4)			   AS ActualPrice
		   ,ROUND(T.ActualQuantity2, 4)			   AS ActualQuanity2
		   ,T.CanceledBy
		   ,T.CanceledOn
		   ,T.ClosedBy
		   ,T.ClosedOn
		   ,T.ConsumedFromLocation
		   ,T.CostCategory
		   ,T.DateReceived
		   ,T.DateRequested
		   ,ROUND(T.Discount, 4)				   AS Discount
		   ,T.EndDateAndTime
		   ,ROUND(T.EstimatedPrice2, 4)			   AS EstimatedPrice2
		   ,ROUND(T.EstimatedQuantity2, 4)		   AS EstimatedQuantity2
		   ,T.ExpenseType
		   ,T.FromLocation
		   ,T.GroupMember
		   ,T.IncludeInQuote
		   ,T.IsBillable
		   ,T.LineStatus
		   ,T.LineType
		   ,T.LogAgainst
		   ,T.PostedToInventory
		   ,T.Product
		   ,ROUND(T.QuantityShipmentInitiated2, 4) AS QuantityShipmentInitiated2
		   ,ROUND(T.QuantityShipped2, 4)		   AS QuantityShipped2
		   ,T.ReceivedCity
		   ,T.ReceivedCountry
		   ,T.ReceivedLocation
		   ,T.ReceivedQuantity2
		   ,T.ReceivedState
		   ,T.ReceivedStreet
		   ,T.ReceivedZip
		   ,T.ReferenceInformation
		   ,T.RequestedCity
		   ,T.RequestedCountry
		   ,T.RequestedLocation
		   ,ROUND(T.RequestedQuantity2, 4)		   AS RequestedQuantity2
		   ,T.RequestedState
		   ,T.RequestedStreet
		   ,T.RequestedZip
		   ,T.[Select]
		   ,T.SerialNumber
		   ,T.ServiceGroup
		   ,T.StartDateAndTime
		   ,ROUND(T.TotalEstimatedPrice, 4)		   AS TotalEstimatedPrice
		   ,ROUND(T.TotalLinePrice, 4)			   AS TotalLinePrice
		   ,T.UsePriceFromPricebook
		   ,T.WorkDescription
		   ,ROUND(T.EstimateOrActualPrice, 4)	   AS EstimateOrActualPrice
		   ,T.AppliedRateType
		   ,ROUND(T.Covered, 4)					   AS Covered
		   ,ROUND(T.BillableLinePrice, 4)		   AS BillableLinePrice
		   ,ROUND(T.BillableQuantity, 4)		   AS BillableQuantity
		   ,T.BillingInformation
		   ,T.ProductWarranty
		   ,T.WorkDetail
		   ,T.Vendor
		   ,T.LaborType
		   ,ROUND(T.LaborPricePerUnit, 4)		   AS LaborPricePerUnit
		   ,T.AddtoInvoice
		   ,ROUND(T.ExtendedPrice, 4)			   AS ExtendedPrice
		   ,T.PartSerialNumber
		   ,ROUND(T.LaborTime, 4)				   AS LaborTime
		   ,T.VendorStatus
		   ,ROUND(T.SalesTax, 4)				   AS SalesTax
		   ,T.Invoiced
		   ,T.DateInvoiced
		   ,T.WorkComplete
		   ,T.DeliverDate
		   ,T.InvoiceDetail
		   ,ROUND(T.TotalLinePriceWithTax, 4)	   AS TotalLinePriceWithTax
		   ,T.PartsOrderLine
		   ,ROUND(T.VendorCostPerUnit, 4)		   AS VendorCostPerUnit
		   ,T.VendorOrder
		   ,T.Segment
		   ,T.Supercenter
		   ,T.DayComments
		   ,T.InstalledProduct
		   ,T.UnitofMeasure
		   ,ROUND(T.TotalCost, 4)				   AS TotalCost
		   ,ROUND(T.InventoryLineQuantity, 4)	   AS InventoryLineQuantity
		   ,ROUND(T.ActualTime, 4)				   AS ActualTime
		   ,T.TechId
		   ,T.HideLine
		   ,T.Voucher
		   ,T.Technician
		   ,ROUND(T.SortOrder, 4)				   AS SortOrder
		   ,T.NonInventoryPart
		   ,T.WdCreatedDate
		   ,T.ServiceReportLine
		   ,T.IntegratedIn06
		   ,T.ConsumedQuantity
		   ,ROUND(T.ConsumptionQuantity, 4)		   AS ConsumptionQuantity
		   ,T.ConsumedParts
		   ,ROUND(T.UsedQuantity, 4)			   AS UsedQuantity
		   ,T.ReconciledQuantity
		   ,T.TechnicianWd2
		   ,T.CongaVendorName
		   ,T.SerialNumberList
		   ,T.TransactionResults
		   ,T.ServiceReport
		   ,T.InterfaceProcessed
		   ,T.TaxCode
		   ,T.LineFromiPad
		   ,ROUND(T.QuotedMarginPercent, 4)		   AS QuotedMarginPercent
		   ,ROUND(T.QuotedMargin, 4)			   AS QuotedMargin
		   ,ROUND(T.QuotedQuantity, 4)			   AS QuotedQuantity
		   ,ROUND(T.QuotedUnitCost, 4)			   AS QuotedUnitCost
		   ,ROUND(T.QuotedUnitPrice, 4)			   AS QuotedUnitPrice
		   ,T.Quoted
		   ,ROUND(T.TotalQuotedCost, 4)			   AS TotalQuotedCost
		   ,ROUND(T.TotalQuotedPrice, 4)		   AS TotalQuotedPrice
		   ,T.UpdateQuotedWithActuals
		   ,T.CompletedBy
		   ,T.CompletedDate
		   ,ROUND(T.DeadTime, 4)				   AS DeadTime
		   ,T.EntitlementNotes
		   ,T.IsEntitlementPerformed
		   ,T.ServiceMaintenanceContract
		   ,T.SlInventoryIssued
		   ,T.LastUpdate
		FROM ODS.SF.ServiceMaxServiceOrderLine T
			INNER JOIN #CommonRowsTable		   T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18))			   AS Id
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceOrder
		   ,T.ActivityType
		   ,ROUND(T.ActualPrice2, 4)			   AS ActualPrice
		   ,ROUND(T.ActualQuantity2, 4)			   AS ActualQuanity2
		   ,T.CanceledBy
		   ,T.CanceledOn
		   ,T.ClosedBy
		   ,T.ClosedOn
		   ,T.ConsumedFromLocation
		   ,T.CostCategory
		   ,T.DateReceived
		   ,T.DateRequested
		   ,ROUND(T.Discount, 4)				   AS Discount
		   ,T.EndDateAndTime
		   ,ROUND(T.EstimatedPrice2, 4)			   AS EstimatedPrice2
		   ,ROUND(T.EstimatedQuantity2, 4)		   AS EstimatedQuantity2
		   ,T.ExpenseType
		   ,T.FromLocation
		   ,T.GroupMember
		   ,T.IncludeInQuote
		   ,T.IsBillable
		   ,T.LineStatus
		   ,T.LineType
		   ,T.LogAgainst
		   ,T.PostedToInventory
		   ,T.Product
		   ,ROUND(T.QuantityShipmentInitiated2, 4) AS QuantityShipmentInitiated2
		   ,ROUND(T.QuantityShipped2, 4)		   AS QuantityShipped2
		   ,T.ReceivedCity
		   ,T.ReceivedCountry
		   ,T.ReceivedLocation
		   ,T.ReceivedQuantity2
		   ,T.ReceivedState
		   ,T.ReceivedStreet
		   ,T.ReceivedZip
		   ,T.ReferenceInformation
		   ,T.RequestedCity
		   ,T.RequestedCountry
		   ,T.RequestedLocation
		   ,ROUND(T.RequestedQuantity2, 4)		   AS RequestedQuantity2
		   ,T.RequestedState
		   ,T.RequestedStreet
		   ,T.RequestedZip
		   ,T.[Select]
		   ,T.SerialNumber
		   ,T.ServiceGroup
		   ,T.StartDateAndTime
		   ,ROUND(T.TotalEstimatedPrice, 4)		   AS TotalEstimatedPrice
		   ,ROUND(T.TotalLinePrice, 4)			   AS TotalLinePrice
		   ,T.UsePriceFromPricebook
		   ,T.WorkDescription
		   ,ROUND(T.EstimateOrActualPrice, 4)	   AS EstimateOrActualPrice
		   ,T.AppliedRateType
		   ,ROUND(T.Covered, 4)					   AS Covered
		   ,ROUND(T.BillableLinePrice, 4)		   AS BillableLinePrice
		   ,ROUND(T.BillableQuantity, 4)		   AS BillableQuantity
		   ,T.BillingInformation
		   ,T.ProductWarranty
		   ,T.WorkDetail
		   ,T.Vendor
		   ,T.LaborType
		   ,ROUND(T.LaborPricePerUnit, 4)		   AS LaborPricePerUnit
		   ,T.AddtoInvoice
		   ,ROUND(T.ExtendedPrice, 4)			   AS ExtendedPrice
		   ,T.PartSerialNumber
		   ,ROUND(T.LaborTime, 4)				   AS LaborTime
		   ,T.VendorStatus
		   ,ROUND(T.SalesTax, 4)				   AS SalesTax
		   ,T.Invoiced
		   ,T.DateInvoiced
		   ,T.WorkComplete
		   ,T.DeliverDate
		   ,T.InvoiceDetail
		   ,ROUND(T.TotalLinePriceWithTax, 4)	   AS TotalLinePriceWithTax
		   ,T.PartsOrderLine
		   ,ROUND(T.VendorCostPerUnit, 4)		   AS VendorCostPerUnit
		   ,T.VendorOrder
		   ,T.Segment
		   ,T.Supercenter
		   ,T.DayComments
		   ,T.InstalledProduct
		   ,T.UnitofMeasure
		   ,ROUND(T.TotalCost, 4)				   AS TotalCost
		   ,ROUND(T.InventoryLineQuantity, 4)	   AS InventoryLineQuantity
		   ,ROUND(T.ActualTime, 4)				   AS ActualTime
		   ,T.TechId
		   ,T.HideLine
		   ,T.Voucher
		   ,T.Technician
		   ,ROUND(T.SortOrder, 4)				   AS SortOrder
		   ,T.NonInventoryPart
		   ,T.WdCreatedDate
		   ,T.ServiceReportLine
		   ,T.IntegratedIn06
		   ,T.ConsumedQuantity
		   ,ROUND(T.ConsumptionQuantity, 4)		   AS ConsumptionQuantity
		   ,T.ConsumedParts
		   ,ROUND(T.UsedQuantity, 4)			   AS UsedQuantity
		   ,T.ReconciledQuantity
		   ,T.TechnicianWd2
		   ,T.CongaVendorName
		   ,T.SerialNumberList
		   ,T.TransactionResults
		   ,T.ServiceReport
		   ,T.InterfaceProcessed
		   ,T.TaxCode
		   ,T.LineFromiPad
		   ,ROUND(T.QuotedMarginPercent, 4)		   AS QuotedMarginPercent
		   ,ROUND(T.QuotedMargin, 4)			   AS QuotedMargin
		   ,ROUND(T.QuotedQuantity, 4)			   AS QuotedQuantity
		   ,ROUND(T.QuotedUnitCost, 4)			   AS QuotedUnitCost
		   ,ROUND(T.QuotedUnitPrice, 4)			   AS QuotedUnitPrice
		   ,T.Quoted
		   ,ROUND(T.TotalQuotedCost, 4)			   AS TotalQuotedCost
		   ,ROUND(T.TotalQuotedPrice, 4)		   AS TotalQuotedPrice
		   ,T.UpdateQuotedWithActuals
		   ,T.CompletedBy
		   ,T.CompletedDate
		   ,ROUND(T.DeadTime, 4)				   AS DeadTime
		   ,T.EntitlementNotes
		   ,T.IsEntitlementPerformed
		   ,T.ServiceMaintenanceContract
		   ,T.SlInventoryIssued
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__Service_Order_Line__c T
			INNER JOIN #CommonRowsTable					  T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Note, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SFLastModifiedDate
	   ,T.LastModifiedDate	AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences											T
		INNER JOIN ODSStaging.SF.vwSVMXC__Service_Order_Line__c T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceOrderLine', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__Service_Order_Line__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;