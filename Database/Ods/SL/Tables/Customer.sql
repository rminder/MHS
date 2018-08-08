CREATE TABLE [SL].[Customer] (
    [RowId]         INT                                         IDENTITY (1, 1) NOT NULL,
    [CustomerId]    VARCHAR (15)                                NOT NULL,
    [City]          VARCHAR (30)                                NOT NULL,
    [ClassId]       VARCHAR (6)                                 NOT NULL,
    [Country]       VARCHAR (3)                                 NOT NULL,
    [Name]          VARCHAR (60)                                NOT NULL,
    [SalesPersonId] VARCHAR (10)                                NOT NULL,
    [State]         VARCHAR (3)                                 NOT NULL,
    [Status]        CHAR (1)                                    NOT NULL,
    [Zip]           VARCHAR (10)                                NOT NULL,
    [CreditLimit]   DECIMAL (32, 16)                            NULL,
    [LastUpdate]    DATETIME2 (7)                               NOT NULL,
    [ImportDate]    DATETIME2 (7)                               NOT NULL,
    [ValidFrom]     DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]       DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKCustomer] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[CustomerHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [IX_Customer_LastUpdate]
    ON [SL].[Customer]([LastUpdate] ASC);

