CREATE TABLE [SL].[AccountDelete] (
    [Acct]  VARCHAR (10) NOT NULL,
    [IsOds] BIT          CONSTRAINT [DF_AccountDelete_IsOds] DEFAULT ((0)) NOT NULL
);





