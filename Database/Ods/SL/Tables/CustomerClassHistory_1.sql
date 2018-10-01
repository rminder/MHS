CREATE TABLE [SL].[CustomerClassHistory] (
    [RowId]       INT           NOT NULL,
    [ClassId]     VARCHAR (6)   NOT NULL,
    [Description] VARCHAR (30)  NOT NULL,
    [LastUpdate]  DATETIME2 (7) NOT NULL,
    [ImportDate]  DATETIME2 (7) NOT NULL,
    [ValidFrom]   DATETIME2 (7) NOT NULL,
    [ValidTo]     DATETIME2 (7) NOT NULL,
    [RowVersion]  BIGINT        NOT NULL
);




GO
CREATE NONCLUSTERED INDEX [IX_CustomerClassHistory_RowId]
    ON [SL].[CustomerClassHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_CustomerClassHistory]
    ON [SL].[CustomerClassHistory]([ValidTo] ASC, [ValidFrom] ASC);

