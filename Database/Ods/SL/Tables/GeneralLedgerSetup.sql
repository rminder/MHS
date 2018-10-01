CREATE TABLE [SL].[GeneralLedgerSetup] (
    [RowId]                   INT                                         IDENTITY (1, 1) NOT NULL,
    [SetupId]                 VARCHAR (2)                                 NOT NULL,
    [BeginFiscalYear]         INT                                         NULL,
    [CompanyId]               VARCHAR (10)                                NOT NULL,
    [CompanyName]             VARCHAR (30)                                NOT NULL,
    [FiscalPeriodEnd00]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd01]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd02]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd03]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd04]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd05]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd06]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd07]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd08]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd09]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd10]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd11]       VARCHAR (4)                                 NOT NULL,
    [FiscalPeriodEnd12]       VARCHAR (4)                                 NOT NULL,
    [LedgerId]                VARCHAR (10)                                NOT NULL,
    [NumberOfPeriods]         INT                                         NULL,
    [CurrentFiscalPeriod]     VARCHAR (6)                                 NOT NULL,
    [RetainedEarningsAccount] VARCHAR (100)                               NOT NULL,
    [NetIncomeAccount]        VARCHAR (10)                                NOT NULL,
    [LastUpdate]              DATETIME2 (7)                               NOT NULL,
    [ImportDate]              DATETIME2 (7)                               NOT NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]              BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKGeneralLedgerSetup] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[GeneralLedgerSetupHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE NONCLUSTERED INDEX [IX_GeneralLedgerSetup_LastUpdate]
    ON [SL].[GeneralLedgerSetup]([LastUpdate] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_GeneralLedgerSetup_SetupId]
    ON [SL].[GeneralLedgerSetup]([SetupId] ASC);

