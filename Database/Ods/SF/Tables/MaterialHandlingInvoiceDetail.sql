﻿CREATE TABLE [SF].[MaterialHandlingInvoiceDetail] (
    [RowId]                               INT                                         IDENTITY (1, 1) NOT NULL,
    [Id]                                  VARCHAR (18)                                NOT NULL,
    [IsDeleted]                           TINYINT                                     NULL,
    [Name]                                VARCHAR (80)                                NOT NULL,
    [RecordTypeId]                        VARCHAR (18)                                NOT NULL,
    [CreatedDate]                         DATETIME2 (7)                               NULL,
    [CreatedById]                         VARCHAR (18)                                NOT NULL,
    [LastModifiedDate]                    DATETIME2 (7)                               NULL,
    [LastModifiedById]                    VARCHAR (18)                                NOT NULL,
    [SystemModstamp]                      DATETIME2 (7)                               NULL,
    [LastActivityDate]                    DATETIME2 (7)                               NULL,
    [LastViewedDate]                      DATETIME2 (7)                               NULL,
    [LastReferencedDate]                  DATETIME2 (7)                               NULL,
    [WorkOrder]                           VARCHAR (18)                                NOT NULL,
    [Vendor]                              VARCHAR (18)                                NOT NULL,
    [LineType]                            VARCHAR (255)                               NOT NULL,
    [Part]                                VARCHAR (18)                                NOT NULL,
    [LinePricePerUnit]                    DECIMAL (32, 16)                            NULL,
    [LineQuantity]                        DECIMAL (32, 16)                            NULL,
    [SalesTax]                            DECIMAL (32, 16)                            NULL,
    [Invoice]                             VARCHAR (18)                                NOT NULL,
    [AddToInvoice]                        TINYINT                                     NULL,
    [DateInvoiced]                        DATETIME2 (7)                               NULL,
    [ActivityType]                        VARCHAR (255)                               NOT NULL,
    [TotalLinePrice]                      DECIMAL (32, 16)                            NULL,
    [WorkDetail]                          VARCHAR (18)                                NOT NULL,
    [TLinePricePerUnit]                   VARCHAR (MAX)                               NOT NULL,
    [InvoiceStatus]                       VARCHAR (MAX)                               NOT NULL,
    [WorkDescription]                     NVARCHAR (MAX)                              NOT NULL,
    [UnitOfMeasure]                       VARCHAR (255)                               NOT NULL,
    [HideLine]                            TINYINT                                     NULL,
    [TotalLinePriceFormula]               DECIMAL (32, 16)                            NULL,
    [SortOrder]                           DECIMAL (32, 16)                            NULL,
    [DetailLineCost]                      DECIMAL (32, 16)                            NULL,
    [AccountVendorSlVendorId]             VARCHAR (15)                                NOT NULL,
    [InterfaceProcessed]                  TINYINT                                     NULL,
    [AccountVendorSlCustomerId]           VARCHAR (15)                                NOT NULL,
    [AccountVendorUnityAccountExternalId] VARCHAR (80)                                NOT NULL,
    [Product2PartUnityProductExternalId]  VARCHAR (80)                                NOT NULL,
    [LastUpdate]                          DATETIME2 (7)                               NOT NULL,
    [ImportDate]                          DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                           DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                             DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKMaterialHandlingInvoiceDetail] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SF].[MaterialHandlingInvoiceDetailHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MaterialHandlingInvoiceDetail_Id]
    ON [SF].[MaterialHandlingInvoiceDetail]([Id] ASC);

