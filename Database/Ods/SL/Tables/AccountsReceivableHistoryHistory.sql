﻿CREATE TABLE [SL].[AccountsReceivableHistoryHistory] (
    [RowId]                      INT              NOT NULL,
    [CompanyId]                  VARCHAR (10)     NOT NULL,
    [CustomerId]                 VARCHAR (15)     NOT NULL,
    [FiscalYear]                 VARCHAR (4)      NOT NULL,
    [AccruedRevenueBeginBalance] DECIMAL (32, 16) NOT NULL,
    [BeginBalance]               DECIMAL (32, 16) NOT NULL,
    [CurrencyId]                 VARCHAR (4)      NOT NULL,
    [NumberOfInvoicesPaid00]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid01]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid02]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid03]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid04]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid05]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid06]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid07]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid08]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid09]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid10]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid11]     DECIMAL (32, 16) NOT NULL,
    [NumberOfInvoicesPaid12]     DECIMAL (32, 16) NOT NULL,
    [NoteId]                     INT              NOT NULL,
    [PaidInvoiceDays00]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays01]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays02]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays03]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays04]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays05]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays06]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays07]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays08]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays09]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays10]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays11]          DECIMAL (32, 16) NOT NULL,
    [PaidInvoiceDays12]          DECIMAL (32, 16) NOT NULL,
    [PeriodNumber]               VARCHAR (6)      NOT NULL,
    [AccruedRevenueChange00]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange01]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange02]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange03]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange04]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange05]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange06]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange07]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange08]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange09]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange10]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange11]     DECIMAL (32, 16) NOT NULL,
    [AccruedRevenueChange12]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal00]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal01]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal02]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal03]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal04]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal05]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal06]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal07]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal08]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal09]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal10]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal11]     DECIMAL (32, 16) NOT NULL,
    [CostOfGoodsSoldTotal12]     DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal00]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal01]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal02]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal03]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal04]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal05]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal06]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal07]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal08]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal09]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal10]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal11]          DECIMAL (32, 16) NOT NULL,
    [CreditMemoTotal12]          DECIMAL (32, 16) NOT NULL,
    [DiscountTotal00]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal01]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal02]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal03]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal04]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal05]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal06]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal07]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal08]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal09]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal10]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal11]            DECIMAL (32, 16) NOT NULL,
    [DiscountTotal12]            DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal00]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal01]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal02]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal03]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal04]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal05]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal06]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal07]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal08]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal09]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal10]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal11]           DECIMAL (32, 16) NOT NULL,
    [DebitMemoTotal12]           DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal00]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal01]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal02]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal03]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal04]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal05]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal06]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal07]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal08]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal09]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal10]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal11]       DECIMAL (32, 16) NOT NULL,
    [FinanceChargeTotal12]       DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal00]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal01]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal02]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal03]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal04]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal05]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal06]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal07]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal08]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal09]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal10]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal11]     DECIMAL (32, 16) NOT NULL,
    [PaymentReceivedTotal12]     DECIMAL (32, 16) NOT NULL,
    [SaleTotal00]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal01]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal02]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal03]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal04]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal05]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal06]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal07]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal08]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal09]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal10]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal11]                DECIMAL (32, 16) NOT NULL,
    [SaleTotal12]                DECIMAL (32, 16) NOT NULL,
    [YearToDateAccruedRevenue]   DECIMAL (32, 16) NOT NULL,
    [YearToDateCostOfGoodsSold]  DECIMAL (32, 16) NOT NULL,
    [YearToDateCreditMemo]       DECIMAL (32, 16) NOT NULL,
    [YearToDateDiscounts]        DECIMAL (32, 16) NOT NULL,
    [YearToDateDebitMemo]        DECIMAL (32, 16) NOT NULL,
    [YearToDateFinanceCharge]    DECIMAL (32, 16) NOT NULL,
    [YearToDateReceipts]         DECIMAL (32, 16) NOT NULL,
    [YearToDateSales]            DECIMAL (32, 16) NOT NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL,
    [RowVersion]                 BIGINT           NOT NULL
);




GO
CREATE NONCLUSTERED INDEX [IX_AccountsReceivableHistoryHistory_RowId]
    ON [SL].[AccountsReceivableHistoryHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_AccountsReceivableHistoryHistory]
    ON [SL].[AccountsReceivableHistoryHistory]([ValidTo] ASC, [ValidFrom] ASC);

