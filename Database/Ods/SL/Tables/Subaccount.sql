CREATE TABLE [SL].[Subaccount] (
    [RowId]        INT                                         IDENTITY (1, 1) NOT NULL,
    [SubaccountId] VARCHAR (24)                                NOT NULL,
    [IsActive]     INT                                         NOT NULL,
    [Description]  VARCHAR (30)                                NOT NULL,
    [LastUpdate]   DATETIME2 (7)                               NOT NULL,
    [ImportDate]   DATETIME2 (7)                               NOT NULL,
    [ValidFrom]    DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]      DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]   BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKSubaccount] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[SubaccountHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE NONCLUSTERED INDEX [IX_Subaccount_LastUpdate]
    ON [SL].[Subaccount]([LastUpdate] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Subaccount_SubaccountId]
    ON [SL].[Subaccount]([SubaccountId] ASC);

