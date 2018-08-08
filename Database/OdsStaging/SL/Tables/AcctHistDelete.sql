CREATE TABLE [SL].[AcctHistDelete] (
    [CpnyID]   CHAR (10) NOT NULL,
    [Acct]     CHAR (10) NOT NULL,
    [Sub]      CHAR (24) NOT NULL,
    [LedgerID] CHAR (10) NOT NULL,
    [FiscYr]   CHAR (4)  NOT NULL,
    CONSTRAINT [PKAccountHistoryDelete] PRIMARY KEY CLUSTERED ([CpnyID] ASC, [Acct] ASC, [Sub] ASC, [LedgerID] ASC, [FiscYr] ASC)
);

