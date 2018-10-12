﻿CREATE TABLE [SF].[ServiceMaxServiceOrderLine] (
    [RowId]                      INT                                         IDENTITY (1, 1) NOT NULL,
    [Id]                         VARCHAR (18)                                NOT NULL,
    [IsDeleted]                  TINYINT                                     NULL,
    [Name]                       VARCHAR (80)                                NULL,
    [RecordTypeId]               VARCHAR (18)                                NULL,
    [CreatedDate]                DATETIME2 (7)                               NULL,
    [CreatedById]                VARCHAR (18)                                NULL,
    [LastModifiedDate]           DATETIME2 (7)                               NULL,
    [LastModifiedById]           VARCHAR (18)                                NULL,
    [SystemModstamp]             DATETIME2 (7)                               NULL,
    [LastViewedDate]             DATETIME2 (7)                               NULL,
    [LastReferencedDate]         DATETIME2 (7)                               NULL,
    [ServiceOrder]               VARCHAR (18)                                NULL,
    [ActivityType]               VARCHAR (255)                               NULL,
    [ActualPrice2]               DECIMAL (32, 16)                            NULL,
    [ActualQuantity2]            DECIMAL (32, 16)                            NULL,
    [CanceledBy]                 VARCHAR (18)                                NULL,
    [CanceledOn]                 DATETIME2 (7)                               NULL,
    [ClosedBy]                   VARCHAR (18)                                NULL,
    [ClosedOn]                   DATETIME2 (7)                               NULL,
    [ConsumedFromLocation]       VARCHAR (18)                                NULL,
    [CostCategory]               VARCHAR (255)                               NULL,
    [DateReceived]               DATETIME2 (7)                               NULL,
    [DateRequested]              DATETIME2 (7)                               NULL,
    [Discount]                   DECIMAL (32, 16)                            NULL,
    [EndDateAndTime]             DATETIME2 (7)                               NULL,
    [EstimatedPrice2]            DECIMAL (32, 16)                            NULL,
    [EstimatedQuantity2]         DECIMAL (32, 16)                            NULL,
    [ExpenseType]                VARCHAR (255)                               NULL,
    [FromLocation]               VARCHAR (18)                                NULL,
    [GroupMember]                VARCHAR (18)                                NULL,
    [IncludeInQuote]             TINYINT                                     NULL,
    [IsBillable]                 TINYINT                                     NULL,
    [LineStatus]                 VARCHAR (255)                               NULL,
    [LineType]                   VARCHAR (255)                               NULL,
    [LogAgainst]                 VARCHAR (255)                               NULL,
    [PostedToInventory]          TINYINT                                     NULL,
    [Product]                    VARCHAR (18)                                NULL,
    [QuantityShipmentInitiated2] DECIMAL (32, 16)                            NULL,
    [QuantityShipped2]           DECIMAL (32, 16)                            NULL,
    [ReceivedCity]               VARCHAR (100)                               NULL,
    [ReceivedCountry]            VARCHAR (255)                               NULL,
    [ReceivedLocation]           VARCHAR (18)                                NULL,
    [ReceivedQuantity2]          DECIMAL (32, 16)                            NULL,
    [ReceivedState]              VARCHAR (100)                               NULL,
    [ReceivedStreet]             VARCHAR (255)                               NULL,
    [ReceivedZip]                VARCHAR (100)                               NULL,
    [ReferenceInformation]       VARCHAR (MAX)                               NULL,
    [RequestedCity]              VARCHAR (100)                               NULL,
    [RequestedCountry]           VARCHAR (255)                               NULL,
    [RequestedLocation]          VARCHAR (18)                                NULL,
    [RequestedQuantity2]         DECIMAL (32, 16)                            NULL,
    [RequestedState]             VARCHAR (100)                               NULL,
    [RequestedStreet]            VARCHAR (255)                               NULL,
    [RequestedZip]               VARCHAR (100)                               NULL,
    [Select]                     TINYINT                                     NULL,
    [SerialNumber]               VARCHAR (18)                                NULL,
    [ServiceGroup]               VARCHAR (18)                                NULL,
    [StartDateAndTime]           DATETIME2 (7)                               NULL,
    [TotalEstimatedPrice]        DECIMAL (32, 16)                            NULL,
    [TotalLinePrice]             DECIMAL (32, 16)                            NULL,
    [UsePriceFromPricebook]      TINYINT                                     NULL,
    [WorkDescription]            NVARCHAR (MAX)                              NULL,
    [EstimateOrActualPrice]      DECIMAL (32, 16)                            NULL,
    [AppliedRateType]            VARCHAR (255)                               NULL,
    [Covered]                    DECIMAL (32, 16)                            NULL,
    [BillableLinePrice]          DECIMAL (32, 16)                            NULL,
    [BillableQuantity]           DECIMAL (32, 16)                            NULL,
    [BillingInformation]         VARCHAR (MAX)                               NULL,
    [ProductWarranty]            VARCHAR (18)                                NULL,
    [WorkDetail]                 VARCHAR (18)                                NULL,
    [Vendor]                     VARCHAR (18)                                NULL,
    [LaborType]                  VARCHAR (255)                               NULL,
    [LaborPricePerUnit]          DECIMAL (32, 16)                            NULL,
    [AddtoInvoice]               TINYINT                                     NULL,
    [ExtendedPrice]              DECIMAL (32, 16)                            NULL,
    [PartSerialNumber]           VARCHAR (18)                                NULL,
    [LaborTime]                  DECIMAL (32, 16)                            NULL,
    [VendorStatus]               VARCHAR (255)                               NULL,
    [SalesTax]                   DECIMAL (32, 16)                            NULL,
    [Invoiced]                   TINYINT                                     NULL,
    [DateInvoiced]               DATETIME2 (7)                               NULL,
    [WorkComplete]               TINYINT                                     NULL,
    [DeliverDate]                DATETIME2 (7)                               NULL,
    [InvoiceDetail]              VARCHAR (18)                                NULL,
    [TotalLinePriceWithTax]      DECIMAL (32, 16)                            NULL,
    [PartsOrderLine]             VARCHAR (18)                                NULL,
    [VendorCostPerUnit]          DECIMAL (32, 16)                            NULL,
    [VendorOrder]                VARCHAR (50)                                NULL,
    [Segment]                    VARCHAR (1300)                              NULL,
    [Supercenter]                VARCHAR (1300)                              NULL,
    [DayComments]                VARCHAR (MAX)                               NULL,
    [InstalledProduct]           VARCHAR (18)                                NULL,
    [UnitofMeasure]              VARCHAR (25)                                NULL,
    [TotalCost]                  DECIMAL (32, 16)                            NULL,
    [InventoryLineQuantity]      DECIMAL (32, 16)                            NULL,
    [ActualTime]                 DECIMAL (32, 16)                            NULL,
    [TechId]                     VARCHAR (1300)                              NULL,
    [HideLine]                   TINYINT                                     NULL,
    [Voucher]                    TINYINT                                     NULL,
    [Technician]                 VARCHAR (18)                                NULL,
    [SortOrder]                  DECIMAL (32, 16)                            NULL,
    [NonInventoryPart]           TINYINT                                     NULL,
    [WdCreatedDate]              DATETIME2 (7)                               NULL,
    [ServiceReportLine]          VARCHAR (255)                               NULL,
    [IntegratedIn06]             TINYINT                                     NULL,
    [ConsumedQuantity]           DECIMAL (32, 16)                            NULL,
    [ConsumptionQuantity]        DECIMAL (32, 16)                            NULL,
    [ConsumedParts]              TINYINT                                     NULL,
    [UsedQuantity]               DECIMAL (32, 16)                            NULL,
    [ReconciledQuantity]         TINYINT                                     NULL,
    [TechnicianWd2]              VARCHAR (18)                                NULL,
    [CongaVendorName]            VARCHAR (1300)                              NULL,
    [SerialNumberList]           VARCHAR (MAX)                               NULL,
    [TransactionResults]         VARCHAR (MAX)                               NULL,
    [ServiceReport]              VARCHAR (18)                                NULL,
    [InterfaceProcessed]         TINYINT                                     NULL,
    [TaxCode]                    VARCHAR (18)                                NULL,
    [LineFromiPad]               TINYINT                                     NULL,
    [QuotedMarginPercent]        DECIMAL (32, 16)                            NULL,
    [QuotedMargin]               DECIMAL (32, 16)                            NULL,
    [QuotedQuantity]             DECIMAL (32, 16)                            NULL,
    [QuotedUnitCost]             DECIMAL (32, 16)                            NULL,
    [QuotedUnitPrice]            DECIMAL (32, 16)                            NULL,
    [Quoted]                     TINYINT                                     NULL,
    [TotalQuotedCost]            DECIMAL (32, 16)                            NULL,
    [TotalQuotedPrice]           DECIMAL (32, 16)                            NULL,
    [UpdateQuotedWithActuals]    TINYINT                                     NULL,
    [CompletedBy]                VARCHAR (18)                                NULL,
    [CompletedDate]              DATETIME2 (7)                               NULL,
    [DeadTime]                   DECIMAL (32, 16)                            NULL,
    [EntitlementNotes]           VARCHAR (MAX)                               NULL,
    [IsEntitlementPerformed]     TINYINT                                     NULL,
    [ServiceMaintenanceContract] VARCHAR (18)                                NULL,
    [SlInventoryIssued]          TINYINT                                     NULL,
    [LastUpdate]                 DATETIME2 (7)                               NOT NULL,
    [ImportDate]                 DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKServiceMaxServiceOrderLine] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SF].[ServiceMaxServiceOrderLineHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ServiceMaxServiceOrderLine_Id]
    ON [SF].[ServiceMaxServiceOrderLine]([Id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ServiceMaxServiceOrderLine_ServiceOrder]
    ON [SF].[ServiceMaxServiceOrderLine]([ServiceOrder] ASC);

