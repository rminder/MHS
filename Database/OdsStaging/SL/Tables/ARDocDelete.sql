CREATE TABLE [SL].[ARDocDelete] (
    [CustId]  CHAR (15) NOT NULL,
    [DocType] CHAR (2)  NOT NULL,
    [RefNbr]  CHAR (10) NOT NULL,
    [BatNbr]  CHAR (10) NOT NULL,
    [BatSeq]  INT       NOT NULL,
    [IsOds]   BIT       CONSTRAINT [DF_ARDocDelete_IsOds] DEFAULT ((0)) NOT NULL
);



