CREATE TABLE [SL].[VendorDelete] (
    [VendId] CHAR (15) NOT NULL,
    [IsOds]  BIT       CONSTRAINT [DF_VendorDelete_IsOds] DEFAULT ((0)) NOT NULL
);





