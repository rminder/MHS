CREATE TABLE [SF].[Note] (
    [RowId]            INT                                         IDENTITY (1, 1) NOT NULL,
    [Id]               VARCHAR (18)                                NOT NULL,
    [IsDeleted]        TINYINT                                     NULL,
    [ParentId]         VARCHAR (18)                                NULL,
    [Title]            VARCHAR (80)                                NULL,
    [IsPrivate]        TINYINT                                     NULL,
    [Body]             VARCHAR (MAX)                               NULL,
    [OwnerId]          VARCHAR (18)                                NULL,
    [CreatedDate]      DATETIME2 (7)                               NULL,
    [CreatedById]      VARCHAR (18)                                NULL,
    [LastModifiedDate] DATETIME2 (7)                               NULL,
    [LastModifiedById] VARCHAR (18)                                NULL,
    [SystemModstamp]   DATETIME2 (7)                               NULL,
    [UnityAgentId]     VARCHAR (18)                                NULL,
    [LastUpdate]       DATETIME2 (7)                               NOT NULL,
    [ImportDate]       DATETIME2 (7)                               NOT NULL,
    [ValidFrom]        DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]          DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKNote] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SF].[NoteHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Note_Id]
    ON [SF].[Note]([Id] ASC);

