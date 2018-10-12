﻿CREATE VIEW [SF].[vwServiceMaxRmaShipmentOrder]
AS
SELECT
	[RowId]
   ,[Id]
   ,[OwnerId]
   ,IIF([IsDeleted] = 255, 1, [IsDeleted]) AS [IsDeleted]
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
   ,[Delivery_Option] AS DeliveryOption
   ,[DestinationCity]
   ,[DestinationCountry]
   ,[DestinationLocation]
   ,[DestinationState]
   ,[DestinationStreet]
   ,[DestinationZip]
   ,[EndpointUrl]
   ,[ExpectedDeliveryDate]
   ,[ExpectedReceiveDate]
   ,IIF([IsPartnerRecord] = 255, 1, [IsPartnerRecord]) AS [IsPartnerRecord]
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
   ,IIF([OnHold] = 255, 1, [OnHold]) AS [OnHold]
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
   ,IIF([LocationStocking] = 255, 1, [LocationStocking]) AS [LocationStocking]
   ,[CompanyLegalName]
   ,[ShipToName]
   ,IIF([ChangeShipToInfo] = 255, 1, [ChangeShipToInfo]) AS [ChangeShipToInfo]
   ,[PurchaseOrderVendorPhone]
   ,IIF([PaidWithCreditCard] = 255, 1, [PaidWithCreditCard]) AS [PaidWithCreditCard]
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
FROM [SF].[ServiceMaxRmaShipmentOrder];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwServiceMaxRmaShipmentOrder] TO [OdsUser]
    AS [dbo];

