CREATE TABLE [SL].[AP_BalancesDelete] (
    [CpnyID] CHAR (10) NOT NULL,
    [VendID] CHAR (15) NOT NULL,
    [IsOds]  BIT       CONSTRAINT [DF_AP_BalancesDelete_IsOds] DEFAULT ((0)) NOT NULL
);

