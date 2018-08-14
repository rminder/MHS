CREATE TABLE [SL].[APTranDelete] (
    [Acct]     CHAR (10) NOT NULL,
    [BatNbr]   CHAR (10) NOT NULL,
    [Sub]      CHAR (24) NOT NULL,
    [RefNbr]   CHAR (10) NOT NULL,
    [RecordID] INT       NOT NULL,
    [IsOds]    BIT       CONSTRAINT [DF_APTranDelete_IsOds] DEFAULT ((0)) NOT NULL
);



