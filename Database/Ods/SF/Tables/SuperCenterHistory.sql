CREATE TABLE [SF].[SuperCenterHistory] (
    [RowId]                             INT              NOT NULL,
    [Id]                                VARCHAR (18)     NOT NULL,
    [OwnerId]                           VARCHAR (18)     NOT NULL,
    [IsDeleted]                         TINYINT          NULL,
    [Name]                              VARCHAR (80)     NOT NULL,
    [CreatedDate]                       DATETIME2 (7)    NULL,
    [CreatedById]                       VARCHAR (18)     NOT NULL,
    [LastModifiedDate]                  DATETIME2 (7)    NULL,
    [LastModifiedById]                  VARCHAR (18)     NOT NULL,
    [SystemModstamp]                    DATETIME2 (7)    NULL,
    [LastActivityDate]                  DATETIME2 (7)    NULL,
    [LastViewedDate]                    DATETIME2 (7)    NULL,
    [LastReferencedDate]                DATETIME2 (7)    NULL,
    [ProjectedEquipmentRevenueToTarget] DECIMAL (32, 16) NULL,
    [ProjectedServiceRevenueToTarget]   DECIMAL (32, 16) NULL,
    [ProjectedTotalEquipmentRevenue]    DECIMAL (32, 16) NULL,
    [ProjectedTotalServiceRevenue]      DECIMAL (32, 16) NULL,
    [TotalEquipmentGrossProfitActual]   DECIMAL (32, 16) NULL,
    [TotalEquipmentRevenueActual]       DECIMAL (32, 16) NULL,
    [TotalServiceGrossProfitActual]     DECIMAL (32, 16) NULL,
    [TotalServiceRevenueActual]         DECIMAL (32, 16) NULL,
    [TotalMonthlySalesAverage]          DECIMAL (32, 16) NULL,
    [TotalMonthlySalesAverageTarget]    DECIMAL (32, 16) NULL,
    [AdjustedTotalMSATarget]            DECIMAL (32, 16) NULL,
    [LastUpdate]                        DATETIME2 (7)    NOT NULL,
    [ImportDate]                        DATETIME2 (7)    NOT NULL,
    [ValidFrom]                         DATETIME2 (7)    NOT NULL,
    [ValidTo]                           DATETIME2 (7)    NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_SuperCenterHistory_RowId]
    ON [SF].[SuperCenterHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_SuperCenterHistory]
    ON [SF].[SuperCenterHistory]([ValidTo] ASC, [ValidFrom] ASC);

