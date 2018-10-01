CREATE TABLE [SL].[Salesperson] (
    [RowId]         INT                                         IDENTITY (1, 1) NOT NULL,
    [City]          VARCHAR (30)                                NULL,
    [Country]       VARCHAR (3)                                 NULL,
    [Name]          VARCHAR (60)                                NULL,
    [SalesPersonId] VARCHAR (10)                                NULL,
    [State]         VARCHAR (3)                                 NULL,
    [Territory]     VARCHAR (10)                                NULL,
    [LastUpdate]    DATETIME2 (7)                               NOT NULL,
    [ImportDate]    DATETIME2 (7)                               NOT NULL,
    [ValidFrom]     DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]       DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]    BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKSalesPerson] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[SalesPersonHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Salesperson_SalespersonId]
    ON [SL].[Salesperson]([SalesPersonId] ASC);

