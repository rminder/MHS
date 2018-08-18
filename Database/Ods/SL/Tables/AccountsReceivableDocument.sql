CREATE TABLE [SL].[AccountsReceivableDocument] (
    [RowId]                      INT                                         IDENTITY (1, 1) NOT NULL,
    [CompanyId]                  VARCHAR (10)                                NOT NULL,
    [CustomerId]                 VARCHAR (15)                                NOT NULL,
    [DocumentType]               VARCHAR (2)                                 NOT NULL,
    [TransactionReferenceNumber] VARCHAR (10)                                NOT NULL,
    [BatchNumber]                VARCHAR (10)                                NOT NULL,
    [BatchSequence]              INT                                         NOT NULL,
    [DocumentDate]               DATE                                        NULL,
    [DueDate]                    DATE                                        NULL,
    [DocumentBalance]            DECIMAL (32, 16)                            NULL,
    [CurrencyDocumentBalance]    DECIMAL (32, 16)                            NULL,
    [OriginalDocumentAmount]     DECIMAL (32, 16)                            NULL,
    [SubaccountId]               VARCHAR (10)                                NOT NULL,
    [PeriodToPost]               VARCHAR (6)                                 NOT NULL,
    [WorkOrder]                  VARCHAR (30)                                NOT NULL,
    [Released]                   INT                                         NULL,
    [OpenDocument]               INT                                         NULL,
    [LastUpdate]                 DATETIME2 (7)                               NOT NULL,
    [ImportDate]                 DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKAccountsReceivableDocument] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountsReceivableDocumentHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountsReceivableDocument_CustomerId_DocumentType_TransactonReferenceNumber_BatchNumber_BatchSequence]
    ON [SL].[AccountsReceivableDocument]([CustomerId] ASC, [DocumentType] ASC, [TransactionReferenceNumber] ASC, [BatchNumber] ASC, [BatchSequence] ASC);

