CREATE TABLE [SL].[AccountHistory] (
    [RowId]              INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]            VARCHAR (10)                                NOT NULL,
    [BalanceType]        CHAR (1)                                    NOT NULL,
    [BeginningBalance]   DECIMAL (32, 16)                            NOT NULL,
    [CompanyId]          VARCHAR (10)                                NOT NULL,
    [CurrencyId]         VARCHAR (4)                                 NOT NULL,
    [FiscalYear]         VARCHAR (4)                                 NOT NULL,
    [LedgerId]           VARCHAR (10)                                NOT NULL,
    [SubaccountId]       VARCHAR (24)                                NOT NULL,
    [BudgetRevisionDate] DATE                                        NULL,
    [PostedBalance00]    DECIMAL (32, 16)                            NULL,
    [PostedBalance01]    DECIMAL (32, 16)                            NULL,
    [PostedBalance02]    DECIMAL (32, 16)                            NULL,
    [PostedBalance03]    DECIMAL (32, 16)                            NULL,
    [PostedBalance04]    DECIMAL (32, 16)                            NULL,
    [PostedBalance05]    DECIMAL (32, 16)                            NULL,
    [PostedBalance06]    DECIMAL (32, 16)                            NULL,
    [PostedBalance07]    DECIMAL (32, 16)                            NULL,
    [PostedBalance08]    DECIMAL (32, 16)                            NULL,
    [PostedBalance09]    DECIMAL (32, 16)                            NULL,
    [PostedBalance10]    DECIMAL (32, 16)                            NULL,
    [PostedBalance11]    DECIMAL (32, 16)                            NULL,
    [PostedBalance12]    DECIMAL (32, 16)                            NULL,
    [LastUpdate]         DATETIME2 (7)                               NOT NULL,
    [ImportDate]         DATETIME2 (7)                               NOT NULL,
    [ValidFrom]          DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]            DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]         BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKAccountHistory] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountHistoryHistory], DATA_CONSISTENCY_CHECK=ON));










GO



GO
CREATE NONCLUSTERED INDEX [IX_AccountHistory_FiscalYear_BalanceType]
    ON [SL].[AccountHistory]([FiscalYear] ASC, [BalanceType] ASC)
    INCLUDE([CompanyId]);


GO
CREATE NONCLUSTERED INDEX [IX_AccountHistory_CompanyId_ FiscalYear_BalanceType]
    ON [SL].[AccountHistory]([CompanyId] ASC, [FiscalYear] ASC, [BalanceType] ASC)
    INCLUDE([Account], [BeginningBalance], [CurrencyId], [LedgerId], [SubaccountId]);


GO
CREATE NONCLUSTERED INDEX [IX_AccountHistory_BeginningBalance_BalanceType]
    ON [SL].[AccountHistory]([BeginningBalance] ASC, [BalanceType] ASC)
    INCLUDE([Account], [CompanyId], [CurrencyId], [FiscalYear], [LedgerId], [SubaccountId]);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountHistory_Account_CompanyId_FiscalYear_LedgerId_SubaccountId]
    ON [SL].[AccountHistory]([Account] ASC, [CompanyId] ASC, [FiscalYear] ASC, [LedgerId] ASC, [SubaccountId] ASC);

