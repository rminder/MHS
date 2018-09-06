CREATE TABLE [SL].[BudgetGroup] (
    [RowId]          INT                                         IDENTITY (1, 1) NOT NULL,
    [Access]         CHAR (1)                                    NOT NULL,
    [BudgetSegment]  VARCHAR (24)                                NOT NULL,
    [BudgetLedgerId] VARCHAR (10)                                NOT NULL,
    [BudgetYear]     VARCHAR (4)                                 NOT NULL,
    [CompanyId]      VARCHAR (10)                                NOT NULL,
    [GroupId]        VARCHAR (47)                                NOT NULL,
    [NoteId]         INT                                         NOT NULL,
    [LastUpdate]     DATETIME2 (7)                               NOT NULL,
    [ImportDate]     DATETIME2 (7)                               NOT NULL,
    [ValidFrom]      DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]        DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKBudgetGroup] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[BudgetGroupHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_BudgetGroup_BudgetSegment_BudgetLedgerId_BudgetYear_CompanyId_GroupId]
    ON [SL].[BudgetGroup]([BudgetSegment] ASC, [BudgetLedgerId] ASC, [BudgetYear] ASC, [CompanyId] ASC, [GroupId] ASC);

