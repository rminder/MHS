CREATE TABLE [SL].[VendorHistory] (
    [RowId]      INT           NOT NULL,
    [City]       VARCHAR (30)  NOT NULL,
    [ClassId]    VARCHAR (10)  NOT NULL,
    [Country]    VARCHAR (3)   NOT NULL,
    [Name]       VARCHAR (60)  NOT NULL,
    [State]      VARCHAR (3)   NOT NULL,
    [Status]     CHAR (1)      NOT NULL,
    [VendorId]   VARCHAR (15)  NOT NULL,
    [Zip]        VARCHAR (10)  NOT NULL,
    [LastUpdate] DATETIME2 (7) NOT NULL,
    [ImportDate] DATETIME2 (7) NOT NULL,
    [ValidFrom]  DATETIME2 (7) NOT NULL,
    [ValidTo]    DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_VendorHistory_RowId]
    ON [SL].[VendorHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_VendorHistory]
    ON [SL].[VendorHistory]([ValidTo] ASC, [ValidFrom] ASC);

