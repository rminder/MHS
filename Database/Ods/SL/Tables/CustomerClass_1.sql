CREATE TABLE [SL].[CustomerClass] (
    [RowId]       INT                                         IDENTITY (1, 1) NOT NULL,
    [ClassId]     VARCHAR (6)                                 NOT NULL,
    [Description] VARCHAR (30)                                NOT NULL,
    [LastUpdate]  DATETIME2 (7)                               NOT NULL,
    [ImportDate]  DATETIME2 (7)                               NOT NULL,
    [ValidFrom]   DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]     DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]  BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKCustomerClass] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[CustomerClassHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_CustomerClass_ClassId]
    ON [SL].[CustomerClass]([ClassId] ASC);

