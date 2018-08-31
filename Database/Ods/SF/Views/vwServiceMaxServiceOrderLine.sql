﻿CREATE VIEW SF.vwServiceMaxServiceOrderLine
AS
SELECT
	[RowId]
   ,[Id]
   ,[IsDeleted]
   ,[Name]
   ,[RecordTypeId]
   ,[CreatedDate]
   ,[CreatedById]
   ,[LastModifiedDate]
   ,[LastModifiedById]
   ,[SystemModstamp]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,[ServiceOrder]
   ,[ActivityType]
   ,[ActualPrice2]
   ,[ActualQuantity2]
   ,[CanceledBy]
   ,[CanceledOn]
   ,[ClosedBy]
   ,[ClosedOn]
   ,[ConsumedFromLocation]
   ,[CostCategory]
   ,[DateReceived]
   ,[DateRequested]
   ,[Discount]
   ,[EndDateAndTime]
   ,[EstimatedPrice2]
   ,[EstimatedQuantity2]
   ,[ExpenseType]
   ,[FromLocation]
   ,[GroupMember]
   ,[IncludeInQuote]
   ,[IsBillable]
   ,[LineStatus]
   ,[LineType]
   ,[LogAgainst]
   ,[PostedToInventory]
   ,[Product]
   ,[QuantityShipmentInitiated2]
   ,[QuantityShipped2]
   ,[ReceivedCity]
   ,[ReceivedCountry]
   ,[ReceivedLocation]
   ,[ReceivedQuantity2]
   ,[ReceivedState]
   ,[ReceivedStreet]
   ,[ReceivedZip]
   ,[ReferenceInformation]
   ,[RequestedCity]
   ,[RequestedCountry]
   ,[RequestedLocation]
   ,[RequestedQuantity2]
   ,[RequestedState]
   ,[RequestedStreet]
   ,[RequestedZip]
   ,[Select]
   ,[SerialNumber]
   ,[ServiceGroup]
   ,[StartDateAndTime]
   ,[TotalEstimatedPrice]
   ,[TotalLinePrice]
   ,[UsePriceFromPricebook]
   ,[WorkDescription]
   ,[EstimateOrActualPrice]
   ,[AppliedRateType]
   ,[Covered]
   ,[BillableLinePrice]
   ,[BillableQuantity]
   ,[BillingInformation]
   ,[ProductWarranty]
   ,[WorkDetail]
   ,[Vendor]
   ,[LaborType]
   ,[LaborPricePerUnit]
   ,[AddtoInvoice]
   ,[ExtendedPrice]
   ,[PartSerialNumber]
   ,[LaborTime]
   ,[VendorStatus]
   ,[SalesTax]
   ,[Invoiced]
   ,[DateInvoiced]
   ,[WorkComplete]
   ,[DeliverDate]
   ,[InvoiceDetail]
   ,[TotalLinePriceWithTax]
   ,[PartsOrderLine]
   ,[VendorCostPerUnit]
   ,[VendorOrder]
   ,[Segment]
   ,[Supercenter]
   ,[DayComments]
   ,[InstalledProduct]
   ,[UnitofMeasure]
   ,[TotalCost]
   ,[InventoryLineQuantity]
   ,[ActualTime]
   ,[TechId]
   ,[HideLine]
   ,[Voucher]
   ,[Technician]
   ,[SortOrder]
   ,[NonInventoryPart]
   ,[WdCreatedDate]
   ,[ServiceReportLine]
   ,[IntegratedIn06]
   ,[ConsumedQuantity]
   ,[ConsumptionQuantity]
   ,[ConsumedParts]
   ,[UsedQuantity]
   ,[ReconciledQuantity]
   ,[TechnicianWd2]
   ,[CongaVendorName]
   ,[SerialNumberList]
   ,[TransactionResults]
   ,[ServiceReport]
   ,[InterfaceProcessed]
   ,[TaxCode]
   ,[LineFromiPad]
   ,[QuotedMarginPercent]
   ,[QuotedMargin]
   ,[QuotedQuantity]
   ,[QuotedUnitCost]
   ,[QuotedUnitPrice]
   ,[Quoted]
   ,[TotalQuotedCost]
   ,[TotalQuotedPrice]
   ,[UpdateQuotedWithActuals]
   ,[CompletedBy]
   ,[CompletedDate]
   ,[DeadTime]
   ,[EntitlementNotes]
   ,[IsEntitlementPerformed]
   ,[ServiceMaintenanceContract]
   ,[SlInventoryIssued]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SF].[ServiceMaxServiceOrderLine];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwServiceMaxServiceOrderLine] TO [OdsUser]
    AS [dbo];
