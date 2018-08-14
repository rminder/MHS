CREATE TABLE [SL].[SalespersonDelete] (
    [SlsperId] CHAR (10) NOT NULL,
    [IsOds]    BIT       CONSTRAINT [DF_SalespersonDelete_IsOds] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [salesperson0Delete] PRIMARY KEY CLUSTERED ([SlsperId] ASC)
);



