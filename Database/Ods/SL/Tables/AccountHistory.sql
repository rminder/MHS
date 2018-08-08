﻿CREATE TABLE [SL].[AccountHistory] (
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
    CONSTRAINT [PKAccountHistory] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountHistoryHistory], DATA_CONSISTENCY_CHECK=ON));




GO



GO

