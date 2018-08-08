CREATE TABLE [SL].[APTranDelete] (
    [Acct]     CHAR (10) NOT NULL,
    [BatNbr]   CHAR (10) NOT NULL,
    [Sub]      CHAR (24) NOT NULL,
    [RefNbr]   CHAR (10) NOT NULL,
    [RecordID] INT       NOT NULL,
    CONSTRAINT [PKAPTranDelete] PRIMARY KEY CLUSTERED ([BatNbr] ASC, [Acct] ASC, [Sub] ASC, [RefNbr] ASC, [RecordID] ASC)
);

