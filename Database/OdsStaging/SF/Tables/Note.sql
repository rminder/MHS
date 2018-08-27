CREATE TABLE [SF].[Note] (
    [Id]                           NVARCHAR (18)  NOT NULL,
    [IsDeleted]                    TINYINT        NULL,
    [ParentId]                     NVARCHAR (18)  NULL,
    [Title]                        NVARCHAR (80)  NULL,
    [IsPrivate]                    TINYINT        NULL,
    [Body]                         NVARCHAR (MAX) NULL,
    [OwnerId]                      NVARCHAR (18)  NULL,
    [CreatedDate]                  DATETIME       NULL,
    [CreatedById]                  NVARCHAR (18)  NULL,
    [LastModifiedDate]             DATETIME       NULL,
    [LastModifiedById]             NVARCHAR (18)  NULL,
    [SystemModstamp]               DATETIME       NULL,
    [User_Owner_UNITY_Agent_ID__c] NVARCHAR (18)  NULL,
    CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED ([Id] ASC)
);

