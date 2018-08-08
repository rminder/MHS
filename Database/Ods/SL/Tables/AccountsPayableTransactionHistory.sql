CREATE TABLE [SL].[AccountsPayableTransactionHistory] (
    [RowId]                      INT              NOT NULL,
    [Account]                    VARCHAR (10)     NOT NULL,
    [BatchNumber]                VARCHAR (10)     NOT NULL,
    [CompanyId]                  VARCHAR (10)     NOT NULL,
    [CurrencyId]                 VARCHAR (4)      NOT NULL,
    [CurrencyRate]               DECIMAL (32, 16) NULL,
    [CurrencyTransactionAmount]  DECIMAL (32, 16) NULL,
    [DebitOrCredit]              CHAR (1)         NOT NULL,
    [EmployeeId]                 VARCHAR (10)     NOT NULL,
    [FiscalYear]                 VARCHAR (4)      NOT NULL,
    [InventoryId]                VARCHAR (30)     NOT NULL,
    [JournalType]                VARCHAR (3)      NOT NULL,
    [PeriodFinancialDate]        DATETIME2 (7)    NULL,
    [PeriodToPost]               VARCHAR (6)      NOT NULL,
    [ProjectId]                  VARCHAR (16)     NOT NULL,
    [RecordId]                   INT              NULL,
    [TransactionReferenceNumber] VARCHAR (10)     NOT NULL,
    [Released]                   INT              NULL,
    [SiteId]                     VARCHAR (10)     NOT NULL,
    [SubaccountId]               VARCHAR (24)     NOT NULL,
    [SubSeg1]                    VARCHAR (4)      NOT NULL,
    [SubSeg2]                    VARCHAR (4)      NOT NULL,
    [TaskId]                     VARCHAR (32)     NOT NULL,
    [TransactionAmount]          DECIMAL (32, 16) NULL,
    [TransactionDate]            DATETIME2 (7)    NULL,
    [TransactionType]            VARCHAR (2)      NOT NULL,
    [VendorId]                   VARCHAR (15)     NOT NULL,
    [TransactionDescription]     VARCHAR (30)     NOT NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL
);




GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableTransactionHistory_RowId]
    ON [SL].[AccountsPayableTransactionHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_AccountsPayableTransactionHistory]
    ON [SL].[AccountsPayableTransactionHistory]([ValidTo] ASC, [ValidFrom] ASC);

