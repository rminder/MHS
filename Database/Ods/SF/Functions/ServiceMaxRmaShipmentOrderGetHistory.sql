-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 1-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxRmaShipmentOrderGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxRmaShipmentOrderGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [NVARCHAR](18) NOT NULL,
	[OwnerId] [NVARCHAR](18) NULL,
	[IsDeleted] [TINYINT] NULL,
	[Name] [NVARCHAR](80) NULL,
	[RecordTypeId] [NVARCHAR](18) NULL,
	[CreatedDate] [DATETIME2](7) NULL,
	[CreatedById] [NVARCHAR](18) NULL,
	[LastModifiedDate] [DATETIME2](7) NULL,
	[LastModifiedById] [NVARCHAR](18) NULL,
	[SystemModstamp] [DATETIME2](7) NULL,
	[LastActivityDate] [DATETIME2](7) NULL,
	[LastViewedDate] [DATETIME2](7) NULL,
	[LastReferencedDate] [DATETIME2](7) NULL,
	[BillTo] [NVARCHAR](255) NULL,
	[BillingType] [NVARCHAR](255) NULL,
	[CanceledBy] [NVARCHAR](18) NULL,
	[CanceledOn] [DATETIME2](7) NULL,
	[Case] [NVARCHAR](18) NULL,
	[ClosedBy] [NVARCHAR](18) NULL,
	[ClosedOn] [DATETIME2](7) NULL,
	[Company] [NVARCHAR](18) NULL,
	[Contact] [NVARCHAR](18) NULL,
	[Delivery_Option] [NVARCHAR](255) NULL,
	[DestinationCity] [NVARCHAR](100) NULL,
	[DestinationCountry] [NVARCHAR](255) NULL,
	[DestinationLocation] [NVARCHAR](18) NULL,
	[DestinationState] [NVARCHAR](100) NULL,
	[DestinationStreet] [NVARCHAR](255) NULL,
	[DestinationZip] [NVARCHAR](100) NULL,
	[EndpointUrl] [NVARCHAR](MAX) NULL,
	[ExpectedDeliveryDate] [DATETIME2](7) NULL,
	[ExpectedReceiveDate] [DATETIME2](7) NULL,
	[IsPartnerRecord] [TINYINT] NULL,
	[IsPartner] [NVARCHAR](MAX) NULL,
	[OrderStatus] [NVARCHAR](255) NULL,
	[PartnerAccount] [NVARCHAR](18) NULL,
	[PartnerContact] [NVARCHAR](18) NULL,
	[PartsRequest] [NVARCHAR](18) NULL,
	[Priority] [NVARCHAR](255) NULL,
	[RmaAgeBucket] [NVARCHAR](MAX) NULL,
	[ReceivingCourier] [NVARCHAR](18) NULL,
	[SessionId] [NVARCHAR](MAX) NULL,
	[SalesOrderNumber] [NVARCHAR](100) NULL,
	[ServiceEngineer] [NVARCHAR](18) NULL,
	[ServiceOrder] [NVARCHAR](18) NULL,
	[ShipmentAgeBucket] [NVARCHAR](MAX) NULL,
	[ShipmentReference] [NVARCHAR](18) NULL,
	[ShippingCourier] [NVARCHAR](18) NULL,
	[ShippingReceivingNotes] [NVARCHAR](MAX) NULL,
	[ShippingTerms] [NVARCHAR](255) NULL,
	[SourceCity] [NVARCHAR](100) NULL,
	[SourceCountry] [NVARCHAR](255) NULL,
	[SourceLocation] [NVARCHAR](18) NULL,
	[SourceState] [NVARCHAR](100) NULL,
	[SourceStreet] [NVARCHAR](255) NULL,
	[SourceZip] [NVARCHAR](100) NULL,
	[TrackingNumber] [NVARCHAR](100) NULL,
	[Warehouse] [NVARCHAR](100) NULL,
	[TotalPrice2] [DECIMAL](32, 16) NULL,
	[AddressType] [NVARCHAR](255) NULL,
	[OrderType] [NVARCHAR](255) NULL,
	[FulfillmentType] [NVARCHAR](255) NULL,
	[MasterOrder] [NVARCHAR](18) NULL,
	[OnHold] [TINYINT] NULL,
	[RmaType] [NVARCHAR](255) NULL,
	[Supplier] [NVARCHAR](18) NULL,
	[NumberOfUnitsReturned] [DECIMAL](32, 16) NULL,
	[ShippingProvider] [NVARCHAR](30) NULL,
	[ShipVia] [NVARCHAR](255) NULL,
	[Terms] [NVARCHAR](255) NULL,
	[Buyer] [NVARCHAR](18) NULL,
	[InternalBillTo] [NVARCHAR](18) NULL,
	[PurchaseOrderNumber] [NVARCHAR](12) NULL,
	[Vendor] [NVARCHAR](18) NULL,
	[VendorContact] [NVARCHAR](18) NULL,
	[OpenLines] [DECIMAL](32, 16) NULL,
	[VendorId] [NVARCHAR](10) NULL,
	[TotalPrice] [DECIMAL](32, 16) NULL,
	[MaterialHandlingTotalPrice] [DECIMAL](32, 16) NULL,
	[TotalVendorPrice] [DECIMAL](32, 16) NULL,
	[TotalStandardLinePrice] [DECIMAL](32, 16) NULL,
	[OrderDate1] [DATETIME2](7) NULL,
	[TotalLines] [DECIMAL](32, 16) NULL,
	[ReferenceNotes] [NVARCHAR](30) NULL,
	[LocationStocking] [TINYINT] NULL,
	[CompanyLegalName] [NVARCHAR](100) NULL,
	[ShipToName] [NVARCHAR](100) NULL,
	[ChangeShipToInfo] [TINYINT] NULL,
	[PurchaseOrderVendorPhone] [NVARCHAR](40) NULL,
	[PaidWithCreditCard] [TINYINT] NULL,
	[PaymentCheckDate] [DATETIME2](7) NULL,
	[PaymentCheckNumber] [NVARCHAR](50) NULL,
	[PaymentCreditCard] [NVARCHAR](255) NULL,
	[PaymentDate] [DATETIME2](7) NULL,
	[VendorInvoiceDate] [DATETIME2](7) NULL,
	[VendorInvoiceNumber] [NVARCHAR](50) NULL,
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
	FROM SF.ServiceMaxRmaShipmentOrder FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxRmaShipmentOrder
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
	FROM SF.ServiceMaxRmaShipmentOrder FOR SYSTEM_TIME ALL T 
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
			,[OwnerId]
			,[IsDeleted]
			,[Name]
			,[RecordTypeId]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[BillTo]
			,[BillingType]
			,[CanceledBy]
			,[CanceledOn]
			,[Case]
			,[ClosedBy]
			,[ClosedOn]
			,[Company]
			,[Contact]
			,[Delivery_Option]
			,[DestinationCity]
			,[DestinationCountry]
			,[DestinationLocation]
			,[DestinationState]
			,[DestinationStreet]
			,[DestinationZip]
			,[EndpointUrl]
			,[ExpectedDeliveryDate]
			,[ExpectedReceiveDate]
			,[IsPartnerRecord]
			,[IsPartner]
			,[OrderStatus]
			,[PartnerAccount]
			,[PartnerContact]
			,[PartsRequest]
			,[Priority]
			,[RmaAgeBucket]
			,[ReceivingCourier]
			,[SessionId]
			,[SalesOrderNumber]
			,[ServiceEngineer]
			,[ServiceOrder]
			,[ShipmentAgeBucket]
			,[ShipmentReference]
			,[ShippingCourier]
			,[ShippingReceivingNotes]
			,[ShippingTerms]
			,[SourceCity]
			,[SourceCountry]
			,[SourceLocation]
			,[SourceState]
			,[SourceStreet]
			,[SourceZip]
			,[TrackingNumber]
			,[Warehouse]
			,[TotalPrice2]
			,[AddressType]
			,[OrderType]
			,[FulfillmentType]
			,[MasterOrder]
			,[OnHold]
			,[RmaType]
			,[Supplier]
			,[NumberOfUnitsReturned]
			,[ShippingProvider]
			,[ShipVia]
			,[Terms]
			,[Buyer]
			,[InternalBillTo]
			,[PurchaseOrderNumber]
			,[Vendor]
			,[VendorContact]
			,[OpenLines]
			,[VendorId]
			,[TotalPrice]
			,[MaterialHandlingTotalPrice]
			,[TotalVendorPrice]
			,[TotalStandardLinePrice]
			,[OrderDate1]
			,[TotalLines]
			,[ReferenceNotes]
			,[LocationStocking]
			,[CompanyLegalName]
			,[ShipToName]
			,[ChangeShipToInfo]
			,[PurchaseOrderVendorPhone]
			,[PaidWithCreditCard]
			,[PaymentCheckDate]
			,[PaymentCheckNumber]
			,[PaymentCreditCard]
			,[PaymentDate]
			,[VendorInvoiceDate]
			,[VendorInvoiceNumber]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.ServiceMaxRmaShipmentOrder
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Id]
			,[OwnerId]
			,[IsDeleted]
			,[Name]
			,[RecordTypeId]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[BillTo]
			,[BillingType]
			,[CanceledBy]
			,[CanceledOn]
			,[Case]
			,[ClosedBy]
			,[ClosedOn]
			,[Company]
			,[Contact]
			,[Delivery_Option]
			,[DestinationCity]
			,[DestinationCountry]
			,[DestinationLocation]
			,[DestinationState]
			,[DestinationStreet]
			,[DestinationZip]
			,[EndpointUrl]
			,[ExpectedDeliveryDate]
			,[ExpectedReceiveDate]
			,[IsPartnerRecord]
			,[IsPartner]
			,[OrderStatus]
			,[PartnerAccount]
			,[PartnerContact]
			,[PartsRequest]
			,[Priority]
			,[RmaAgeBucket]
			,[ReceivingCourier]
			,[SessionId]
			,[SalesOrderNumber]
			,[ServiceEngineer]
			,[ServiceOrder]
			,[ShipmentAgeBucket]
			,[ShipmentReference]
			,[ShippingCourier]
			,[ShippingReceivingNotes]
			,[ShippingTerms]
			,[SourceCity]
			,[SourceCountry]
			,[SourceLocation]
			,[SourceState]
			,[SourceStreet]
			,[SourceZip]
			,[TrackingNumber]
			,[Warehouse]
			,[TotalPrice2]
			,[AddressType]
			,[OrderType]
			,[FulfillmentType]
			,[MasterOrder]
			,[OnHold]
			,[RmaType]
			,[Supplier]
			,[NumberOfUnitsReturned]
			,[ShippingProvider]
			,[ShipVia]
			,[Terms]
			,[Buyer]
			,[InternalBillTo]
			,[PurchaseOrderNumber]
			,[Vendor]
			,[VendorContact]
			,[OpenLines]
			,[VendorId]
			,[TotalPrice]
			,[MaterialHandlingTotalPrice]
			,[TotalVendorPrice]
			,[TotalStandardLinePrice]
			,[OrderDate1]
			,[TotalLines]
			,[ReferenceNotes]
			,[LocationStocking]
			,[CompanyLegalName]
			,[ShipToName]
			,[ChangeShipToInfo]
			,[PurchaseOrderVendorPhone]
			,[PaidWithCreditCard]
			,[PaymentCheckDate]
			,[PaymentCheckNumber]
			,[PaymentCreditCard]
			,[PaymentDate]
			,[VendorInvoiceDate]
			,[VendorInvoiceNumber]
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
		,T.OwnerId
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
		,T.BillTo
		,T.BillingType
		,T.CanceledBy
		,T.CanceledOn
		,T.[Case]
		,T.ClosedBy
		,T.ClosedOn
		,T.Company
		,T.Contact
		,T.Delivery_Option
		,T.DestinationCity
		,T.DestinationCountry
		,T.DestinationLocation
		,T.DestinationState
		,T.DestinationStreet
		,T.DestinationZip
		,T.EndpointUrl
		,T.ExpectedDeliveryDate
		,T.ExpectedReceiveDate
		,T.IsPartnerRecord
		,T.IsPartner
		,T.OrderStatus
		,T.PartnerAccount
		,T.PartnerContact
		,T.PartsRequest
		,T.Priority
		,T.RmaAgeBucket
		,T.ReceivingCourier
		,T.SessionId
		,T.SalesOrderNumber
		,T.ServiceEngineer
		,T.ServiceOrder
		,T.ShipmentAgeBucket
		,T.ShipmentReference
		,T.ShippingCourier
		,T.ShippingReceivingNotes
		,T.ShippingTerms
		,T.SourceCity
		,T.SourceCountry
		,T.SourceLocation
		,T.SourceState
		,T.SourceStreet
		,T.SourceZip
		,T.TrackingNumber
		,T.Warehouse
		,T.TotalPrice2
		,T.AddressType
		,T.OrderType
		,T.FulfillmentType
		,T.MasterOrder
		,T.OnHold
		,T.RmaType
		,T.Supplier
		,T.NumberOfUnitsReturned
		,T.ShippingProvider
		,T.ShipVia
		,T.Terms
		,T.Buyer
		,T.InternalBillTo
		,T.PurchaseOrderNumber
		,T.Vendor
		,T.VendorContact
		,T.OpenLines
		,T.VendorId
		,T.TotalPrice
		,T.MaterialHandlingTotalPrice
		,T.TotalVendorPrice
		,T.TotalStandardLinePrice
		,T.OrderDate1
		,T.TotalLines
		,T.ReferenceNotes
		,T.LocationStocking
		,T.CompanyLegalName
		,T.ShipToName
		,T.ChangeShipToInfo
		,T.PurchaseOrderVendorPhone
		,T.PaidWithCreditCard
		,T.PaymentCheckDate
		,T.PaymentCheckNumber
		,T.PaymentCreditCard
		,T.PaymentDate
		,T.VendorInvoiceDate
		,T.VendorInvoiceNumber
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