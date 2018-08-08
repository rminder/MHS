CREATE TABLE [dbo].[TemporalTableDemo2History] (
    [RowId]       INT           NOT NULL,
    [Account]     VARCHAR (10)  NOT NULL,
    [Description] VARCHAR (40)  NOT NULL,
    [ValidFrom]   DATETIME2 (7) NOT NULL,
    [ValidTo]     DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_TemporalTableDemo2History]
    ON [dbo].[TemporalTableDemo2History]([ValidTo] ASC, [ValidFrom] ASC);

