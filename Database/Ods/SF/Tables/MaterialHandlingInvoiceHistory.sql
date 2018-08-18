﻿CREATE TABLE [SF].[MaterialHandlingInvoiceHistory] (
    [RowId]                             INT              NOT NULL,
    [Account]                           VARCHAR (18)     NOT NULL,
    [ActivityType]                      VARCHAR (255)    NOT NULL,
    [AccountSlVendorId]                 VARCHAR (15)     NOT NULL,
    [AccountSlCustomerId]               VARCHAR (15)     NOT NULL,
    [AccountUnityExternalId]            VARCHAR (80)     NOT NULL,
    [AccountFieldOfficeSlCustomerId]    VARCHAR (15)     NOT NULL,
    [AccountFieldOfficeSlVendorId]      VARCHAR (15)     NOT NULL,
    [AccountFieldOfficeUnityExternalId] VARCHAR (80)     NOT NULL,
    [AccountTerms]                      VARCHAR (MAX)    NOT NULL,
    [CallType]                          VARCHAR (MAX)    NOT NULL,
    [Certificate]                       VARCHAR (80)     NOT NULL,
    [Company]                           VARCHAR (MAX)    NOT NULL,
    [ConsumedFromLocation]              VARCHAR (18)     NOT NULL,
    [Contact]                           VARCHAR (18)     NOT NULL,
    [ContactUnityExternalId]            VARCHAR (80)     NOT NULL,
    [CreatedDate]                       DATETIME2 (7)    NULL,
    [CreatedById]                       VARCHAR (18)     NOT NULL,
    [CustomerPo]                        NVARCHAR (35)    NOT NULL,
    [DateInvoiced]                      DATETIME2 (7)    NULL,
    [EndDateAndTime]                    DATETIME2 (7)    NULL,
    [FieldOffice]                       VARCHAR (18)     NOT NULL,
    [HideLine]                          TINYINT          NULL,
    [Id]                                VARCHAR (18)     NOT NULL,
    [InvoiceDetailsCost]                DECIMAL (32, 16) NULL,
    [InvoiceDetailsRevenue]             DECIMAL (32, 16) NULL,
    [InvoiceDetailsSubTotal]            DECIMAL (32, 16) NULL,
    [InvoiceMargin]                     DECIMAL (32, 16) NULL,
    [InvoiceTerms]                      VARCHAR (25)     NOT NULL,
    [InvoiceSalesTaxRollup]             DECIMAL (32, 16) NULL,
    [InvoiceTotal]                      DECIMAL (32, 16) NULL,
    [InvoiceTotalFormula]               DECIMAL (32, 16) NULL,
    [InvoiceTotalRollup]                DECIMAL (32, 16) NULL,
    [InvoiceTotalRollup1]               DECIMAL (32, 16) NULL,
    [IsDeleted]                         TINYINT          NULL,
    [LaborTime]                         DECIMAL (32, 16) NULL,
    [LastActivityDate]                  DATETIME2 (7)    NULL,
    [LastViewedDate]                    DATETIME2 (7)    NULL,
    [LastModifiedById]                  VARCHAR (18)     NOT NULL,
    [LastModifiedDate]                  DATETIME2 (7)    NULL,
    [Location]                          VARCHAR (18)     NOT NULL,
    [LocationAddress]                   VARCHAR (100)    NOT NULL,
    [LocationCity]                      VARCHAR (50)     NOT NULL,
    [LocationState]                     VARCHAR (25)     NOT NULL,
    [LocationZip]                       VARCHAR (15)     NOT NULL,
    [Name]                              VARCHAR (80)     NOT NULL,
    [OwnerId]                           VARCHAR (18)     NOT NULL,
    [PostToPeriod]                      VARCHAR (7)      NOT NULL,
    [RecommendedService]                VARCHAR (MAX)    NOT NULL,
    [RecordTypeId]                      VARCHAR (18)     NOT NULL,
    [SalesTax]                          DECIMAL (32, 16) NULL,
    [Segment]                           VARCHAR (100)    NOT NULL,
    [SegmentFormula]                    VARCHAR (MAX)    NOT NULL,
    [ServiceNotes]                      NVARCHAR (MAX)   NOT NULL,
    [ServiceTeam]                       VARCHAR (255)    NOT NULL,
    [ServiceTeamAddress]                VARCHAR (255)    NOT NULL,
    [ServiceTeamCity]                   VARCHAR (255)    NOT NULL,
    [ServiceTeamState]                  VARCHAR (255)    NOT NULL,
    [ServiceTeamZip]                    VARCHAR (255)    NOT NULL,
    [ServiceTeamLegalName]              VARCHAR (100)    NOT NULL,
    [SlInvoiceDate]                     DATETIME2 (7)    NULL,
    [SlInvoiceId]                       VARCHAR (30)     NOT NULL,
    [SlStatus]                          VARCHAR (1)      NOT NULL,
    [SpWorkPerformed]                   VARCHAR (MAX)    NOT NULL,
    [StartDateAndTime]                  DATETIME2 (7)    NULL,
    [Status]                            VARCHAR (255)    NOT NULL,
    [SubTotal]                          DECIMAL (32, 16) NULL,
    [Supercenter]                       VARCHAR (100)    NOT NULL,
    [SupercenterFormula]                VARCHAR (MAX)    NOT NULL,
    [SystemModstamp]                    DATETIME2 (7)    NULL,
    [TaxAdded]                          DECIMAL (32, 16) NULL,
    [TotalTax]                          DECIMAL (32, 16) NULL,
    [Voucher]                           TINYINT          NULL,
    [VoucherRollupTotal]                DECIMAL (32, 16) NULL,
    [WorkOrderLaborTotal]               DECIMAL (32, 16) NULL,
    [WorkOrderType]                     VARCHAR (MAX)    NOT NULL,
    [WorkOrderPartsTotal]               DECIMAL (32, 16) NULL,
    [WorkOrderTfsTaxTotal]              DECIMAL (32, 16) NULL,
    [WorkDescription]                   NVARCHAR (MAX)   NOT NULL,
    [WorkOrder]                         VARCHAR (18)     NOT NULL,
    [WorkOrderDocumentNumber]           VARCHAR (25)     NOT NULL,
    [LastUpdate]                        DATETIME2 (7)    NOT NULL,
    [ImportDate]                        DATETIME2 (7)    NOT NULL,
    [ValidFrom]                         DATETIME2 (7)    NOT NULL,
    [ValidTo]                           DATETIME2 (7)    NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_MaterialHandlingInvoiceHistory_RowId]
    ON [SF].[MaterialHandlingInvoiceHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_MaterialHandlingInvoiceHistory]
    ON [SF].[MaterialHandlingInvoiceHistory]([ValidTo] ASC, [ValidFrom] ASC);

