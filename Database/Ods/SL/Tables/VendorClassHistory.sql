CREATE TABLE [SL].[VendorClassHistory] (
    [RowId]       INT           NOT NULL,
    [ClassId]     VARCHAR (10)  NOT NULL,
    [Description] VARCHAR (30)  NOT NULL,
    [LastUpdate]  DATETIME2 (7) NOT NULL,
    [ImportDate]  DATETIME2 (7) NOT NULL,
    [ValidFrom]   DATETIME2 (7) NOT NULL,
    [ValidTo]     DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_VendorClassHistory]
    ON [SL].[VendorClassHistory]([ValidTo] ASC, [ValidFrom] ASC);

