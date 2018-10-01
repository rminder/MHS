CREATE TABLE [SL].[SegmentDefinition] (
    [RowId]          INT                                         IDENTITY (1, 1) NOT NULL,
    [Active]         SMALLINT                                    NOT NULL,
    [Description]    VARCHAR (30)                                NOT NULL,
    [FieldClass]     VARCHAR (3)                                 NOT NULL,
    [FieldClassName] VARCHAR (15)                                NOT NULL,
    [Id]             VARCHAR (24)                                NOT NULL,
    [SegmentNumber]  VARCHAR (2)                                 NOT NULL,
    [LastUpdate]     DATETIME2 (7)                               NOT NULL,
    [ImportDate]     DATETIME2 (7)                               NOT NULL,
    [ValidFrom]      DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]        DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]     BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PSegmentDefinition] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[SegmentDefinitionHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SegmentDefintion_FieldClassName_SegmentNumber_Id]
    ON [SL].[SegmentDefinition]([FieldClassName] ASC, [SegmentNumber] ASC, [Id] ASC);

