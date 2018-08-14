CREATE TABLE [SL].[ARTranDelete] (
    [CustId]   CHAR (15) NOT NULL,
    [LineNbr]  SMALLINT  NOT NULL,
    [RecordID] INT       NOT NULL,
    [RefNbr]   CHAR (10) NOT NULL,
    [TranType] CHAR (2)  NOT NULL,
    [IsOds]    BIT       CONSTRAINT [DF_ARTranDelete_IsOds] DEFAULT ((0)) NOT NULL
);





