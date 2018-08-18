CREATE TABLE [SL].[AccountsReceivableDocumentHistory] (
    [RowId]                      INT              NOT NULL,
    [CompanyId]                  VARCHAR (10)     NOT NULL,
    [CustomerId]                 VARCHAR (15)     NOT NULL,
    [DocumentType]               VARCHAR (2)      NOT NULL,
    [TransactionReferenceNumber] VARCHAR (10)     NOT NULL,
    [BatchNumber]                VARCHAR (10)     NOT NULL,
    [BatchSequence]              INT              NOT NULL,
    [DocumentDate]               DATE             NULL,
    [DueDate]                    DATE             NULL,
    [DocumentBalance]            DECIMAL (32, 16) NULL,
    [CurrencyDocumentBalance]    DECIMAL (32, 16) NULL,
    [OriginalDocumentAmount]     DECIMAL (32, 16) NULL,
    [SubaccountId]               VARCHAR (10)     NOT NULL,
    [PeriodToPost]               VARCHAR (6)      NOT NULL,
    [WorkOrder]                  VARCHAR (30)     NOT NULL,
    [Released]                   INT              NULL,
    [OpenDocument]               INT              NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL
);




GO
CREATE CLUSTERED INDEX [ix_AccountsReceivableDocumentHistory]
    ON [SL].[AccountsReceivableDocumentHistory]([ValidTo] ASC, [ValidFrom] ASC);

