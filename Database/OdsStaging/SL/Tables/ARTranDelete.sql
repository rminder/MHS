CREATE TABLE [SL].[ARTranDelete] (
    [CustId]   CHAR (15) NOT NULL,
    [LineNbr]  SMALLINT  NOT NULL,
    [RecordID] INT       NOT NULL,
    [RefNbr]   CHAR (10) NOT NULL,
    [TranType] CHAR (2)  NOT NULL,
    CONSTRAINT [PkARTranDelete] PRIMARY KEY CLUSTERED ([CustId] ASC, [TranType] ASC, [RefNbr] ASC, [LineNbr] ASC, [RecordID] ASC)
);

