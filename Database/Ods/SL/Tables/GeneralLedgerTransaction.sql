CREATE TABLE [SL].[GeneralLedgerTransaction] (
    [RowId]                      INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]                    VARCHAR (10)                                NOT NULL,
    [BaseCurrencyId]             VARCHAR (4)                                 NOT NULL,
    [BatchNumber]                VARCHAR (10)                                NOT NULL,
    [CompanyId]                  VARCHAR (10)                                NOT NULL,
    [CreditAmount]               DECIMAL (32, 16)                            NULL,
    [CurrencyCreditAmount]       DECIMAL (32, 16)                            NULL,
    [CurrencyDebitAmount]        DECIMAL (32, 16)                            NULL,
    [CurrencyId]                 VARCHAR (4)                                 NOT NULL,
    [CurrencyRate]               DECIMAL (32, 16)                            NULL,
    [DebitAmount]                DECIMAL (32, 16)                            NULL,
    [FiscalYear]                 VARCHAR (4)                                 NOT NULL,
    [JournalType]                VARCHAR (3)                                 NOT NULL,
    [LedgerId]                   VARCHAR (10)                                NOT NULL,
    [LineNumber]                 SMALLINT                                    NULL,
    [Module]                     VARCHAR (2)                                 NOT NULL,
    [PeriodToPost]               VARCHAR (6)                                 NOT NULL,
    [PeriodFinancialDate]        DATETIME2 (7)                               NULL,
    [Posted]                     CHAR (1)                                    NOT NULL,
    [ProjectId]                  VARCHAR (16)                                NOT NULL,
    [Released]                   INT                                         NULL,
    [SubaccountId]               VARCHAR (24)                                NOT NULL,
    [SubSeg1]                    VARCHAR (100)                               NOT NULL,
    [SubSeg2]                    VARCHAR (100)                               NOT NULL,
    [TaskId]                     VARCHAR (32)                                NOT NULL,
    [TransactionDate]            DATETIME2 (7)                               NULL,
    [TransactionDesc]            VARCHAR (30)                                NOT NULL,
    [TransactionType]            VARCHAR (2)                                 NOT NULL,
    [TransactionReferenceNumber] VARCHAR (10)                                NOT NULL,
    [BalanceType]                CHAR (1)                                    NOT NULL,
    [LastUpdate]                 DATETIME2 (7)                               NOT NULL,
    [ImportDate]                 DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKGeneralLedgerTransaction] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[GeneralLedgerTransactionHistory], DATA_CONSISTENCY_CHECK=ON));
















GO



GO
CREATE NONCLUSTERED INDEX [IX_GeneralLedgerTransaction_LastUpdate]
    ON [SL].[GeneralLedgerTransaction]([LastUpdate] ASC);


GO



GO



GO



GO



GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GeneralLedgerTransaction]
    ON [SL].[GeneralLedgerTransaction]([BatchNumber] ASC, [LineNumber] ASC, [Module] ASC);

