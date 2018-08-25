CREATE TABLE [SF].[ServiceMaxServiceGroupMembersHistory] (
    [RowId]                                        INT              NOT NULL,
    [Id]                                           VARCHAR (18)     NOT NULL,
    [IsDeleted]                                    TINYINT          NULL,
    [Name]                                         VARCHAR (80)     NOT NULL,
    [CreatedDate]                                  DATETIME2 (7)    NULL,
    [CreatedById]                                  VARCHAR (18)     NOT NULL,
    [LastModifiedDate]                             DATETIME2 (7)    NULL,
    [LastModifiedById]                             VARCHAR (18)     NOT NULL,
    [SystemModstamp]                               DATETIME2 (7)    NULL,
    [LastActivityDate]                             DATETIME2 (7)    NULL,
    [LastViewedDate]                               DATETIME2 (7)    NULL,
    [LastReferencedDate]                           DATETIME2 (7)    NULL,
    [ServiceGroup]                                 VARCHAR (18)     NOT NULL,
    [IsActive]                                     TINYINT          NULL,
    [AverageDriveTime]                             DECIMAL (32, 16) NULL,
    [AverageSpeed]                                 DECIMAL (32, 16) NULL,
    [BreakDuration]                                DECIMAL (32, 16) NULL,
    [BreakHours]                                   VARCHAR (18)     NOT NULL,
    [BreakType]                                    VARCHAR (255)    NOT NULL,
    [City]                                         VARCHAR (100)    NOT NULL,
    [Country]                                      VARCHAR (255)    NOT NULL,
    [Email]                                        VARCHAR (80)     NOT NULL,
    [EnableScheduling]                             TINYINT          NULL,
    [FixedCost]                                    DECIMAL (32, 16) NULL,
    [InventoryLocation]                            VARCHAR (18)     NOT NULL,
    [Latitude]                                     DECIMAL (32, 16) NULL,
    [Longitude]                                    DECIMAL (32, 16) NULL,
    [MaxDailyHours]                                DECIMAL (32, 16) NULL,
    [MaxDistance]                                  DECIMAL (32, 16) NULL,
    [MaxHours]                                     DECIMAL (32, 16) NULL,
    [Memberinformation]                            VARCHAR (MAX)    NOT NULL,
    [OvertimeHours]                                VARCHAR (18)     NOT NULL,
    [PerHourCost]                                  DECIMAL (32, 16) NULL,
    [PerMileCost]                                  DECIMAL (32, 16) NULL,
    [Phone]                                        VARCHAR (40)     NOT NULL,
    [Role]                                         VARCHAR (255)    NOT NULL,
    [SalesForceUser]                               VARCHAR (18)     NOT NULL,
    [Select]                                       TINYINT          NULL,
    [ServiceTerritory]                             VARCHAR (18)     NOT NULL,
    [State]                                        VARCHAR (100)    NOT NULL,
    [Street]                                       VARCHAR (255)    NOT NULL,
    [ThirdParty]                                   TINYINT          NULL,
    [WorkingHours]                                 VARCHAR (18)     NOT NULL,
    [Zip]                                          VARCHAR (100)    NOT NULL,
    [OptimizerExternalId]                          VARCHAR (255)    NOT NULL,
    [TerritoryServiceTerritoryOptimizerExternalId] VARCHAR (255)    NOT NULL,
    [UserSalesforceUserrUnityAgentId]              VARCHAR (18)     NOT NULL,
    [ServiceMaxManageInventory]                    TINYINT          NULL,
    [LatitudeHome]                                 DECIMAL (32, 16) NULL,
    [LongitudeHome]                                DECIMAL (32, 16) NULL,
    [LastUpdate]                                   DATETIME2 (7)    NOT NULL,
    [ImportDate]                                   DATETIME2 (7)    NOT NULL,
    [ValidFrom]                                    DATETIME2 (7)    NOT NULL,
    [ValidTo]                                      DATETIME2 (7)    NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_ServiceMaxServiceGroupMembers_RowId]
    ON [SF].[ServiceMaxServiceGroupMembersHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_ServiceMaxServiceGroupMembersHistory]
    ON [SF].[ServiceMaxServiceGroupMembersHistory]([ValidTo] ASC, [ValidFrom] ASC);

