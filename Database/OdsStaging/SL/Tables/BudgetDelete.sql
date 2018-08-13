CREATE TABLE [SL].[BudgetDelete] (
    [CpnyID]         CHAR (10) NOT NULL,
    [BudgetYear]     CHAR (4)  NOT NULL,
    [BudgetLedgerID] CHAR (10) NOT NULL,
    [BdgtSegment]    CHAR (24) NOT NULL,
    CONSTRAINT [PkBudgetDelete] PRIMARY KEY NONCLUSTERED ([CpnyID] ASC, [BudgetYear] ASC, [BudgetLedgerID] ASC, [BdgtSegment] ASC)
);

