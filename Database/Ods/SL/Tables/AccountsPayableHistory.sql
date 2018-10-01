CREATE TABLE [SL].[AccountsPayableHistory] (
    [RowId]                       INT                                         IDENTITY (1, 1) NOT NULL,
    [BeginBalance]                DECIMAL (32, 16)                            NOT NULL,
    [CompanyId]                   VARCHAR (10)                                NOT NULL,
    [CurrencyId]                  VARCHAR (4)                                 NOT NULL,
    [FiscalYear]                  VARCHAR (4)                                 NOT NULL,
    [NoteId]                      INT                                         NOT NULL,
    [PeriodNumber]                VARCHAR (6)                                 NOT NULL,
    [CreditAdjustments00]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments01]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments02]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments03]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments04]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments05]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments06]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments07]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments08]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments09]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments10]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments11]         DECIMAL (32, 16)                            NOT NULL,
    [CreditAdjustments12]         DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken00]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken01]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken02]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken03]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken04]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken05]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken06]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken07]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken08]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken09]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken10]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken11]            DECIMAL (32, 16)                            NOT NULL,
    [DiscountsTaken12]            DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments00]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments01]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments02]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments03]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments04]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments05]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments06]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments07]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments08]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments09]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments10]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments11]          DECIMAL (32, 16)                            NOT NULL,
    [DebitAdjustments12]          DECIMAL (32, 16)                            NOT NULL,
    [Payments00]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments01]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments02]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments03]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments04]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments05]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments06]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments07]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments08]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments09]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments10]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments11]                  DECIMAL (32, 16)                            NOT NULL,
    [Payments12]                  DECIMAL (32, 16)                            NOT NULL,
    [Purchases00]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases01]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases02]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases03]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases04]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases05]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases06]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases07]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases08]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases09]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases10]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases11]                 DECIMAL (32, 16)                            NOT NULL,
    [Purchases12]                 DECIMAL (32, 16)                            NOT NULL,
    [VendorId]                    VARCHAR (15)                                NOT NULL,
    [YearToDateCreditAdjustments] DECIMAL (32, 16)                            NOT NULL,
    [YearToDateDiscountsTaken]    DECIMAL (32, 16)                            NOT NULL,
    [YearToDateDebitAdjustments]  DECIMAL (32, 16)                            NOT NULL,
    [YearToDatePayments]          DECIMAL (32, 16)                            NOT NULL,
    [YearToDatePurchases]         DECIMAL (32, 16)                            NOT NULL,
    [LastUpdate]                  DATETIME2 (7)                               NOT NULL,
    [ImportDate]                  DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                   DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                     DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [RowVersion]                  BIGINT                                      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKAccountsPayableHistory] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountsPayableHistoryHistory], DATA_CONSISTENCY_CHECK=ON));








GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableHistory_LastUpdate]
    ON [SL].[AccountsPayableHistory]([LastUpdate] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_AccountsPayableHistory_CompanyId]
    ON [SL].[AccountsPayableHistory]([CompanyId] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountsPayableHistory_CompanyId_FiscalYear_VendorId]
    ON [SL].[AccountsPayableHistory]([CompanyId] ASC, [FiscalYear] ASC, [VendorId] ASC);

