CREATE TABLE [SL].[Budget] (
    [RowId]            INT                                         IDENTITY (1, 1) NOT NULL,
    [ActualLedgerId]   VARCHAR (10)                                NOT NULL,
    [BudgetSegment]    VARCHAR (24)                                NOT NULL,
    [BeginDate]        DATETIME2 (7)                               NOT NULL,
    [BudgetLedgerId]   VARCHAR (10)                                NOT NULL,
    [BudgetYear]       VARCHAR (4)                                 NOT NULL,
    [CompanyId]        VARCHAR (10)                                NOT NULL,
    [EndDate]          DATETIME2 (7)                               NOT NULL,
    [NoteId]           INT                                         NOT NULL,
    [ShortDescription] VARCHAR (60)                                NOT NULL,
    [LastUpdate]       DATETIME2 (7)                               NOT NULL,
    [ImportDate]       DATETIME2 (7)                               NOT NULL,
    [ValidFrom]        DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]          DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKBudget] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[BudgetHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE NONCLUSTERED INDEX [IX_Budget_LastUpdate]
    ON [SL].[Budget]([LastUpdate] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Budget_CompanyId_BudgetYear_BudgetLedgerId_BudgetSegment]
    ON [SL].[Budget]([CompanyId] ASC, [BudgetYear] ASC, [BudgetLedgerId] ASC, [BudgetSegment] ASC);

