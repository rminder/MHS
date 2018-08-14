CREATE TABLE [SL].[BudgetDelete] (
    [CpnyID]         CHAR (10) NOT NULL,
    [BudgetYear]     CHAR (4)  NOT NULL,
    [BudgetLedgerID] CHAR (10) NOT NULL,
    [BdgtSegment]    CHAR (24) NOT NULL,
    [IsOds]          BIT       CONSTRAINT [DF_BudgetDelete_IsOds] DEFAULT ((0)) NOT NULL
);



