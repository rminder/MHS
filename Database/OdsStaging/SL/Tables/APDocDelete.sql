CREATE TABLE [SL].[APDocDelete] (
    [Acct]     CHAR (10) NOT NULL,
    [Sub]      CHAR (24) NOT NULL,
    [DocType]  CHAR (2)  NOT NULL,
    [RefNbr]   CHAR (10) NOT NULL,
    [RecordID] INT       NOT NULL,
    CONSTRAINT [PkAPDocDelete] PRIMARY KEY CLUSTERED ([Acct] ASC, [Sub] ASC, [DocType] ASC, [RefNbr] ASC, [RecordID] ASC)
);

