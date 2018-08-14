﻿CREATE TABLE [SL].[APDocDelete] (
    [Account]                    VARCHAR (50) NOT NULL,
    [SubaccountId]               VARCHAR (50) NOT NULL,
    [DocumentType]               VARCHAR (50) NOT NULL,
    [TransactionReferenceNumber] VARCHAR (50) NOT NULL,
    [RecordId]                   INT          NOT NULL,
    [IsOds]                      BIT          CONSTRAINT [DF_APDocDelete_IsOds] DEFAULT ((0)) NOT NULL
);





