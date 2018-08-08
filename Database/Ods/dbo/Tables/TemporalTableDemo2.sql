CREATE TABLE [dbo].[TemporalTableDemo2] (
    [RowId]       INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]     VARCHAR (10)                                NOT NULL,
    [Description] VARCHAR (40)                                NOT NULL,
    [ValidFrom]   DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]     DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKTemporalTableDemo2] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[TemporalTableDemo2History], DATA_CONSISTENCY_CHECK=ON));

