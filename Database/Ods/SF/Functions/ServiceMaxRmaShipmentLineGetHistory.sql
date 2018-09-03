-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 3-September, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxRmaShipmentLineGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxRmaShipmentLineGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [nvarchar](18) NOT NULL,
	[IsDeleted] [tinyint] NULL,
	[Name] [nvarchar](80) NULL,
	[RecordTypeId] [nvarchar](18) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime2](7) NULL,
	[RmaShipmentOrder] [nvarchar](18) NULL,
	[ActualQuantity2] [decimal](32, 16) NULL,
	[ActualReceiptDate] [datetime2](7) NULL,
	[ActualShipDate] [datetime2](7) NULL,
	[CanceledBy] [nvarchar](18) NULL,
	[CanceledOn] [datetime2](7) NULL,
	[ClosedBy] [nvarchar](18) NULL,
	[ClosedOn] [datetime2](7) NULL,
	[DiscountPercentage] [decimal](32, 16) NULL,
	[DispositionInstructions] [nvarchar](max) NULL,
	[Disposition] [nvarchar](255) NULL,
	[ExpectedCondition] [nvarchar](255) NULL,
	[ExpectedQuantity2] [decimal](32, 16) NULL,
	[ExpectedReceiptDate] [datetime2](7) NULL,
	[ExpectedShipDate] [datetime2](7) NULL,
	[LinePrice2] [decimal](32, 16) NULL,
	[LineStatus] [nvarchar](255) NULL,
	[LineType] [nvarchar](255) NULL,
	[PackingInstructions] [nvarchar](max) NULL,
	[PartsRequestLine] [nvarchar](18) NULL,
	[PostedToInventory] [tinyint] NULL,
	[Product] [nvarchar](18) NULL,
	[ReturnedCondition] [nvarchar](255) NULL,
	[SalesOrderNumber] [nvarchar](100) NULL,
	[Select] [tinyint] NULL,
	[SerialNumber] [nvarchar](18) NULL,
	[ServiceEngineer] [nvarchar](18) NULL,
	[ServiceOrderLine] [nvarchar](18) NULL,
	[ShipLocation] [nvarchar](18) NULL,
	[TotalLinePrice2] [decimal](32, 16) NULL,
	[UsePriceFromPricebook] [tinyint] NULL,
	[Warehouse] [nvarchar](100) NULL,
	[CaseLine] [nvarchar](18) NULL,
	[DeliveredBy] [nvarchar](18) NULL,
	[DeliveredOn] [datetime2](7) NULL,
	[Delivered] [tinyint] NULL,
	[DeliveryLocation] [nvarchar](18) NULL,
	[MasterOrderLine] [nvarchar](18) NULL,
	[PickedBy] [nvarchar](18) NULL,
	[PickedOn] [datetime2](7) NULL,
	[PickedQuantity] [decimal](32, 16) NULL,
	[Picked] [tinyint] NULL,
	[ReceivedBy] [nvarchar](18) NULL,
	[ReceivedOn] [datetime2](7) NULL,
	[Received] [tinyint] NULL,
	[ReconciliationAction] [nvarchar](255) NULL,
	[RouteCard] [nvarchar](18) NULL,
	[RouteStop] [nvarchar](18) NULL,
	[SerialNumber_List] [nvarchar](max) NULL,
	[ServiceOrder] [nvarchar](18) NULL,
	[ShippedBy] [nvarchar](18) NULL,
	[ShippedOn] [datetime2](7) NULL,
	[Shipped] [tinyint] NULL,
	[WorkOrderCreated] [tinyint] NULL,
	[EntitlementStatus] [nvarchar](255) NULL,
	[FulfillmentQuantity] [decimal](32, 16) NULL,
	[ServiceContractEndDate] [datetime2](7) NULL,
	[ServiceContractStartDate] [datetime2](7) NULL,
	[WarrantyEndDate] [datetime2](7) NULL,
	[WarrantyStartDate] [datetime2](7) NULL,
	[EntitledExchangeType] [nvarchar](255) NULL,
	[StandardCost] [decimal](32, 16) NULL,
	[MaterialHandlingTotalVendorLinePrice] [decimal](32, 16) NULL,
	[ProductName] [nvarchar](max) NULL,
	[VendorPrice] [decimal](32, 16) NULL,
	[TotalStandardLinePrice] [decimal](32, 16) NULL,
	[PartNumber] [nvarchar](max) NULL,
	[ShipVia] [nvarchar](255) NULL,
	[CrossReferenceDescription] [nvarchar](max) NULL,
	[CrossReferencePart] [nvarchar](max) NULL,
	[ProductCrossReference] [nvarchar](18) NULL,
	[OrderType] [nvarchar](max) NULL,
	[ToLocationSupercenter] [nvarchar](max) NULL,
	[ToLocationSegment] [nvarchar](max) NULL,
	[SLVendorId] [nvarchar](max) NULL,
	[CompanyId] [nvarchar](max) NULL,
	[PartOrderName] [nvarchar](max) NULL,
	[ProductCodePd] [nvarchar](100) NULL,
	[TransactionResults] [nvarchar](max) NULL,
	[Description] [nvarchar](1000) NULL,
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
	FROM SF.ServiceMaxRmaShipmentLine FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxRmaShipmentLine
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
	FROM SF.ServiceMaxRmaShipmentLine FOR SYSTEM_TIME ALL T 
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
			,[RmaShipmentOrder]
			,[ActualQuantity2]
			,[ActualReceiptDate]
			,[ActualShipDate]
			,[CanceledBy]
			,[CanceledOn]
			,[ClosedBy]
			,[ClosedOn]
			,[DiscountPercentage]
			,[DispositionInstructions]
			,[Disposition]
			,[ExpectedCondition]
			,[ExpectedQuantity2]
			,[ExpectedReceiptDate]
			,[ExpectedShipDate]
			,[LinePrice2]
			,[LineStatus]
			,[LineType]
			,[PackingInstructions]
			,[PartsRequestLine]
			,[PostedToInventory]
			,[Product]
			,[ReturnedCondition]
			,[SalesOrderNumber]
			,[Select]
			,[SerialNumber]
			,[ServiceEngineer]
			,[ServiceOrderLine]
			,[ShipLocation]
			,[TotalLinePrice2]
			,[UsePriceFromPricebook]
			,[Warehouse]
			,[CaseLine]
			,[DeliveredBy]
			,[DeliveredOn]
			,[Delivered]
			,[DeliveryLocation]
			,[MasterOrderLine]
			,[PickedBy]
			,[PickedOn]
			,[PickedQuantity]
			,[Picked]
			,[ReceivedBy]
			,[ReceivedOn]
			,[Received]
			,[ReconciliationAction]
			,[RouteCard]
			,[RouteStop]
			,[SerialNumber_List]
			,[ServiceOrder]
			,[ShippedBy]
			,[ShippedOn]
			,[Shipped]
			,[WorkOrderCreated]
			,[EntitlementStatus]
			,[FulfillmentQuantity]
			,[ServiceContractEndDate]
			,[ServiceContractStartDate]
			,[WarrantyEndDate]
			,[WarrantyStartDate]
			,[EntitledExchangeType]
			,[StandardCost]
			,[MaterialHandlingTotalVendorLinePrice]
			,[ProductName]
			,[VendorPrice]
			,[TotalStandardLinePrice]
			,[PartNumber]
			,[ShipVia]
			,[CrossReferenceDescription]
			,[CrossReferencePart]
			,[ProductCrossReference]
			,[OrderType]
			,[ToLocationSupercenter]
			,[ToLocationSegment]
			,[SLVendorId]
			,[CompanyId]
			,[PartOrderName]
			,[ProductCodePd]
			,[TransactionResults]
			,[Description]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.ServiceMaxRmaShipmentLine
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
			,[RmaShipmentOrder]
			,[ActualQuantity2]
			,[ActualReceiptDate]
			,[ActualShipDate]
			,[CanceledBy]
			,[CanceledOn]
			,[ClosedBy]
			,[ClosedOn]
			,[DiscountPercentage]
			,[DispositionInstructions]
			,[Disposition]
			,[ExpectedCondition]
			,[ExpectedQuantity2]
			,[ExpectedReceiptDate]
			,[ExpectedShipDate]
			,[LinePrice2]
			,[LineStatus]
			,[LineType]
			,[PackingInstructions]
			,[PartsRequestLine]
			,[PostedToInventory]
			,[Product]
			,[ReturnedCondition]
			,[SalesOrderNumber]
			,[Select]
			,[SerialNumber]
			,[ServiceEngineer]
			,[ServiceOrderLine]
			,[ShipLocation]
			,[TotalLinePrice2]
			,[UsePriceFromPricebook]
			,[Warehouse]
			,[CaseLine]
			,[DeliveredBy]
			,[DeliveredOn]
			,[Delivered]
			,[DeliveryLocation]
			,[MasterOrderLine]
			,[PickedBy]
			,[PickedOn]
			,[PickedQuantity]
			,[Picked]
			,[ReceivedBy]
			,[ReceivedOn]
			,[Received]
			,[ReconciliationAction]
			,[RouteCard]
			,[RouteStop]
			,[SerialNumber_List]
			,[ServiceOrder]
			,[ShippedBy]
			,[ShippedOn]
			,[Shipped]
			,[WorkOrderCreated]
			,[EntitlementStatus]
			,[FulfillmentQuantity]
			,[ServiceContractEndDate]
			,[ServiceContractStartDate]
			,[WarrantyEndDate]
			,[WarrantyStartDate]
			,[EntitledExchangeType]
			,[StandardCost]
			,[MaterialHandlingTotalVendorLinePrice]
			,[ProductName]
			,[VendorPrice]
			,[TotalStandardLinePrice]
			,[PartNumber]
			,[ShipVia]
			,[CrossReferenceDescription]
			,[CrossReferencePart]
			,[ProductCrossReference]
			,[OrderType]
			,[ToLocationSupercenter]
			,[ToLocationSegment]
			,[SLVendorId]
			,[CompanyId]
			,[PartOrderName]
			,[ProductCodePd]
			,[TransactionResults]
			,[Description]
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
		,T.RecordTypeId
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,T.RmaShipmentOrder
		,T.ActualQuantity2
		,T.ActualReceiptDate
		,T.ActualShipDate
		,T.CanceledBy
		,T.CanceledOn
		,T.ClosedBy
		,T.ClosedOn
		,T.DiscountPercentage
		,T.DispositionInstructions
		,T.Disposition
		,T.ExpectedCondition
		,T.ExpectedQuantity2
		,T.ExpectedReceiptDate
		,T.ExpectedShipDate
		,T.LinePrice2
		,T.LineStatus
		,T.LineType
		,T.PackingInstructions
		,T.PartsRequestLine
		,T.PostedToInventory
		,T.Product
		,T.ReturnedCondition
		,T.SalesOrderNumber
		,T.[Select]
		,T.SerialNumber
		,T.ServiceEngineer
		,T.ServiceOrderLine
		,T.ShipLocation
		,T.TotalLinePrice2
		,T.UsePriceFromPricebook
		,T.Warehouse
		,T.CaseLine
		,T.DeliveredBy
		,T.DeliveredOn
		,T.Delivered
		,T.DeliveryLocation
		,T.MasterOrderLine
		,T.PickedBy
		,T.PickedOn
		,T.PickedQuantity
		,T.Picked
		,T.ReceivedBy
		,T.ReceivedOn
		,T.Received
		,T.ReconciliationAction
		,T.RouteCard
		,T.RouteStop
		,T.SerialNumber_List
		,T.ServiceOrder
		,T.ShippedBy
		,T.ShippedOn
		,T.Shipped
		,T.WorkOrderCreated
		,T.EntitlementStatus
		,T.FulfillmentQuantity
		,T.ServiceContractEndDate
		,T.ServiceContractStartDate
		,T.WarrantyEndDate
		,T.WarrantyStartDate
		,T.EntitledExchangeType
		,T.StandardCost
		,T.MaterialHandlingTotalVendorLinePrice
		,T.ProductName
		,T.VendorPrice
		,T.TotalStandardLinePrice
		,T.PartNumber
		,T.ShipVia
		,T.CrossReferenceDescription
		,T.CrossReferencePart
		,T.ProductCrossReference
		,T.OrderType
		,T.ToLocationSupercenter
		,T.ToLocationSegment
		,T.SLVendorId
		,T.CompanyId
		,T.PartOrderName
		,T.ProductCodePd
		,T.TransactionResults
		,T.Description
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