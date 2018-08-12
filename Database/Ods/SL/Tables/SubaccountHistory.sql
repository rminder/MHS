CREATE TABLE [SL].[SubaccountHistory] (
    [RowId]        INT           NOT NULL,
    [SubaccountId] VARCHAR (24)  NOT NULL,
    [IsActive]     INT           NOT NULL,
    [Description]  VARCHAR (30)  NOT NULL,
    [LastUpdate]   DATETIME2 (7) NOT NULL,
    [ImportDate]   DATETIME2 (7) NOT NULL,
    [ValidFrom]    DATETIME2 (7) NOT NULL,
    [ValidTo]      DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_SubaccountHistory_RowId]
    ON [SL].[SubaccountHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_SubaccountHistory]
    ON [SL].[SubaccountHistory]([ValidTo] ASC, [ValidFrom] ASC);

