CREATE TABLE [SL].[BUSetupDelete] (
    [BudgetLedgerID] CHAR (10) NOT NULL,
    [CpnyID]         CHAR (10) NOT NULL,
    [IsOds]          BIT       NOT NULL,
    CONSTRAINT [BUSetup0Delete] PRIMARY KEY NONCLUSTERED ([CpnyID] ASC, [BudgetLedgerID] ASC)
);

