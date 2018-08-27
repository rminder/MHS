CREATE TABLE [dbo].[tempfAPBalance] (
    [CpnyID]           VARCHAR (100)   NULL,
    [VendID]           VARCHAR (100)   NULL,
    [RefNbr]           VARCHAR (100)   NULL,
    [DocDate]          SMALLDATETIME   NULL,
    [DueDate]          SMALLDATETIME   NULL,
    [DiscDate]         SMALLDATETIME   NULL,
    [DocType]          VARCHAR (100)   NULL,
    [DocBal]           NUMERIC (18, 4) NULL,
    [ProfitCenterID]   VARCHAR (100)   NULL,
    [LocationID]       VARCHAR (100)   NULL,
    [PerPost]          VARCHAR (100)   NULL,
    [PerFinancialDate] SMALLDATETIME   NULL,
    [InvcNbr]          VARCHAR (100)   NULL
);

