CREATE TABLE [SL].[Budget_GroupDelete] (
    [BdgtSegment]    CHAR (24) NOT NULL,
    [BudgetLedgerID] CHAR (10) NOT NULL,
    [BudgetYear]     CHAR (4)  NOT NULL,
    [CpnyID]         CHAR (10) NOT NULL,
    [GroupID]        CHAR (47) NOT NULL,
    [IsOds]          BIT       NOT NULL,
    CONSTRAINT [Budget_group0Delete] PRIMARY KEY NONCLUSTERED ([CpnyID] ASC, [BudgetYear] ASC, [BudgetLedgerID] ASC, [BdgtSegment] ASC, [GroupID] ASC)
);

