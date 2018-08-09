CREATE TABLE [SL].[SalesPersonHistory] (
    [RowId]         INT           NOT NULL,
    [City]          VARCHAR (30)  NULL,
    [Country]       VARCHAR (3)   NULL,
    [Name]          VARCHAR (60)  NULL,
    [SalesPersonId] VARCHAR (10)  NULL,
    [State]         VARCHAR (3)   NULL,
    [Territory]     VARCHAR (10)  NULL,
    [LastUpdate]    DATETIME2 (7) NOT NULL,
    [ImportDate]    DATETIME2 (7) NOT NULL,
    [ValidFrom]     DATETIME2 (7) NOT NULL,
    [ValidTo]       DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_SalesPersonHistory]
    ON [SL].[SalesPersonHistory]([ValidTo] ASC, [ValidFrom] ASC);

