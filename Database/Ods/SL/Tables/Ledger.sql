CREATE TABLE [SL].[Ledger] (
    [RowId]           INT                                         IDENTITY (1, 1) NOT NULL,
    [LedgerId]        VARCHAR (10)                                NOT NULL,
    [BalanceType]     CHAR (1)                                    NOT NULL,
    [BalanceRequired] INT                                         NOT NULL,
    [BaseCurrencyId]  VARCHAR (4)                                 NOT NULL,
    [Description]     VARCHAR (30)                                NOT NULL,
    [LastUpdate]      DATETIME2 (7)                               NOT NULL,
    [ImportDate]      DATETIME2 (7)                               NOT NULL,
    [ValidFrom]       DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]         DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKLedger] PRIMARY KEY CLUSTERED ([LedgerId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[LedgerHistory], DATA_CONSISTENCY_CHECK=ON));

