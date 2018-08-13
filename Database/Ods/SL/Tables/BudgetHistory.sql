CREATE TABLE [SL].[BudgetHistory] (
    [RowId]            INT           NOT NULL,
    [ActualLedgerId]   VARCHAR (10)  NOT NULL,
    [BudgetSegment]    VARCHAR (24)  NOT NULL,
    [BeginDate]        DATETIME2 (7) NOT NULL,
    [BudgetLedgerId]   VARCHAR (10)  NOT NULL,
    [BudgetYear]       VARCHAR (4)   NOT NULL,
    [CompanyId]        VARCHAR (10)  NOT NULL,
    [EndDate]          DATETIME2 (7) NOT NULL,
    [NoteId]           INT           NOT NULL,
    [ShortDescription] VARCHAR (60)  NOT NULL,
    [LastUpdate]       DATETIME2 (7) NOT NULL,
    [ImportDate]       DATETIME2 (7) NOT NULL,
    [ValidFrom]        DATETIME2 (7) NOT NULL,
    [ValidTo]          DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_BudgetHistory_RowId]
    ON [SL].[BudgetHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_BudgetHistory]
    ON [SL].[BudgetHistory]([ValidTo] ASC, [ValidFrom] ASC);

