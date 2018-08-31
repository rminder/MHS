-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 29-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxServiceOrderLineGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxServiceOrderLineGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [varchar](18) NOT NULL,
	[IsDeleted] [tinyint] NULL,
	[Name] [varchar](80) NULL,
	[RecordTypeId] [varchar](18) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [varchar](18) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[LastModifiedById] [varchar](18) NULL,
	[SystemModstamp] [datetime2](7) NULL,
	[LastViewedDate] [datetime2](7) NULL,
	[LastReferencedDate] [datetime2](7) NULL,
	[ServiceOrder] [varchar](18) NULL,
	[ActivityType] [varchar](255) NULL,
	[ActualPrice2] [decimal](32, 16) NULL,
	[ActualQuantity2] [decimal](32, 16) NULL,
	[CanceledBy] [varchar](18) NULL,
	[CanceledOn] [datetime2](7) NULL,
	[ClosedBy] [varchar](18) NULL,
	[ClosedOn] [datetime2](7) NULL,
	[ConsumedFromLocation] [varchar](18) NULL,
	[CostCategory] [varchar](255) NULL,
	[DateReceived] [datetime2](7) NULL,
	[DateRequested] [datetime2](7) NULL,
	[Discount] [decimal](32, 16) NULL,
	[EndDateAndTime] [datetime2](7) NULL,
	[EstimatedPrice2] [decimal](32, 16) NULL,
	[EstimatedQuantity2] [decimal](32, 16) NULL,
	[ExpenseType] [varchar](255) NULL,
	[FromLocation] [varchar](18) NULL,
	[GroupMember] [varchar](18) NULL,
	[IncludeInQuote] [tinyint] NULL,
	[IsBillable] [tinyint] NULL,
	[LineStatus] [varchar](255) NULL,
	[LineType] [varchar](255) NULL,
	[LogAgainst] [varchar](255) NULL,
	[PostedToInventory] [tinyint] NULL,
	[Product] [varchar](18) NULL,
	[QuantityShipmentInitiated2] [decimal](32, 16) NULL,
	[QuantityShipped2] [decimal](32, 16) NULL,
	[ReceivedCity] [varchar](100) NULL,
	[ReceivedCountry] [varchar](255) NULL,
	[ReceivedLocation] [varchar](18) NULL,
	[ReceivedQuantity2] [decimal](32, 16) NULL,
	[ReceivedState] [varchar](100) NULL,
	[ReceivedStreet] [varchar](255) NULL,
	[ReceivedZip] [varchar](100) NULL,
	[ReferenceInformation] [varchar](max) NULL,
	[RequestedCity] [varchar](100) NULL,
	[RequestedCountry] [varchar](255) NULL,
	[RequestedLocation] [varchar](18) NULL,
	[RequestedQuantity2] [decimal](32, 16) NULL,
	[RequestedState] [varchar](100) NULL,
	[RequestedStreet] [varchar](255) NULL,
	[RequestedZip] [varchar](100) NULL,
	[Select] [tinyint] NULL,
	[SerialNumber] [varchar](18) NULL,
	[ServiceGroup] [varchar](18) NULL,
	[StartDateAndTime] [datetime2](7) NULL,
	[TotalEstimatedPrice] [decimal](32, 16) NULL,
	[TotalLinePrice] [decimal](32, 16) NULL,
	[UsePriceFromPricebook] [tinyint] NULL,
	[WorkDescription] [nvarchar](max) NULL,
	[EstimateOrActualPrice] [decimal](32, 16) NULL,
	[AppliedRateType] [varchar](255) NULL,
	[Covered] [decimal](32, 16) NULL,
	[BillableLinePrice] [decimal](32, 16) NULL,
	[BillableQuantity] [decimal](32, 16) NULL,
	[BillingInformation] [varchar](max) NULL,
	[ProductWarranty] [varchar](18) NULL,
	[WorkDetail] [varchar](18) NULL,
	[Vendor] [varchar](18) NULL,
	[LaborType] [varchar](255) NULL,
	[LaborPricePerUnit] [decimal](32, 16) NULL,
	[AddtoInvoice] [tinyint] NULL,
	[ExtendedPrice] [decimal](32, 16) NULL,
	[PartSerialNumber] [varchar](18) NULL,
	[LaborTime] [decimal](32, 16) NULL,
	[VendorStatus] [varchar](255) NULL,
	[SalesTax] [decimal](32, 16) NULL,
	[Invoiced] [tinyint] NULL,
	[DateInvoiced] [datetime2](7) NULL,
	[WorkComplete] [tinyint] NULL,
	[DeliverDate] [datetime2](7) NULL,
	[InvoiceDetail] [varchar](18) NULL,
	[TotalLinePriceWithTax] [decimal](32, 16) NULL,
	[PartsOrderLine] [varchar](18) NULL,
	[VendorCostPerUnit] [decimal](32, 16) NULL,
	[VendorOrder] [varchar](50) NULL,
	[Segment] [varchar](1300) NULL,
	[Supercenter] [varchar](1300) NULL,
	[DayComments] [varchar](max) NULL,
	[InstalledProduct] [varchar](18) NULL,
	[UnitofMeasure] [varchar](25) NULL,
	[TotalCost] [decimal](32, 16) NULL,
	[InventoryLineQuantity] [decimal](32, 16) NULL,
	[ActualTime] [decimal](32, 16) NULL,
	[TechId] [varchar](1300) NULL,
	[HideLine] [tinyint] NULL,
	[Voucher] [tinyint] NULL,
	[Technician] [varchar](18) NULL,
	[SortOrder] [decimal](32, 16) NULL,
	[NonInventoryPart] [tinyint] NULL,
	[WdCreatedDate] [datetime2](7) NULL,
	[ServiceReportLine] [varchar](255) NULL,
	[IntegratedIn06] [tinyint] NULL,
	[ConsumedQuantity] [decimal](32, 16) NULL,
	[ConsumptionQuantity] [decimal](32, 16) NULL,
	[ConsumedParts] [tinyint] NULL,
	[UsedQuantity] [decimal](32, 16) NULL,
	[ReconciledQuantity] [tinyint] NULL,
	[TechnicianWd2] [varchar](18) NULL,
	[CongaVendorName] [varchar](1300) NULL,
	[SerialNumberList] [varchar](max) NULL,
	[TransactionResults] [varchar](max) NULL,
	[ServiceReport] [varchar](18) NULL,
	[InterfaceProcessed] [tinyint] NULL,
	[TaxCode] [varchar](18) NULL,
	[LineFromiPad] [tinyint] NULL,
	[QuotedMarginPercent] [decimal](32, 16) NULL,
	[QuotedMargin] [decimal](32, 16) NULL,
	[QuotedQuantity] [decimal](32, 16) NULL,
	[QuotedUnitCost] [decimal](32, 16) NULL,
	[QuotedUnitPrice] [decimal](32, 16) NULL,
	[Quoted] [tinyint] NULL,
	[TotalQuotedCost] [decimal](32, 16) NULL,
	[TotalQuotedPrice] [decimal](32, 16) NULL,
	[UpdateQuotedWithActuals] [tinyint] NULL,
	[CompletedBy] [varchar](18) NULL,
	[CompletedDate] [datetime2](7) NULL,
	[DeadTime] [decimal](32, 16) NULL,
	[EntitlementNotes] [varchar](max) NULL,
	[IsEntitlementPerformed] [tinyint] NULL,
	[ServiceMaintenanceContract] [varchar](18) NULL,
	[SlInventoryIssued] [tinyint] NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL,
	[__Operation] CHAR(1) NOT NULL,
	[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	DECLARE @DistinctPKValue TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)
	)
	DECLARE @ActivityTable TABLE 
	(
		RowId BIGINT NOT NULL,
		ValidFrom DATETIME2	 NOT NULL,
		ValidTo DATETIME2 NOT NULL,
		RowNumber INT NOT NULL,
		MaxRowNumber INT NOT NULL,
		UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	)
	DECLARE @EndDateTableState TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)	
	)
	DECLARE @InsertUpdateDeleteTable TABLE 
	(
		RowId BIGINT NOT NULL,
		Operation CHAR(1) NOT NULL,
		OperationDate DATETIME2 NOT NULL,
		UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	)

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT RowId
	FROM SF.ServiceMaxServiceOrderLine FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxServiceOrderLine
		FOR SYSTEM_TIME AS OF @EndDateUtc T
	INNER JOIN @EndDateTableState T2 ON T2.RowId = T.RowId

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		 T.RowId
		,ValidFrom
		,ValidTo
		,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
		,SUM(1) OVER (PARTITION BY T.RowId) AS MaxRowNumber
	FROM SF.ServiceMaxServiceOrderLine FOR SYSTEM_TIME ALL T 
	INNER JOIN @DistinctPKValue T2 ON T2.RowId = T.RowId

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT Into @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
		,'I' AS Operation
		,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE RowNumber = 1 AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc

	-- Store all the deletes. A delete can be identified by a row in @ActivityTable where RowNumber = MaxRowNumber and the row
	-- doesn't exist in @EndDateStateTable
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
	   ,'D'		AS Operation
	   ,ValidTo AS OperationDate
	FROM @ActivityTable				 T
		LEFT JOIN @EndDateTableState T2 ON T2.RowId = T.RowId
	WHERE
		T.RowNumber = T.MaxRowNumber
		AND T2.RowId IS NULL;

	-- Store all updates. An update can be identified by a row whose RowNumber > 1. If a row is inserted and then deleted (with no updates)
	-- there will only be a single row in history. Each time a row is updated, an entry is added to history. Therefore, the total number of
	-- updates for a row will be maximum row number - 1.
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
		,'U' AS Operation
		,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;WITH BaseTableActivity AS
	(
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
		FROM SF.ServiceMaxServiceOrderLine
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
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
			,__Operation
			,__OperationDate
		)
	SELECT DISTINCT
		 T.[RowId]
		,T.Id
		,T.IsDeleted
		,T.Name
		,[RecordTypeId]
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,T.LastViewedDate
		,T.LastReferencedDate
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
		,T.[Select]
		,[SerialNumber]
		,T.ServiceGroup
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
		,T.LastUpdate
		,T.ImportDate
		,T.ValidFrom
		,T.ValidTo
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END