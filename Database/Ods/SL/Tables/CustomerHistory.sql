CREATE TABLE [SL].[CustomerHistory] (
    [RowId]         INT              NOT NULL,
    [CustomerId]    VARCHAR (15)     NOT NULL,
    [City]          VARCHAR (30)     NOT NULL,
    [ClassId]       VARCHAR (6)      NOT NULL,
    [Country]       VARCHAR (3)      NOT NULL,
    [Name]          VARCHAR (60)     NOT NULL,
    [SalesPersonId] VARCHAR (10)     NOT NULL,
    [State]         VARCHAR (3)      NOT NULL,
    [Status]        CHAR (1)         NOT NULL,
    [Zip]           VARCHAR (10)     NOT NULL,
    [CreditLimit]   DECIMAL (32, 16) NULL,
    [LastUpdate]    DATETIME2 (7)    NOT NULL,
    [ImportDate]    DATETIME2 (7)    NOT NULL,
    [ValidFrom]     DATETIME2 (7)    NOT NULL,
    [ValidTo]       DATETIME2 (7)    NOT NULL,
    [RowVersion]    BIGINT           NOT NULL
);




GO
CREATE NONCLUSTERED INDEX [IX_CustomerHistory_RowId]
    ON [SL].[CustomerHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_CustomerHistory]
    ON [SL].[CustomerHistory]([ValidTo] ASC, [ValidFrom] ASC);

