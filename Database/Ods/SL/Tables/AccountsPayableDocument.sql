CREATE TABLE [SL].[AccountsPayableDocument] (
    [RowId]                      INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]                    VARCHAR (10)                                NOT NULL,
    [RecordId]                   INT                                         NOT NULL,
    [CompanyId]                  VARCHAR (10)                                NOT NULL,
    [VendorId]                   VARCHAR (15)                                NOT NULL,
    [TransactionReferenceNumber] VARCHAR (10)                                NOT NULL,
    [BatchNumber]                VARCHAR (10)                                NOT NULL,
    [DocumentDate]               DATE                                        NULL,
    [DueDate]                    DATE                                        NULL,
    [DiscountDate]               DATE                                        NULL,
    [DocumentType]               VARCHAR (2)                                 NOT NULL,
    [DocumentBalance]            DECIMAL (32, 16)                            NULL,
    [CurrencyDocumentBalance]    DECIMAL (32, 16)                            NULL,
    [SubaccountId]               VARCHAR (24)                                NOT NULL,
    [ProfitCenterId]             VARCHAR (30)                                NOT NULL,
    [LocationId]                 VARCHAR (30)                                NOT NULL,
    [PeriodToPost]               VARCHAR (6)                                 NOT NULL,
    [InvoiceNumber]              VARCHAR (15)                                NOT NULL,
    [Released]                   INT                                         NULL,
    [OpenDocument]               INT                                         NULL,
    [LastUpdate]                 DATETIME2 (7)                               NOT NULL,
    [ImportDate]                 DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKAccountsPayableDocument] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountsPayableDocumentHistory], DATA_CONSISTENCY_CHECK=ON));








GO



GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableDocument_LastUpdate]
    ON [SL].[AccountsPayableDocument]([LastUpdate] ASC);

