﻿CREATE TABLE [SL].[AccountsPayableBalance] (
    [RowId]                   INT                                         IDENTITY (1, 1) NOT NULL,
    [CompanyId]               VARCHAR (10)                                NOT NULL,
    [CurrentBalance]          DECIMAL (32, 16)                            NOT NULL,
    [CurrencyId]              VARCHAR (4)                                 NOT NULL,
    [CurrentYear1099Box00]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box01]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box02]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box03]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box04]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box05]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box06]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box07]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box08]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box09]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box10]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box11]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box12]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box13]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Box14]    DECIMAL (32, 16)                            NOT NULL,
    [CurrentYear1099Interest] DECIMAL (32, 16)                            NOT NULL,
    [FutureBalance]           DECIMAL (32, 16)                            NOT NULL,
    [LastCheckDate]           DATETIME2 (7)                               NOT NULL,
    [LastVoucherDate]         DATETIME2 (7)                               NOT NULL,
    [NoteId]                  INT                                         NOT NULL,
    [NextYear1099Box00]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box01]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box02]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box03]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box04]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box05]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box06]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box07]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box08]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box09]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box10]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box11]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box12]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box13]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Box14]       DECIMAL (32, 16)                            NOT NULL,
    [NextYear1099Interest]    DECIMAL (32, 16)                            NOT NULL,
    [PeriodNumber]            VARCHAR (6)                                 NOT NULL,
    [VendorID]                VARCHAR (15)                                NOT NULL,
    [LastUpdate]              DATETIME2 (7)                               NOT NULL,
    [ImportDate]              DATETIME2 (7)                               NOT NULL,
    [ValidFrom]               DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                 DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]              BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKAccountsPayableBalance] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountsPayableBalanceHistory], DATA_CONSISTENCY_CHECK=ON));






GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountsPayableBalance_CompanyId_VendorId]
    ON [SL].[AccountsPayableBalance]([CompanyId] ASC, [VendorID] ASC);

