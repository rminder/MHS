CREATE TABLE [dbo].[TemporalTableDemoHistory] (
    [RowId]       INT           NOT NULL,
    [Account]     VARCHAR (10)  NOT NULL,
    [Description] VARCHAR (40)  NOT NULL,
    [ValidFrom]   DATETIME2 (7) NOT NULL,
    [ValidTo]     DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_TemporalTableDemoHistory]
    ON [dbo].[TemporalTableDemoHistory]([ValidTo] ASC, [ValidFrom] ASC);

