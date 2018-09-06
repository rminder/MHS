CREATE TABLE [SL].[BudgetGroupHistory] (
    [RowId]          INT           NOT NULL,
    [Access]         CHAR (1)      NOT NULL,
    [BudgetSegment]  VARCHAR (24)  NOT NULL,
    [BudgetLedgerId] VARCHAR (10)  NOT NULL,
    [BudgetYear]     VARCHAR (4)   NOT NULL,
    [CompanyId]      VARCHAR (10)  NOT NULL,
    [GroupId]        VARCHAR (47)  NOT NULL,
    [NoteId]         INT           NOT NULL,
    [LastUpdate]     DATETIME2 (7) NOT NULL,
    [ImportDate]     DATETIME2 (7) NOT NULL,
    [ValidFrom]      DATETIME2 (7) NOT NULL,
    [ValidTo]        DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_BudgetGroupHistory_RowId]
    ON [SL].[BudgetGroupHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_BudgetGroupHistory]
    ON [SL].[BudgetGroupHistory]([ValidTo] ASC, [ValidFrom] ASC);

