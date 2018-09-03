CREATE TABLE [SF].[RecordTypeHistory] (
    [RowId]             INT           NOT NULL,
    [Id]                VARCHAR (18)  NOT NULL,
    [Name]              VARCHAR (80)  NOT NULL,
    [DeveloperName]     VARCHAR (80)  NOT NULL,
    [NamespacePrefix]   VARCHAR (15)  NOT NULL,
    [Description]       VARCHAR (255) NOT NULL,
    [BusinessProcessId] VARCHAR (18)  NOT NULL,
    [SobjectType]       VARCHAR (47)  NOT NULL,
    [IsActive]          TINYINT       NULL,
    [CreatedById]       VARCHAR (18)  NOT NULL,
    [CreatedDate]       DATETIME2 (7) NULL,
    [LastModifiedById]  VARCHAR (18)  NOT NULL,
    [LastModifiedDate]  DATETIME2 (7) NULL,
    [SystemModstamp]    DATETIME2 (7) NULL,
    [LastUpdate]        DATETIME2 (7) NOT NULL,
    [ImportDate]        DATETIME2 (7) NOT NULL,
    [ValidFrom]         DATETIME2 (7) NOT NULL,
    [ValidTo]           DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_RecordType_RowId]
    ON [SF].[RecordTypeHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_RecordTypeHistory]
    ON [SF].[RecordTypeHistory]([ValidTo] ASC, [ValidFrom] ASC);

