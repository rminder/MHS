CREATE TABLE [SL].[AccountsReceivableTransactionHistory] (
    [RowId]                      INT              NOT NULL,
    [Account]                    VARCHAR (10)     NOT NULL,
    [BatchNumber]                VARCHAR (10)     NOT NULL,
    [CompanyId]                  VARCHAR (10)     NOT NULL,
    [CurrencyId]                 VARCHAR (4)      NOT NULL,
    [CurrencyRate]               DECIMAL (32, 16) NULL,
    [CurrencyTransactionAmount]  DECIMAL (32, 16) NULL,
    [CustomerId]                 VARCHAR (15)     NOT NULL,
    [DebitOrCredit]              CHAR (1)         NOT NULL,
    [FiscalYear]                 VARCHAR (4)      NOT NULL,
    [InventoryId]                VARCHAR (30)     NOT NULL,
    [JournalType]                VARCHAR (3)      NOT NULL,
    [LineNumber]                 SMALLINT         NULL,
    [PeriodToPost]               VARCHAR (6)      NOT NULL,
    [PeriodFinancialDate]        DATETIME2 (7)    NULL,
    [ProjectId]                  VARCHAR (16)     NOT NULL,
    [RecordId]                   INT              NULL,
    [TransactionReferenceNumber] VARCHAR (10)     NOT NULL,
    [Released]                   INT              NULL,
    [SiteId]                     VARCHAR (10)     NOT NULL,
    [SalesPersonId]              VARCHAR (10)     NOT NULL,
    [SubaccountId]               VARCHAR (24)     NOT NULL,
    [SubSeg1]                    VARCHAR (4)      NOT NULL,
    [SubSeg2]                    VARCHAR (4)      NOT NULL,
    [TaskId]                     VARCHAR (32)     NOT NULL,
    [TransactionAmount]          DECIMAL (32, 16) NULL,
    [TransactionDate]            DATETIME         NULL,
    [TransactionType]            VARCHAR (2)      NOT NULL,
    [WarehouseLocation]          VARCHAR (10)     NOT NULL,
    [TransactionDescription]     VARCHAR (30)     NOT NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_AccountsReceivableTransactionHistory]
    ON [SL].[AccountsReceivableTransactionHistory]([ValidTo] ASC, [ValidFrom] ASC);

