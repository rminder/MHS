CREATE TABLE [SF].[Product2History] (
    [RowId]                              INT              NOT NULL,
    [Id]                                 VARCHAR (18)     NOT NULL,
    [Name]                               VARCHAR (255)    NOT NULL,
    [ProductCode]                        VARCHAR (255)    NOT NULL,
    [Description]                        VARCHAR (MAX)    NOT NULL,
    [IsActive]                           TINYINT          NULL,
    [CreatedDate]                        DATETIME2 (7)    NULL,
    [CreatedById]                        VARCHAR (18)     NOT NULL,
    [LastModifiedDate]                   DATETIME2 (7)    NULL,
    [LastModifiedById]                   VARCHAR (18)     NOT NULL,
    [SystemModstamp]                     DATETIME2 (7)    NULL,
    [Family]                             VARCHAR (40)     NOT NULL,
    [RecordTypeId]                       VARCHAR (18)     NOT NULL,
    [ExternalDataSourceId]               VARCHAR (18)     NOT NULL,
    [ExternalId]                         VARCHAR (255)    NOT NULL,
    [DisplayUrl]                         VARCHAR (1000)   NOT NULL,
    [QuantityUnitOfMeasure]              VARCHAR (40)     NOT NULL,
    [IsDeleted]                          TINYINT          NULL,
    [LastViewedDate]                     DATETIME2 (7)    NULL,
    [LastReferencedDate]                 DATETIME2 (7)    NULL,
    [ServiceMaxEnableSerializedTracking] TINYINT          NULL,
    [ServiceMaxInheritParentWarranty]    TINYINT          NULL,
    [ServiceMaxProductCost]              DECIMAL (32, 16) NULL,
    [ServiceMaxProductLine]              VARCHAR (255)    NOT NULL,
    [ServiceMaxSelect]                   TINYINT          NOT NULL,
    [ServiceMaxStockable]                TINYINT          NULL,
    [ServiceMaxTracking]                 VARCHAR (255)    NOT NULL,
    [ServiceMaxUnitOfMeasure]            VARCHAR (255)    NOT NULL,
    [ServiceMaxReplacementAvailable]     TINYINT          NULL,
    [Capacity]                           VARCHAR (15)     NOT NULL,
    [HighUsageProduct]                   TINYINT          NULL,
    [Broad]                              VARCHAR (255)    NOT NULL,
    [Group]                              VARCHAR (255)    NOT NULL,
    [Type]                               VARCHAR (255)    NOT NULL,
    [PartSerialNumber]                   VARCHAR (18)     NOT NULL,
    [Model]                              VARCHAR (50)     NOT NULL,
    [Make1]                              VARCHAR (255)    NOT NULL,
    [UOM]                                VARCHAR (255)    NOT NULL,
    [ProductId]                          VARCHAR (MAX)    NOT NULL,
    [UnityProductExternalId]             VARCHAR (80)     NOT NULL,
    [SSVYOptimalCost]                    DECIMAL (32, 16) NULL,
    [UnityIsMenuPricing]                 TINYINT          NULL,
    [UnityAssetType]                     VARCHAR (255)    NOT NULL,
    [UnityBumperThickness]               VARCHAR (50)     NOT NULL,
    [ServiceMaxProductType]              VARCHAR (255)    NOT NULL,
    [UnityIsStockable]                   TINYINT          NULL,
    [LastUpdate]                         DATETIME2 (7)    NOT NULL,
    [ImportDate]                         DATETIME2 (7)    NOT NULL,
    [ValidFrom]                          DATETIME2 (7)    NOT NULL,
    [ValidTo]                            DATETIME2 (7)    NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Product2History_RowId]
    ON [SF].[Product2History]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_Product2History]
    ON [SF].[Product2History]([ValidTo] ASC, [ValidFrom] ASC);

