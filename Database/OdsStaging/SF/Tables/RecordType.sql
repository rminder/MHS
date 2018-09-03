CREATE TABLE [SF].[RecordType] (
    [Id]                NVARCHAR (18)  NOT NULL,
    [Name]              NVARCHAR (80)  NULL,
    [DeveloperName]     NVARCHAR (80)  NULL,
    [NamespacePrefix]   NVARCHAR (15)  NULL,
    [Description]       NVARCHAR (255) NULL,
    [BusinessProcessId] NVARCHAR (18)  NULL,
    [SobjectType]       NVARCHAR (47)  NULL,
    [IsActive]          TINYINT        NULL,
    [CreatedById]       NVARCHAR (18)  NULL,
    [CreatedDate]       DATETIME       NULL,
    [LastModifiedById]  NVARCHAR (18)  NULL,
    [LastModifiedDate]  DATETIME       NULL,
    [SystemModstamp]    DATETIME       NULL,
    CONSTRAINT [PK_RecordType] PRIMARY KEY CLUSTERED ([Id] ASC)
);

