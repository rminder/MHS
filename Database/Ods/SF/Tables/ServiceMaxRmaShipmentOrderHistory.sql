﻿CREATE TABLE [SF].[ServiceMaxRmaShipmentOrderHistory] (
    [RowId]                      INT              NOT NULL,
    [Id]                         NVARCHAR (18)    NOT NULL,
    [OwnerId]                    NVARCHAR (18)    NULL,
    [IsDeleted]                  TINYINT          NULL,
    [Name]                       NVARCHAR (80)    NULL,
    [RecordTypeId]               NVARCHAR (18)    NULL,
    [CreatedDate]                DATETIME2 (7)    NULL,
    [CreatedById]                NVARCHAR (18)    NULL,
    [LastModifiedDate]           DATETIME2 (7)    NULL,
    [LastModifiedById]           NVARCHAR (18)    NULL,
    [SystemModstamp]             DATETIME2 (7)    NULL,
    [LastActivityDate]           DATETIME2 (7)    NULL,
    [LastViewedDate]             DATETIME2 (7)    NULL,
    [LastReferencedDate]         DATETIME2 (7)    NULL,
    [BillTo]                     NVARCHAR (255)   NULL,
    [BillingType]                NVARCHAR (255)   NULL,
    [CanceledBy]                 NVARCHAR (18)    NULL,
    [CanceledOn]                 DATETIME2 (7)    NULL,
    [Case]                       NVARCHAR (18)    NULL,
    [ClosedBy]                   NVARCHAR (18)    NULL,
    [ClosedOn]                   DATETIME2 (7)    NULL,
    [Company]                    NVARCHAR (18)    NULL,
    [Contact]                    NVARCHAR (18)    NULL,
    [Delivery_Option]            NVARCHAR (255)   NULL,
    [DestinationCity]            NVARCHAR (100)   NULL,
    [DestinationCountry]         NVARCHAR (255)   NULL,
    [DestinationLocation]        NVARCHAR (18)    NULL,
    [DestinationState]           NVARCHAR (100)   NULL,
    [DestinationStreet]          NVARCHAR (255)   NULL,
    [DestinationZip]             NVARCHAR (100)   NULL,
    [EndpointUrl]                NVARCHAR (MAX)   NULL,
    [ExpectedDeliveryDate]       DATETIME2 (7)    NULL,
    [ExpectedReceiveDate]        DATETIME2 (7)    NULL,
    [IsPartnerRecord]            TINYINT          NULL,
    [IsPartner]                  NVARCHAR (MAX)   NULL,
    [OrderStatus]                NVARCHAR (255)   NULL,
    [PartnerAccount]             NVARCHAR (18)    NULL,
    [PartnerContact]             NVARCHAR (18)    NULL,
    [PartsRequest]               NVARCHAR (18)    NULL,
    [Priority]                   NVARCHAR (255)   NULL,
    [RmaAgeBucket]               NVARCHAR (MAX)   NULL,
    [ReceivingCourier]           NVARCHAR (18)    NULL,
    [SessionId]                  NVARCHAR (MAX)   NULL,
    [SalesOrderNumber]           NVARCHAR (100)   NULL,
    [ServiceEngineer]            NVARCHAR (18)    NULL,
    [ServiceOrder]               NVARCHAR (18)    NULL,
    [ShipmentAgeBucket]          NVARCHAR (MAX)   NULL,
    [ShipmentReference]          NVARCHAR (18)    NULL,
    [ShippingCourier]            NVARCHAR (18)    NULL,
    [ShippingReceivingNotes]     NVARCHAR (MAX)   NULL,
    [ShippingTerms]              NVARCHAR (255)   NULL,
    [SourceCity]                 NVARCHAR (100)   NULL,
    [SourceCountry]              NVARCHAR (255)   NULL,
    [SourceLocation]             NVARCHAR (18)    NULL,
    [SourceState]                NVARCHAR (100)   NULL,
    [SourceStreet]               NVARCHAR (255)   NULL,
    [SourceZip]                  NVARCHAR (100)   NULL,
    [TrackingNumber]             NVARCHAR (100)   NULL,
    [Warehouse]                  NVARCHAR (100)   NULL,
    [TotalPrice2]                DECIMAL (32, 16) NULL,
    [AddressType]                NVARCHAR (255)   NULL,
    [OrderType]                  NVARCHAR (255)   NULL,
    [FulfillmentType]            NVARCHAR (255)   NULL,
    [MasterOrder]                NVARCHAR (18)    NULL,
    [OnHold]                     TINYINT          NULL,
    [RmaType]                    NVARCHAR (255)   NULL,
    [Supplier]                   NVARCHAR (18)    NULL,
    [NumberOfUnitsReturned]      DECIMAL (32, 16) NULL,
    [ShippingProvider]           NVARCHAR (30)    NULL,
    [ShipVia]                    NVARCHAR (255)   NULL,
    [Terms]                      NVARCHAR (255)   NULL,
    [Buyer]                      NVARCHAR (18)    NULL,
    [InternalBillTo]             NVARCHAR (18)    NULL,
    [PurchaseOrderNumber]        NVARCHAR (12)    NULL,
    [Vendor]                     NVARCHAR (18)    NULL,
    [VendorContact]              NVARCHAR (18)    NULL,
    [OpenLines]                  DECIMAL (32, 16) NULL,
    [VendorId]                   NVARCHAR (10)    NULL,
    [TotalPrice]                 DECIMAL (32, 16) NULL,
    [MaterialHandlingTotalPrice] DECIMAL (32, 16) NULL,
    [TotalVendorPrice]           DECIMAL (32, 16) NULL,
    [TotalStandardLinePrice]     DECIMAL (32, 16) NULL,
    [OrderDate1]                 DATETIME2 (7)    NULL,
    [TotalLines]                 DECIMAL (32, 16) NULL,
    [ReferenceNotes]             NVARCHAR (30)    NULL,
    [LocationStocking]           TINYINT          NULL,
    [CompanyLegalName]           NVARCHAR (100)   NULL,
    [ShipToName]                 NVARCHAR (100)   NULL,
    [ChangeShipToInfo]           TINYINT          NULL,
    [PurchaseOrderVendorPhone]   NVARCHAR (40)    NULL,
    [PaidWithCreditCard]         TINYINT          NULL,
    [PaymentCheckDate]           DATETIME2 (7)    NULL,
    [PaymentCheckNumber]         NVARCHAR (50)    NULL,
    [PaymentCreditCard]          NVARCHAR (255)   NULL,
    [PaymentDate]                DATETIME2 (7)    NULL,
    [VendorInvoiceDate]          DATETIME2 (7)    NULL,
    [VendorInvoiceNumber]        NVARCHAR (50)    NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_ServiceMaxRmaShipmentOrderHistory_RowId]
    ON [SF].[ServiceMaxRmaShipmentOrderHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_ServiceMaxRmaShipmentOrderHistory]
    ON [SF].[ServiceMaxRmaShipmentOrderHistory]([ValidTo] ASC, [ValidFrom] ASC);
