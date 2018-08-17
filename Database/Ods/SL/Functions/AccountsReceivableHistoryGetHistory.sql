
-- =============================================
-- Author:		Randy Minder
-- Create date: 16-August, 2018
-- Description:	Get all history for the target
--		table.
-- =============================================
CREATE FUNCTION [SL].[AccountsReceivableHistoryGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] [INT] NOT NULL,
	[CompanyId] [varchar](10) NOT NULL,
	[CustomerId] [varchar](15) NOT NULL,
	[FiscalYear] [varchar](4) NOT NULL,
	[AccruedRevenueBeginBalance] decimal(32,16) NOT NULL,
	[BeginBalance] decimal(32,16) NOT NULL,
	[CurrencyId] varchar(4) NOT NULL,
	[NumberOfInvoicesPaid00] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid01] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid02] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid03] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid04] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid05] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid06] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid07] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid08] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid09] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid10] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid11] [decimal](32, 16) NOT NULL,
	[NumberOfInvoicesPaid12] [decimal](32, 16) NOT NULL,
	[NoteId] [int] NOT NULL,
	[PaidInvoiceDays00] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays01] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays02] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays03] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays04] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays05] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays06] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays07] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays08] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays09] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays10] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays11] [decimal](32, 16) NOT NULL,
	[PaidInvoiceDays12] [decimal](32, 16) NOT NULL,
	[PeriodNumber] [varchar](6) NOT NULL,
	[AccruedRevenueChange00] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange01] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange02] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange03] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange04] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange05] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange06] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange07] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange08] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange09] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange10] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange11] [decimal](32, 16) NOT NULL,
	[AccruedRevenueChange12] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal00] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal01] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal02] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal03] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal04] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal05] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal06] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal07] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal08] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal09] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal10] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal11] [decimal](32, 16) NOT NULL,
	[CostOfGoodsSoldTotal12] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal00] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal01] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal02] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal03] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal04] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal05] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal06] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal07] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal08] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal09] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal10] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal11] [decimal](32, 16) NOT NULL,
	[CreditMemoTotal12] [decimal](32, 16) NOT NULL,
	[DiscountTotal00] [decimal](32, 16) NOT NULL,
	[DiscountTotal01] [decimal](32, 16) NOT NULL,
	[DiscountTotal02] [decimal](32, 16) NOT NULL,
	[DiscountTotal03] [decimal](32, 16) NOT NULL,
	[DiscountTotal04] [decimal](32, 16) NOT NULL,
	[DiscountTotal05] [decimal](32, 16) NOT NULL,
	[DiscountTotal06] [decimal](32, 16) NOT NULL,
	[DiscountTotal07] [decimal](32, 16) NOT NULL,
	[DiscountTotal08] [decimal](32, 16) NOT NULL,
	[DiscountTotal09] [decimal](32, 16) NOT NULL,
	[DiscountTotal10] [decimal](32, 16) NOT NULL,
	[DiscountTotal11] [decimal](32, 16) NOT NULL,
	[DiscountTotal12] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal00] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal01] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal02] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal03] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal04] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal05] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal06] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal07] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal08] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal09] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal10] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal11] [decimal](32, 16) NOT NULL,
	[DebitMemoTotal12] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal00] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal01] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal02] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal03] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal04] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal05] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal06] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal07] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal08] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal09] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal10] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal11] [decimal](32, 16) NOT NULL,
	[FinanceChargeTotal12] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal00] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal01] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal02] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal03] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal04] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal05] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal06] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal07] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal08] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal09] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal10] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal11] [decimal](32, 16) NOT NULL,
	[PaymentReceivedTotal12] [decimal](32, 16) NOT NULL,
	[SaleTotal00] [decimal](32, 16) NOT NULL,
	[SaleTotal01] [decimal](32, 16) NOT NULL,
	[SaleTotal02] [decimal](32, 16) NOT NULL,
	[SaleTotal03] [decimal](32, 16) NOT NULL,
	[SaleTotal04] [decimal](32, 16) NOT NULL,
	[SaleTotal05] [decimal](32, 16) NOT NULL,
	[SaleTotal06] [decimal](32, 16) NOT NULL,
	[SaleTotal07] [decimal](32, 16) NOT NULL,
	[SaleTotal08] [decimal](32, 16) NOT NULL,
	[SaleTotal09] [decimal](32, 16) NOT NULL,
	[SaleTotal10] [decimal](32, 16) NOT NULL,
	[SaleTotal11] [decimal](32, 16) NOT NULL,
	[SaleTotal12] [decimal](32, 16) NOT NULL,
	[YearToDateAccruedRevenue] [decimal](32, 16) NOT NULL,
	[YearToDateCostOfGoodsSold] [decimal](32, 16) NOT NULL,
	[YearToDateCreditMemo] [decimal](32, 16) NOT NULL,
	[YearToDateDiscounts] [decimal](32, 16) NOT NULL,
	[YearToDateDebitMemo] [decimal](32, 16) NOT NULL,
	[YearToDateFinanceCharge] [decimal](32, 16) NOT NULL,
	[YearToDateReceipts] [decimal](32, 16) NOT NULL,
	[YearToDateSales] [decimal](32, 16) NOT NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[__Operation] CHAR(1) NOT NULL,
	[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	DECLARE @DistinctPKValue TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)
	)
	DECLARE @ActivityTable TABLE 
	(
		RowId BIGINT NOT NULL,
		ValidFrom DATETIME2	 NOT NULL,
		ValidTo DATETIME2 NOT NULL,
		RowNumber INT NOT NULL,
		MaxRowNumber INT NOT NULL,
		UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	)
	DECLARE @EndDateTableState TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)	
	)
	DECLARE @InsertUpdateDeleteTable TABLE 
	(
		RowId BIGINT NOT NULL,
		Operation CHAR(1) NOT NULL,
		OperationDate DATETIME2 NOT NULL,
		UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	)

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT RowId
	FROM SL.AccountsReceivableHistory FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SL.AccountsReceivableHistory
		FOR SYSTEM_TIME AS OF @EndDateUtc T
	INNER JOIN @EndDateTableState T2 ON T2.RowId = T.RowId

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		 T.RowId
		,ValidFrom
		,ValidTo
		,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
		,SUM(1) OVER (PARTITION BY T.RowId) AS MaxRowNumber
	FROM SL.AccountsReceivableHistory FOR SYSTEM_TIME ALL T 
	INNER JOIN @DistinctPKValue T2 ON T2.RowId = T.RowId

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT Into @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
		,'I' AS Operation
		,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE RowNumber = 1 AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc

	-- Store all the deletes. A delete can be identified by a row in @ActivityTable where RowNumber = MaxRowNumber and the row
	-- doesn't exist in @EndDateStateTable
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
	   ,'D'		AS Operation
	   ,ValidTo AS OperationDate
	FROM @ActivityTable				 T
		LEFT JOIN @EndDateTableState T2 ON T2.RowId = T.RowId
	WHERE
		T.RowNumber = T.MaxRowNumber
		AND T2.RowId IS NULL;

	-- Store all updates. An update can be identified by a row whose RowNumber > 1. If a row is inserted and then deleted (with no updates)
	-- there will only be a single row in history. Each time a row is updated, an entry is added to history. Therefore, the total number of
	-- updates for a row will be maximum row number - 1.
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
		,'U' AS Operation
		,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;WITH BaseTableActivity AS
	(
		SELECT
			 [RowId]
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
		FROM SL.AccountsReceivableHistory
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
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
			,LastUpdate
			,ImportDate
			,__Operation
			,__OperationDate)
	SELECT DISTINCT
 		 T.[RowId]
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
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END