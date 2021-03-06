﻿CREATE TABLE [SF].[ServiceMaxServiceGroup] (
    [RowId]                   INT                                         IDENTITY (1, 1) NOT NULL,
    [Id]                      VARCHAR (18)                                NOT NULL,
    [OwnerId]                 VARCHAR (18)                                NOT NULL,
    [IsDeleted]               TINYINT                                     NULL,
    [Name]                    VARCHAR (80)                                NOT NULL,
    [RecordTypeId]            VARCHAR (18)                                NOT NULL,
    [CreatedDate]             DATETIME2 (7)                               NULL,
    [CreatedById]             VARCHAR (18)                                NOT NULL,
    [LastModifiedDate]        DATETIME2 (7)                               NULL,
    [LastModifiedById]        VARCHAR (18)                                NOT NULL,
    [SystemModStamp]          DATETIME2 (7)                               NULL,
    [LastActivityDate]        DATETIME2 (7)                               NULL,
    [LastViewedDate]          DATETIME2 (7)                               NULL,
    [LastReferencedDate]      DATETIME2 (7)                               NULL,
    [IsActive]                TINYINT                                     NULL,
    [City]                    VARCHAR (100)                               NOT NULL,
    [Country]                 VARCHAR (255)                               NOT NULL,
    [Description]             VARCHAR (255)                               NOT NULL,
    [Email]                   VARCHAR (80)                                NOT NULL,
    [GroupCode]               VARCHAR (100)                               NOT NULL,
    [GroupType]               VARCHAR (255)                               NOT NULL,
    [Latitude]                DECIMAL (32, 16)                            NULL,
    [Longitude]               DECIMAL (32, 16)                            NULL,
    [Phone]                   VARCHAR (40)                                NOT NULL,
    [Select]                  TINYINT                                     NULL,
    [State]                   VARCHAR (100)                               NOT NULL,
    [Street]                  VARCHAR (255)                               NOT NULL,
    [Zip]                     VARCHAR (100)                               NOT NULL,
    [SuperCenter]             VARCHAR (255)                               NOT NULL,
    [Segment]                 VARCHAR (255)                               NOT NULL,
    [CompanyCode]             VARCHAR (25)                                NOT NULL,
    [Company]                 VARCHAR (25)                                NOT NULL,
    [CompanyLegalName]        VARCHAR (40)                                NOT NULL,
    [OptimizerConnectionName] VARCHAR (100)                               NOT NULL,
    [LastUpdate]              DATETIME2 (7)                               NOT NULL,
    [ImportDate]              DATETIME2 (7)                               NOT NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKServiceMaxServiceGroup] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SF].[ServiceMaxServiceGroupHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ServiceMaxServiceGroup_Id]
    ON [SF].[ServiceMaxServiceGroup]([Id] ASC);

