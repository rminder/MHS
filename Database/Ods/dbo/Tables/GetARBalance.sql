CREATE TABLE [dbo].[GetARBalance] (
    [CpnyID]         VARCHAR (50)  NOT NULL,
    [CustID]         INT           NOT NULL,
    [RefNbr]         NVARCHAR (50) NOT NULL,
    [DocDate]        DATETIME2 (7) NOT NULL,
    [DueDate]        DATETIME2 (7) NOT NULL,
    [DocType]        NVARCHAR (50) NOT NULL,
    [DocBal]         FLOAT (53)    NOT NULL,
    [OrigDocAmt]     FLOAT (53)    NOT NULL,
    [ProfitCenterID] VARCHAR (50)  NOT NULL,
    [LocationID]     VARCHAR (50)  NOT NULL,
    [PerPost]        INT           NOT NULL,
    [WorkOrder]      NVARCHAR (50) NULL
);

