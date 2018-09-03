CREATE TABLE [SF].[RecordType] (
    [RowId]             INT                                         IDENTITY (1, 1) NOT NULL,
    [Id]                VARCHAR (18)                                NOT NULL,
    [Name]              VARCHAR (80)                                NOT NULL,
    [DeveloperName]     VARCHAR (80)                                NOT NULL,
    [NamespacePrefix]   VARCHAR (15)                                NOT NULL,
    [Description]       VARCHAR (255)                               NOT NULL,
    [BusinessProcessId] VARCHAR (18)                                NOT NULL,
    [SobjectType]       VARCHAR (47)                                NOT NULL,
    [IsActive]          TINYINT                                     NULL,
    [CreatedById]       VARCHAR (18)                                NOT NULL,
    [CreatedDate]       DATETIME2 (7)                               NULL,
    [LastModifiedById]  VARCHAR (18)                                NOT NULL,
    [LastModifiedDate]  DATETIME2 (7)                               NULL,
    [SystemModstamp]    DATETIME2 (7)                               NULL,
    [LastUpdate]        DATETIME2 (7)                               NOT NULL,
    [ImportDate]        DATETIME2 (7)                               NOT NULL,
    [ValidFrom]         DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]           DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKRecordType] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SF].[RecordTypeHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RecordType_Id]
    ON [SF].[RecordType]([Id] ASC);

