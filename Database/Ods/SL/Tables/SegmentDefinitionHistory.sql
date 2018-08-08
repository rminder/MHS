CREATE TABLE [SL].[SegmentDefinitionHistory] (
    [RowId]          INT           NOT NULL,
    [Active]         SMALLINT      NOT NULL,
    [Description]    VARCHAR (30)  NOT NULL,
    [FieldClass]     VARCHAR (3)   NOT NULL,
    [FieldClassName] VARCHAR (15)  NOT NULL,
    [Id]             VARCHAR (24)  NOT NULL,
    [SegmentNumber]  VARCHAR (2)   NOT NULL,
    [LastUpdate]     DATETIME2 (7) NOT NULL,
    [ImportDate]     DATETIME2 (7) NOT NULL,
    [ValidFrom]      DATETIME2 (7) NOT NULL,
    [ValidTo]        DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_SegmentDefinitionHistory_RowId]
    ON [SL].[SegmentDefinitionHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_SegmentDefinitionHistory]
    ON [SL].[SegmentDefinitionHistory]([ValidTo] ASC, [ValidFrom] ASC);

