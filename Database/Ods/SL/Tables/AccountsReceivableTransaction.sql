﻿CREATE TABLE [SL].[AccountsReceivableTransaction] (
    [RowId]                      INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]                    VARCHAR (10)                                NOT NULL,
    [BatchNumber]                VARCHAR (10)                                NOT NULL,
    [CompanyId]                  VARCHAR (10)                                NOT NULL,
    [CurrencyId]                 VARCHAR (4)                                 NOT NULL,
    [CurrencyRate]               DECIMAL (32, 16)                            NULL,
    [CurrencyTransactionAmount]  DECIMAL (32, 16)                            NULL,
    [CustomerId]                 VARCHAR (15)                                NOT NULL,
    [DebitOrCredit]              CHAR (1)                                    NOT NULL,
    [FiscalYear]                 VARCHAR (4)                                 NOT NULL,
    [InventoryId]                VARCHAR (30)                                NOT NULL,
    [JournalType]                VARCHAR (3)                                 NOT NULL,
    [LineNumber]                 SMALLINT                                    NULL,
    [PeriodToPost]               VARCHAR (6)                                 NOT NULL,
    [PeriodFinancialDate]        DATETIME2 (7)                               NULL,
    [ProjectId]                  VARCHAR (16)                                NOT NULL,
    [RecordId]                   INT                                         NULL,
    [TransactionReferenceNumber] VARCHAR (10)                                NOT NULL,
    [Released]                   INT                                         NULL,
    [SiteId]                     VARCHAR (10)                                NOT NULL,
    [SalesPersonId]              VARCHAR (10)                                NOT NULL,
    [SubaccountId]               VARCHAR (24)                                NOT NULL,
    [SubSeg1]                    VARCHAR (4)                                 NOT NULL,
    [SubSeg2]                    VARCHAR (4)                                 NOT NULL,
    [TaskId]                     VARCHAR (32)                                NOT NULL,
    [TransactionAmount]          DECIMAL (32, 16)                            NULL,
    [TransactionDate]            DATETIME                                    NULL,
    [TransactionType]            VARCHAR (2)                                 NOT NULL,
    [WarehouseLocation]          VARCHAR (10)                                NOT NULL,
    [TransactionDescription]     VARCHAR (30)                                NOT NULL,
    [LastUpdate]                 DATETIME2 (7)                               NOT NULL,
    [ImportDate]                 DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]                 BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKAccountsReceivableTransaction] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountsReceivableTransactionHistory], DATA_CONSISTENCY_CHECK=ON));
















GO
CREATE NONCLUSTERED INDEX [IX_AccountsReceivableTransaction_LastUpdate]
    ON [SL].[AccountsReceivableTransaction]([LastUpdate] ASC);


GO



GO
CREATE NONCLUSTERED INDEX [IX_AccountsReceivableTransaction_JournalType]
    ON [SL].[AccountsReceivableTransaction]([JournalType] ASC)
    INCLUDE([Account], [BatchNumber], [CompanyId], [CurrencyId], [CurrencyRate], [CurrencyTransactionAmount], [CustomerId], [DebitOrCredit], [FiscalYear], [InventoryId], [PeriodToPost], [PeriodFinancialDate], [ProjectId], [RecordId], [TransactionReferenceNumber], [Released], [SiteId], [SalesPersonId], [SubaccountId], [SubSeg1], [SubSeg2], [TaskId], [TransactionAmount], [TransactionDate], [TransactionType], [WarehouseLocation], [TransactionDescription], [LastUpdate]);


GO
CREATE NONCLUSTERED INDEX [IX_AccountsReceivableTransaction_TransactionReferenceNumber]
    ON [SL].[AccountsReceivableTransaction]([TransactionReferenceNumber] ASC)
    INCLUDE([SubaccountId]);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountsReceivableTransaction_CustomerId_LineNumber_TransactionReferenceNumber_TransactionType_RecordId]
    ON [SL].[AccountsReceivableTransaction]([CustomerId] ASC, [LineNumber] ASC, [TransactionReferenceNumber] ASC, [TransactionType] ASC, [RecordId] ASC)
    INCLUDE([SubaccountId]);

