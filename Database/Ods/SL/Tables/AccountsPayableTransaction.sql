CREATE TABLE [SL].[AccountsPayableTransaction] (
    [RowId]                      INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]                    VARCHAR (10)                                NOT NULL,
    [BatchNumber]                VARCHAR (10)                                NOT NULL,
    [CompanyId]                  VARCHAR (10)                                NOT NULL,
    [CurrencyId]                 VARCHAR (4)                                 NOT NULL,
    [CurrencyRate]               DECIMAL (32, 16)                            NULL,
    [CurrencyTransactionAmount]  DECIMAL (32, 16)                            NULL,
    [DebitOrCredit]              CHAR (1)                                    NOT NULL,
    [EmployeeId]                 VARCHAR (10)                                NOT NULL,
    [FiscalYear]                 VARCHAR (4)                                 NOT NULL,
    [InventoryId]                VARCHAR (30)                                NOT NULL,
    [JournalType]                VARCHAR (3)                                 NOT NULL,
    [PeriodFinancialDate]        DATETIME2 (7)                               NULL,
    [PeriodToPost]               VARCHAR (6)                                 NOT NULL,
    [ProjectId]                  VARCHAR (16)                                NOT NULL,
    [RecordId]                   INT                                         NULL,
    [TransactionReferenceNumber] VARCHAR (10)                                NOT NULL,
    [Released]                   INT                                         NULL,
    [SiteId]                     VARCHAR (10)                                NOT NULL,
    [SubaccountId]               VARCHAR (24)                                NOT NULL,
    [SubSeg1]                    VARCHAR (4)                                 NOT NULL,
    [SubSeg2]                    VARCHAR (4)                                 NOT NULL,
    [TaskId]                     VARCHAR (32)                                NOT NULL,
    [TransactionAmount]          DECIMAL (32, 16)                            NULL,
    [TransactionDate]            DATETIME2 (7)                               NULL,
    [TransactionType]            VARCHAR (2)                                 NOT NULL,
    [VendorId]                   VARCHAR (15)                                NOT NULL,
    [TransactionDescription]     VARCHAR (30)                                NOT NULL,
    [LastUpdate]                 DATETIME2 (7)                               NOT NULL,
    [ImportDate]                 DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKAccountsPayableTransaction] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountsPayableTransactionHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableTransaction_LastUpdate]
    ON [SL].[AccountsPayableTransaction]([LastUpdate] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountsPayableTransaction_BatchNumber_Account_SubaccountId_ReferenceNumber_RecordId]
    ON [SL].[AccountsPayableTransaction]([BatchNumber] ASC, [Account] ASC, [SubaccountId] ASC, [TransactionReferenceNumber] ASC, [RecordId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableTransaction_TransactionReferenceNumber]
    ON [SL].[AccountsPayableTransaction]([TransactionReferenceNumber] ASC)
    INCLUDE([SubaccountId]);


GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableTransaction_JournalType_Released]
    ON [SL].[AccountsPayableTransaction]([JournalType] ASC, [Released] ASC)
    INCLUDE([Account], [BatchNumber], [CompanyId], [CurrencyId], [CurrencyRate], [CurrencyTransactionAmount], [DebitOrCredit], [EmployeeId], [FiscalYear], [InventoryId], [PeriodFinancialDate], [PeriodToPost], [ProjectId], [RecordId], [TransactionReferenceNumber], [SiteId], [SubaccountId], [SubSeg1], [SubSeg2], [TaskId], [TransactionAmount], [TransactionDate], [TransactionType], [VendorId], [TransactionDescription], [LastUpdate]);

