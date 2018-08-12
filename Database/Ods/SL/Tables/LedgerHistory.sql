CREATE TABLE [SL].[LedgerHistory] (
    [RowId]           INT           NOT NULL,
    [LedgerId]        VARCHAR (10)  NOT NULL,
    [BalanceType]     CHAR (1)      NOT NULL,
    [BalanceRequired] INT           NOT NULL,
    [BaseCurrencyId]  VARCHAR (4)   NOT NULL,
    [Description]     VARCHAR (30)  NOT NULL,
    [LastUpdate]      DATETIME2 (7) NOT NULL,
    [ImportDate]      DATETIME2 (7) NOT NULL,
    [ValidFrom]       DATETIME2 (7) NOT NULL,
    [ValidTo]         DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_LedgerHistory_RowId]
    ON [SL].[LedgerHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_LedgerHistory]
    ON [SL].[LedgerHistory]([ValidTo] ASC, [ValidFrom] ASC);

