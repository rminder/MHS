CREATE TABLE [SL].[AccountsPayableDocumentHistory] (
    [RowId]                      INT              NOT NULL,
    [Account]                    VARCHAR (10)     NOT NULL,
    [RecordId]                   INT              NOT NULL,
    [CompanyId]                  VARCHAR (10)     NOT NULL,
    [VendorId]                   VARCHAR (15)     NOT NULL,
    [TransactionReferenceNumber] VARCHAR (10)     NOT NULL,
    [DocumentDate]               DATE             NULL,
    [DueDate]                    DATE             NULL,
    [DiscountDate]               DATE             NULL,
    [DocumentType]               VARCHAR (2)      NOT NULL,
    [DocumentBalance]            DECIMAL (32, 16) NULL,
    [CurrencyDocumentBalance]    DECIMAL (32, 16) NULL,
    [SubaccountId]               VARCHAR (24)     NOT NULL,
    [ProfitCenterId]             VARCHAR (30)     NOT NULL,
    [LocationId]                 VARCHAR (30)     NOT NULL,
    [PeriodToPost]               VARCHAR (6)      NOT NULL,
    [InvoiceNumber]              VARCHAR (15)     NOT NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_AccountsPayableDocumentHistory]
    ON [SL].[AccountsPayableDocumentHistory]([ValidTo] ASC, [ValidFrom] ASC);

