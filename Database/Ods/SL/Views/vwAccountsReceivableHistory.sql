﻿Create View SL.vwAccountsReceivableHistory AS

SELECT [RowId]
      ,[CompanyId]
      ,[CustomerId]
      ,[FiscalYear]
      ,[AccruedRevenueBeginBalance]
      ,[BeginBalance]
      ,[CurrencyId]
      ,[NumberOfInvoicesPaid00]
      ,[NumberOfInvoicesPaid01]
      ,[NumberOfInvoicesPaid02]
      ,[NumberOfInvoicesPaid03]
      ,[NumberOfInvoicesPaid04]
      ,[NumberOfInvoicesPaid05]
      ,[NumberOfInvoicesPaid06]
      ,[NumberOfInvoicesPaid07]
      ,[NumberOfInvoicesPaid08]
      ,[NumberOfInvoicesPaid09]
      ,[NumberOfInvoicesPaid10]
      ,[NumberOfInvoicesPaid11]
      ,[NumberOfInvoicesPaid12]
      ,[NoteId]
      ,[PaidInvoiceDays00]
      ,[PaidInvoiceDays01]
      ,[PaidInvoiceDays02]
      ,[PaidInvoiceDays03]
      ,[PaidInvoiceDays04]
      ,[PaidInvoiceDays05]
      ,[PaidInvoiceDays06]
      ,[PaidInvoiceDays07]
      ,[PaidInvoiceDays08]
      ,[PaidInvoiceDays09]
      ,[PaidInvoiceDays10]
      ,[PaidInvoiceDays11]
      ,[PaidInvoiceDays12]
      ,[PeriodNumber]
      ,[AccruedRevenueChange00]
      ,[AccruedRevenueChange01]
      ,[AccruedRevenueChange02]
      ,[AccruedRevenueChange03]
      ,[AccruedRevenueChange04]
      ,[AccruedRevenueChange05]
      ,[AccruedRevenueChange06]
      ,[AccruedRevenueChange07]
      ,[AccruedRevenueChange08]
      ,[AccruedRevenueChange09]
      ,[AccruedRevenueChange10]
      ,[AccruedRevenueChange11]
      ,[AccruedRevenueChange12]
      ,[CostOfGoodsSoldTotal00]
      ,[CostOfGoodsSoldTotal01]
      ,[CostOfGoodsSoldTotal02]
      ,[CostOfGoodsSoldTotal03]
      ,[CostOfGoodsSoldTotal04]
      ,[CostOfGoodsSoldTotal05]
      ,[CostOfGoodsSoldTotal06]
      ,[CostOfGoodsSoldTotal07]
      ,[CostOfGoodsSoldTotal08]
      ,[CostOfGoodsSoldTotal09]
      ,[CostOfGoodsSoldTotal10]
      ,[CostOfGoodsSoldTotal11]
      ,[CostOfGoodsSoldTotal12]
      ,[CreditMemoTotal00]
      ,[CreditMemoTotal01]
      ,[CreditMemoTotal02]
      ,[CreditMemoTotal03]
      ,[CreditMemoTotal04]
      ,[CreditMemoTotal05]
      ,[CreditMemoTotal06]
      ,[CreditMemoTotal07]
      ,[CreditMemoTotal08]
      ,[CreditMemoTotal09]
      ,[CreditMemoTotal10]
      ,[CreditMemoTotal11]
      ,[CreditMemoTotal12]
      ,[DiscountTotal00]
      ,[DiscountTotal01]
      ,[DiscountTotal02]
      ,[DiscountTotal03]
      ,[DiscountTotal04]
      ,[DiscountTotal05]
      ,[DiscountTotal06]
      ,[DiscountTotal07]
      ,[DiscountTotal08]
      ,[DiscountTotal09]
      ,[DiscountTotal10]
      ,[DiscountTotal11]
      ,[DiscountTotal12]
      ,[DebitMemoTotal00]
      ,[DebitMemoTotal01]
      ,[DebitMemoTotal02]
      ,[DebitMemoTotal03]
      ,[DebitMemoTotal04]
      ,[DebitMemoTotal05]
      ,[DebitMemoTotal06]
      ,[DebitMemoTotal07]
      ,[DebitMemoTotal08]
      ,[DebitMemoTotal09]
      ,[DebitMemoTotal10]
      ,[DebitMemoTotal11]
      ,[DebitMemoTotal12]
      ,[FinanceChargeTotal00]
      ,[FinanceChargeTotal01]
      ,[FinanceChargeTotal02]
      ,[FinanceChargeTotal03]
      ,[FinanceChargeTotal04]
      ,[FinanceChargeTotal05]
      ,[FinanceChargeTotal06]
      ,[FinanceChargeTotal07]
      ,[FinanceChargeTotal08]
      ,[FinanceChargeTotal09]
      ,[FinanceChargeTotal10]
      ,[FinanceChargeTotal11]
      ,[FinanceChargeTotal12]
      ,[PaymentReceivedTotal00]
      ,[PaymentReceivedTotal01]
      ,[PaymentReceivedTotal02]
      ,[PaymentReceivedTotal03]
      ,[PaymentReceivedTotal04]
      ,[PaymentReceivedTotal05]
      ,[PaymentReceivedTotal06]
      ,[PaymentReceivedTotal07]
      ,[PaymentReceivedTotal08]
      ,[PaymentReceivedTotal09]
      ,[PaymentReceivedTotal10]
      ,[PaymentReceivedTotal11]
      ,[PaymentReceivedTotal12]
      ,[SaleTotal00]
      ,[SaleTotal01]
      ,[SaleTotal02]
      ,[SaleTotal03]
      ,[SaleTotal04]
      ,[SaleTotal05]
      ,[SaleTotal06]
      ,[SaleTotal07]
      ,[SaleTotal08]
      ,[SaleTotal09]
      ,[SaleTotal10]
      ,[SaleTotal11]
      ,[SaleTotal12]
      ,[YearToDateAccruedRevenue]
      ,[YearToDateCostOfGoodsSold]
      ,[YearToDateCreditMemo]
      ,[YearToDateDiscounts]
      ,[YearToDateDebitMemo]
      ,[YearToDateFinanceCharge]
      ,[YearToDateReceipts]
      ,[YearToDateSales]
      ,[LastUpdate]
      ,[ImportDate]
      ,[ValidFrom]
      ,[ValidTo]
  FROM [SL].[AccountsReceivableHistory]
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountsReceivableHistory] TO [OdsUser]
    AS [dbo];

