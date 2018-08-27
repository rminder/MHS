CREATE TABLE [SF].[NoteHistory] (
    [RowId]            INT           NOT NULL,
    [Id]               VARCHAR (18)  NOT NULL,
    [IsDeleted]        TINYINT       NULL,
    [ParentId]         VARCHAR (18)  NULL,
    [Title]            VARCHAR (80)  NULL,
    [IsPrivate]        TINYINT       NULL,
    [Body]             VARCHAR (MAX) NULL,
    [OwnerId]          VARCHAR (18)  NULL,
    [CreatedDate]      DATETIME2 (7) NULL,
    [CreatedById]      VARCHAR (18)  NULL,
    [LastModifiedDate] DATETIME2 (7) NULL,
    [LastModifiedById] VARCHAR (18)  NULL,
    [SystemModstamp]   DATETIME2 (7) NULL,
    [UnityAgentId]     VARCHAR (18)  NULL,
    [LastUpdate]       DATETIME2 (7) NOT NULL,
    [ImportDate]       DATETIME2 (7) NOT NULL,
    [ValidFrom]        DATETIME2 (7) NOT NULL,
    [ValidTo]          DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_NoteHistory_RowId]
    ON [SF].[NoteHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_NoteHistory]
    ON [SF].[NoteHistory]([ValidTo] ASC, [ValidFrom] ASC);

