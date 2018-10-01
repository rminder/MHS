CREATE TABLE [SL].[BudgetDistributionTypeHistory] (
    [RowId]              INT              NOT NULL,
    [DistributionType]   VARCHAR (8)      NOT NULL,
    [Description]        VARCHAR (30)     NOT NULL,
    [NoteId]             INT              NOT NULL,
    [BudgetPercent00]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent01]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent02]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent03]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent04]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent05]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent06]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent07]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent08]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent09]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent10]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercent11]    DECIMAL (32, 16) NOT NULL,
    [BudgetPercentTotal] DECIMAL (32, 16) NOT NULL,
    [LastUpdate]         DATETIME2 (7)    NOT NULL,
    [ImportDate]         DATETIME2 (7)    NOT NULL,
    [ValidFrom]          DATETIME2 (7)    NOT NULL,
    [ValidTo]            DATETIME2 (7)    NOT NULL,
    [RowVersion]         BIGINT           NOT NULL
);




GO
CREATE NONCLUSTERED INDEX [IX_BudgetDistributionTypeHistory_RowId]
    ON [SL].[BudgetDistributionTypeHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_BudgetDistributionTypeHistory]
    ON [SL].[BudgetDistributionTypeHistory]([ValidTo] ASC, [ValidFrom] ASC);

