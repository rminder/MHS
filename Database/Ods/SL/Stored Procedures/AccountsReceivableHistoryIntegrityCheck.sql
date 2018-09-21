-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 3018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsReceivableHistoryIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsReceivableHistoryIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsReceivableHistory;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.ARHist;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableHistory', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			CompanyId
		   ,CustomerId
		   ,FiscalYear
		FROM ODS.SL.AccountsReceivableHistory
		INTERSECT
		SELECT
			CompanyId
		   ,CustomerId
		   ,FiscalYear
		FROM ODSStaging.SL.vwARHist
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[CompanyId]
		   ,T.[CustomerId]
		   ,T.[FiscalYear]
		   ,ROUND(T.AccruedRevenueBeginBalance, 3) AS AccruedRevenueBeginBalance
		   ,ROUND(T.BeginBalance, 3)			   AS BeginBalance
		   ,T.CurrencyId
		   ,ROUND(T.NumberOfInvoicesPaid00, 3)	   AS NumberOfInvoicesPaid00
		   ,ROUND(T.NumberOfInvoicesPaid01, 3)	   AS NumberOfInvoicesPaid01
		   ,ROUND(T.NumberOfInvoicesPaid02, 3)	   AS NumberOfInvoicesPaid02
		   ,ROUND(T.NumberOfInvoicesPaid03, 3)	   AS NumberOfInvoicesPaid03
		   ,ROUND(T.NumberOfInvoicesPaid04, 3)	   AS NumberOfInvoicesPaid04
		   ,ROUND(T.NumberOfInvoicesPaid05, 3)	   AS NumberOfInvoicesPaid05
		   ,ROUND(T.NumberOfInvoicesPaid06, 3)	   AS NumberOfInvoicesPaid06
		   ,ROUND(T.NumberOfInvoicesPaid07, 3)	   AS NumberOfInvoicesPaid07
		   ,ROUND(T.NumberOfInvoicesPaid08, 3)	   AS NumberOfInvoicesPaid08
		   ,ROUND(T.NumberOfInvoicesPaid09, 3)	   AS NumberOfInvoicesPaid09
		   ,ROUND(T.NumberOfInvoicesPaid10, 3)	   AS NumberOfInvoicesPaid10
		   ,ROUND(T.NumberOfInvoicesPaid11, 3)	   AS NumberOfInvoicesPaid11
		   ,ROUND(T.NumberOfInvoicesPaid12, 3)	   AS NumberOfInvoicesPaid12
		   ,T.NoteId
		   ,ROUND(T.PaidInvoiceDays00, 3)		   AS PaidInvoiceDays00
		   ,ROUND(T.PaidInvoiceDays01, 3)		   AS PaidInvoiceDays01
		   ,ROUND(T.PaidInvoiceDays02, 3)		   AS PaidInvoiceDays02
		   ,ROUND(T.PaidInvoiceDays03, 3)		   AS PaidInvoiceDays03
		   ,ROUND(T.PaidInvoiceDays04, 3)		   AS PaidInvoiceDays04
		   ,ROUND(T.PaidInvoiceDays05, 3)		   AS PaidInvoiceDays05
		   ,ROUND(T.PaidInvoiceDays06, 3)		   AS PaidInvoiceDays06
		   ,ROUND(T.PaidInvoiceDays07, 3)		   AS PaidInvoiceDays07
		   ,ROUND(T.PaidInvoiceDays08, 3)		   AS PaidInvoiceDays08
		   ,ROUND(T.PaidInvoiceDays09, 3)		   AS PaidInvoiceDays09
		   ,ROUND(T.PaidInvoiceDays10, 3)		   AS PaidInvoiceDays10
		   ,ROUND(T.PaidInvoiceDays11, 3)		   AS PaidInvoiceDays11
		   ,ROUND(T.PaidInvoiceDays12, 3)		   AS PaidInvoiceDays12
		   ,T.PeriodNumber
		   ,ROUND(T.AccruedRevenueChange00, 3)	   AS AccruedRevenueChange00
		   ,ROUND(T.AccruedRevenueChange01, 3)	   AS AccruedRevenueChange01
		   ,ROUND(T.AccruedRevenueChange02, 3)	   AS AccruedRevenueChange02
		   ,ROUND(T.AccruedRevenueChange03, 3)	   AS AccruedRevenueChange03
		   ,ROUND(T.AccruedRevenueChange04, 3)	   AS AccruedRevenueChange04
		   ,ROUND(T.AccruedRevenueChange05, 3)	   AS AccruedRevenueChange05
		   ,ROUND(T.AccruedRevenueChange06, 3)	   AS AccruedRevenueChange06
		   ,ROUND(T.AccruedRevenueChange07, 3)	   AS AccruedRevenueChange07
		   ,ROUND(T.AccruedRevenueChange08, 3)	   AS AccruedRevenueChange08
		   ,ROUND(T.AccruedRevenueChange09, 3)	   AS AccruedRevenueChange09
		   ,ROUND(T.AccruedRevenueChange10, 3)	   AS AccruedRevenueChange10
		   ,ROUND(T.AccruedRevenueChange11, 3)	   AS AccruedRevenueChange11
		   ,ROUND(T.AccruedRevenueChange12, 3)	   AS AccruedRevenueChange12
		   ,ROUND(T.CostOfGoodsSoldTotal00, 3)	   AS CostOfGoodsSoldTotal00
		   ,ROUND(T.CostOfGoodsSoldTotal01, 3)	   AS CostOfGoodsSoldTotal01
		   ,ROUND(T.CostOfGoodsSoldTotal02, 3)	   AS CostOfGoodsSoldTotal02
		   ,ROUND(T.CostOfGoodsSoldTotal03, 3)	   AS CostOfGoodsSoldTotal03
		   ,ROUND(T.CostOfGoodsSoldTotal04, 3)	   AS CostOfGoodsSoldTotal04
		   ,ROUND(T.CostOfGoodsSoldTotal05, 3)	   AS CostOfGoodsSoldTotal05
		   ,ROUND(T.CostOfGoodsSoldTotal06, 3)	   AS CostOfGoodsSoldTotal06
		   ,ROUND(T.CostOfGoodsSoldTotal07, 3)	   AS CostOfGoodsSoldTotal07
		   ,ROUND(T.CostOfGoodsSoldTotal08, 3)	   AS CostOfGoodsSoldTotal08
		   ,ROUND(T.CostOfGoodsSoldTotal09, 3)	   AS CostOfGoodsSoldTotal09
		   ,ROUND(T.CostOfGoodsSoldTotal10, 3)	   AS CostOfGoodsSoldTotal10
		   ,ROUND(T.CostOfGoodsSoldTotal11, 3)	   AS CostOfGoodsSoldTotal11
		   ,ROUND(T.CostOfGoodsSoldTotal12, 3)	   AS CostOfGoodsSoldTotal12
		   ,ROUND(T.CreditMemoTotal00, 3)		   AS CreditMemoTotal00
		   ,ROUND(T.CreditMemoTotal01, 3)		   AS CreditMemoTotal01
		   ,ROUND(T.CreditMemoTotal02, 3)		   AS CreditMemoTotal02
		   ,ROUND(T.CreditMemoTotal03, 3)		   AS CreditMemoTotal03
		   ,ROUND(T.CreditMemoTotal04, 3)		   AS CreditMemoTotal04
		   ,ROUND(T.CreditMemoTotal05, 3)		   AS CreditMemoTotal05
		   ,ROUND(T.CreditMemoTotal06, 3)		   AS CreditMemoTotal06
		   ,ROUND(T.CreditMemoTotal07, 3)		   AS CreditMemoTotal07
		   ,ROUND(T.CreditMemoTotal08, 3)		   AS CreditMemoTotal08
		   ,ROUND(T.CreditMemoTotal09, 3)		   AS CreditMemoTotal09
		   ,ROUND(T.CreditMemoTotal10, 3)		   AS CreditMemoTotal10
		   ,ROUND(T.CreditMemoTotal11, 3)		   AS CreditMemoTotal11
		   ,ROUND(T.CreditMemoTotal12, 3)		   AS CreditMemoTotal12
		   ,ROUND(T.DiscountTotal00, 3)			   AS DiscountTotal00
		   ,ROUND(T.DiscountTotal01, 3)			   AS DiscountTotal01
		   ,ROUND(T.DiscountTotal02, 3)			   AS DiscountTotal02
		   ,ROUND(T.DiscountTotal03, 3)			   AS DiscountTotal03
		   ,ROUND(T.DiscountTotal04, 3)			   AS DiscountTotal04
		   ,ROUND(T.DiscountTotal05, 3)			   AS DiscountTotal05
		   ,ROUND(T.DiscountTotal06, 3)			   AS DiscountTotal06
		   ,ROUND(T.DiscountTotal07, 3)			   AS DiscountTotal07
		   ,ROUND(T.DiscountTotal08, 3)			   AS DiscountTotal08
		   ,ROUND(T.DiscountTotal09, 3)			   AS DiscountTotal09
		   ,ROUND(T.DiscountTotal10, 3)			   AS DiscountTotal10
		   ,ROUND(T.DiscountTotal11, 3)			   AS DiscountTotal11
		   ,ROUND(T.DiscountTotal12, 3)			   AS DiscountTotal12
		   ,ROUND(T.DebitMemoTotal00, 3)		   AS DebitMemoTotal00
		   ,ROUND(T.DebitMemoTotal01, 3)		   AS DebitMemoTotal01
		   ,ROUND(T.DebitMemoTotal02, 3)		   AS DebitMemoTotal02
		   ,ROUND(T.DebitMemoTotal03, 3)		   AS DebitMemoTotal03
		   ,ROUND(T.DebitMemoTotal04, 3)		   AS DebitMemoTotal04
		   ,ROUND(T.DebitMemoTotal05, 3)		   AS DebitMemoTotal05
		   ,ROUND(T.DebitMemoTotal06, 3)		   AS DebitMemoTotal06
		   ,ROUND(T.DebitMemoTotal07, 3)		   AS DebitMemoTotal07
		   ,ROUND(T.DebitMemoTotal08, 3)		   AS DebitMemoTotal08
		   ,ROUND(T.DebitMemoTotal09, 3)		   AS DebitMemoTotal09
		   ,ROUND(T.DebitMemoTotal10, 3)		   AS DebitMemoTotal10
		   ,ROUND(T.DebitMemoTotal11, 3)		   AS DebitMemoTotal11
		   ,ROUND(T.DebitMemoTotal12, 3)		   AS DebitMemoTotal12
		   ,ROUND(T.FinanceChargeTotal00, 3)	   AS FinanceChargeTotal00
		   ,ROUND(T.FinanceChargeTotal01, 3)	   AS FinanceChargeTotal01
		   ,ROUND(T.FinanceChargeTotal02, 3)	   AS FinanceChargeTotal02
		   ,ROUND(T.FinanceChargeTotal03, 3)	   AS FinanceChargeTotal03
		   ,ROUND(T.FinanceChargeTotal04, 3)	   AS FinanceChargeTotal04
		   ,ROUND(T.FinanceChargeTotal05, 3)	   AS FinanceChargeTotal05
		   ,ROUND(T.FinanceChargeTotal06, 3)	   AS FinanceChargeTotal06
		   ,ROUND(T.FinanceChargeTotal07, 3)	   AS FinanceChargeTotal07
		   ,ROUND(T.FinanceChargeTotal08, 3)	   AS FinanceChargeTotal08
		   ,ROUND(T.FinanceChargeTotal09, 3)	   AS FinanceChargeTotal09
		   ,ROUND(T.FinanceChargeTotal10, 3)	   AS FinanceChargeTotal10
		   ,ROUND(T.FinanceChargeTotal11, 3)	   AS FinanceChargeTotal11
		   ,ROUND(T.FinanceChargeTotal12, 3)	   AS FinanceChargeTotal12
		   ,ROUND(T.PaymentReceivedTotal00, 3)	   AS PaymentReceivedTotal00
		   ,ROUND(T.PaymentReceivedTotal01, 3)	   AS PaymentReceivedTotal01
		   ,ROUND(T.PaymentReceivedTotal02, 3)	   AS PaymentReceivedTotal02
		   ,ROUND(T.PaymentReceivedTotal03, 3)	   AS PaymentReceivedTotal03
		   ,ROUND(T.PaymentReceivedTotal04, 3)	   AS PaymentReceivedTotal04
		   ,ROUND(T.PaymentReceivedTotal05, 3)	   AS PaymentReceivedTotal05
		   ,ROUND(T.PaymentReceivedTotal06, 3)	   AS PaymentReceivedTotal06
		   ,ROUND(T.PaymentReceivedTotal07, 3)	   AS PaymentReceivedTotal07
		   ,ROUND(T.PaymentReceivedTotal08, 3)	   AS PaymentReceivedTotal08
		   ,ROUND(T.PaymentReceivedTotal09, 3)	   AS PaymentReceivedTotal09
		   ,ROUND(T.PaymentReceivedTotal10, 3)	   AS PaymentReceivedTotal10
		   ,ROUND(T.PaymentReceivedTotal11, 3)	   AS PaymentReceivedTotal11
		   ,ROUND(T.PaymentReceivedTotal12, 3)	   AS PaymentReceivedTotal12
		   ,ROUND(T.SaleTotal00, 3)				   AS SaleTotal00
		   ,ROUND(T.SaleTotal01, 3)				   AS SaleTotal01
		   ,ROUND(T.SaleTotal02, 3)				   AS SaleTotal02
		   ,ROUND(T.SaleTotal03, 3)				   AS SaleTotal03
		   ,ROUND(T.SaleTotal04, 3)				   AS SaleTotal04
		   ,ROUND(T.SaleTotal05, 3)				   AS SaleTotal05
		   ,ROUND(T.SaleTotal06, 3)				   AS SaleTotal06
		   ,ROUND(T.SaleTotal07, 3)				   AS SaleTotal07
		   ,ROUND(T.SaleTotal08, 3)				   AS SaleTotal08
		   ,ROUND(T.SaleTotal09, 3)				   AS SaleTotal09
		   ,ROUND(T.SaleTotal10, 3)				   AS SaleTotal10
		   ,ROUND(T.SaleTotal11, 3)				   AS SaleTotal11
		   ,ROUND(T.SaleTotal12, 3)				   AS SaleTotal12
		   ,ROUND(T.YearToDateAccruedRevenue, 3)   AS YearToDateAccruedRevenue
		   ,ROUND(T.YearToDateCostOfGoodsSold, 3)  AS YearToDateCostOfGoodsSold
		   ,ROUND(T.YearToDateCreditMemo, 3)	   AS YearToDateCreditMemo
		   ,ROUND(T.YearToDateDiscounts, 3)		   AS YearToDateDiscounts
		   ,ROUND(T.YearToDateDebitMemo, 3)		   AS YearToDateDebitMemo
		   ,ROUND(T.YearToDateFinanceCharge, 3)	   AS YearToDateFinanceCharge
		   ,ROUND(T.YearToDateReceipts, 3)		   AS YearToDateReceipts
		   ,ROUND(T.YearToDateSales, 3)			   AS YearToDateSales
		   ,T.LastUpdate
		FROM ODS.SL.AccountsReceivableHistory T
			INNER JOIN CommonRows			  T2 ON T2.CustomerId	  = T.CustomerId
													AND T2.CompanyId  = T.CompanyId
													AND T2.FiscalYear = T.FiscalYear
		EXCEPT
		SELECT
			T.[CompanyId]
		   ,T.[CustomerId]
		   ,T.[FiscalYear]
		   ,ROUND(T.AccruedRevenueBeginBalance, 3) AS AccruedRevenueBeginBalance
		   ,ROUND(T.BeginBalance, 3)			   AS BeginBalance
		   ,T.CurrencyId
		   ,ROUND(T.NumberOfInvoicesPaid00, 3)	   AS NumberOfInvoicesPaid00
		   ,ROUND(T.NumberOfInvoicesPaid01, 3)	   AS NumberOfInvoicesPaid01
		   ,ROUND(T.NumberOfInvoicesPaid02, 3)	   AS NumberOfInvoicesPaid02
		   ,ROUND(T.NumberOfInvoicesPaid03, 3)	   AS NumberOfInvoicesPaid03
		   ,ROUND(T.NumberOfInvoicesPaid04, 3)	   AS NumberOfInvoicesPaid04
		   ,ROUND(T.NumberOfInvoicesPaid05, 3)	   AS NumberOfInvoicesPaid05
		   ,ROUND(T.NumberOfInvoicesPaid06, 3)	   AS NumberOfInvoicesPaid06
		   ,ROUND(T.NumberOfInvoicesPaid07, 3)	   AS NumberOfInvoicesPaid07
		   ,ROUND(T.NumberOfInvoicesPaid08, 3)	   AS NumberOfInvoicesPaid08
		   ,ROUND(T.NumberOfInvoicesPaid09, 3)	   AS NumberOfInvoicesPaid09
		   ,ROUND(T.NumberOfInvoicesPaid10, 3)	   AS NumberOfInvoicesPaid10
		   ,ROUND(T.NumberOfInvoicesPaid11, 3)	   AS NumberOfInvoicesPaid11
		   ,ROUND(T.NumberOfInvoicesPaid12, 3)	   AS NumberOfInvoicesPaid12
		   ,T.NoteId
		   ,ROUND(T.PaidInvoiceDays00, 3)		   AS PaidInvoiceDays00
		   ,ROUND(T.PaidInvoiceDays01, 3)		   AS PaidInvoiceDays01
		   ,ROUND(T.PaidInvoiceDays02, 3)		   AS PaidInvoiceDays02
		   ,ROUND(T.PaidInvoiceDays03, 3)		   AS PaidInvoiceDays03
		   ,ROUND(T.PaidInvoiceDays04, 3)		   AS PaidInvoiceDays04
		   ,ROUND(T.PaidInvoiceDays05, 3)		   AS PaidInvoiceDays05
		   ,ROUND(T.PaidInvoiceDays06, 3)		   AS PaidInvoiceDays06
		   ,ROUND(T.PaidInvoiceDays07, 3)		   AS PaidInvoiceDays07
		   ,ROUND(T.PaidInvoiceDays08, 3)		   AS PaidInvoiceDays08
		   ,ROUND(T.PaidInvoiceDays09, 3)		   AS PaidInvoiceDays09
		   ,ROUND(T.PaidInvoiceDays10, 3)		   AS PaidInvoiceDays10
		   ,ROUND(T.PaidInvoiceDays11, 3)		   AS PaidInvoiceDays11
		   ,ROUND(T.PaidInvoiceDays12, 3)		   AS PaidInvoiceDays12
		   ,T.PeriodNumber
		   ,ROUND(T.AccruedRevenueChange00, 3)	   AS AccruedRevenueChange00
		   ,ROUND(T.AccruedRevenueChange01, 3)	   AS AccruedRevenueChange01
		   ,ROUND(T.AccruedRevenueChange02, 3)	   AS AccruedRevenueChange02
		   ,ROUND(T.AccruedRevenueChange03, 3)	   AS AccruedRevenueChange03
		   ,ROUND(T.AccruedRevenueChange04, 3)	   AS AccruedRevenueChange04
		   ,ROUND(T.AccruedRevenueChange05, 3)	   AS AccruedRevenueChange05
		   ,ROUND(T.AccruedRevenueChange06, 3)	   AS AccruedRevenueChange06
		   ,ROUND(T.AccruedRevenueChange07, 3)	   AS AccruedRevenueChange07
		   ,ROUND(T.AccruedRevenueChange08, 3)	   AS AccruedRevenueChange08
		   ,ROUND(T.AccruedRevenueChange09, 3)	   AS AccruedRevenueChange09
		   ,ROUND(T.AccruedRevenueChange10, 3)	   AS AccruedRevenueChange10
		   ,ROUND(T.AccruedRevenueChange11, 3)	   AS AccruedRevenueChange11
		   ,ROUND(T.AccruedRevenueChange12, 3)	   AS AccruedRevenueChange12
		   ,ROUND(T.CostOfGoodsSoldTotal00, 3)	   AS CostOfGoodsSoldTotal00
		   ,ROUND(T.CostOfGoodsSoldTotal01, 3)	   AS CostOfGoodsSoldTotal01
		   ,ROUND(T.CostOfGoodsSoldTotal02, 3)	   AS CostOfGoodsSoldTotal02
		   ,ROUND(T.CostOfGoodsSoldTotal03, 3)	   AS CostOfGoodsSoldTotal03
		   ,ROUND(T.CostOfGoodsSoldTotal04, 3)	   AS CostOfGoodsSoldTotal04
		   ,ROUND(T.CostOfGoodsSoldTotal05, 3)	   AS CostOfGoodsSoldTotal05
		   ,ROUND(T.CostOfGoodsSoldTotal06, 3)	   AS CostOfGoodsSoldTotal06
		   ,ROUND(T.CostOfGoodsSoldTotal07, 3)	   AS CostOfGoodsSoldTotal07
		   ,ROUND(T.CostOfGoodsSoldTotal08, 3)	   AS CostOfGoodsSoldTotal08
		   ,ROUND(T.CostOfGoodsSoldTotal09, 3)	   AS CostOfGoodsSoldTotal09
		   ,ROUND(T.CostOfGoodsSoldTotal10, 3)	   AS CostOfGoodsSoldTotal10
		   ,ROUND(T.CostOfGoodsSoldTotal11, 3)	   AS CostOfGoodsSoldTotal11
		   ,ROUND(T.CostOfGoodsSoldTotal12, 3)	   AS CostOfGoodsSoldTotal12
		   ,ROUND(T.CreditMemoTotal00, 3)		   AS CreditMemoTotal00
		   ,ROUND(T.CreditMemoTotal01, 3)		   AS CreditMemoTotal01
		   ,ROUND(T.CreditMemoTotal02, 3)		   AS CreditMemoTotal02
		   ,ROUND(T.CreditMemoTotal03, 3)		   AS CreditMemoTotal03
		   ,ROUND(T.CreditMemoTotal04, 3)		   AS CreditMemoTotal04
		   ,ROUND(T.CreditMemoTotal05, 3)		   AS CreditMemoTotal05
		   ,ROUND(T.CreditMemoTotal06, 3)		   AS CreditMemoTotal06
		   ,ROUND(T.CreditMemoTotal07, 3)		   AS CreditMemoTotal07
		   ,ROUND(T.CreditMemoTotal08, 3)		   AS CreditMemoTotal08
		   ,ROUND(T.CreditMemoTotal09, 3)		   AS CreditMemoTotal09
		   ,ROUND(T.CreditMemoTotal10, 3)		   AS CreditMemoTotal10
		   ,ROUND(T.CreditMemoTotal11, 3)		   AS CreditMemoTotal11
		   ,ROUND(T.CreditMemoTotal12, 3)		   AS CreditMemoTotal12
		   ,ROUND(T.DiscountTotal00, 3)			   AS DiscountTotal00
		   ,ROUND(T.DiscountTotal01, 3)			   AS DiscountTotal01
		   ,ROUND(T.DiscountTotal02, 3)			   AS DiscountTotal02
		   ,ROUND(T.DiscountTotal03, 3)			   AS DiscountTotal03
		   ,ROUND(T.DiscountTotal04, 3)			   AS DiscountTotal04
		   ,ROUND(T.DiscountTotal05, 3)			   AS DiscountTotal05
		   ,ROUND(T.DiscountTotal06, 3)			   AS DiscountTotal06
		   ,ROUND(T.DiscountTotal07, 3)			   AS DiscountTotal07
		   ,ROUND(T.DiscountTotal08, 3)			   AS DiscountTotal08
		   ,ROUND(T.DiscountTotal09, 3)			   AS DiscountTotal09
		   ,ROUND(T.DiscountTotal10, 3)			   AS DiscountTotal10
		   ,ROUND(T.DiscountTotal11, 3)			   AS DiscountTotal11
		   ,ROUND(T.DiscountTotal12, 3)			   AS DiscountTotal12
		   ,ROUND(T.DebitMemoTotal00, 3)		   AS DebitMemoTotal00
		   ,ROUND(T.DebitMemoTotal01, 3)		   AS DebitMemoTotal01
		   ,ROUND(T.DebitMemoTotal02, 3)		   AS DebitMemoTotal02
		   ,ROUND(T.DebitMemoTotal03, 3)		   AS DebitMemoTotal03
		   ,ROUND(T.DebitMemoTotal04, 3)		   AS DebitMemoTotal04
		   ,ROUND(T.DebitMemoTotal05, 3)		   AS DebitMemoTotal05
		   ,ROUND(T.DebitMemoTotal06, 3)		   AS DebitMemoTotal06
		   ,ROUND(T.DebitMemoTotal07, 3)		   AS DebitMemoTotal07
		   ,ROUND(T.DebitMemoTotal08, 3)		   AS DebitMemoTotal08
		   ,ROUND(T.DebitMemoTotal09, 3)		   AS DebitMemoTotal09
		   ,ROUND(T.DebitMemoTotal10, 3)		   AS DebitMemoTotal10
		   ,ROUND(T.DebitMemoTotal11, 3)		   AS DebitMemoTotal11
		   ,ROUND(T.DebitMemoTotal12, 3)		   AS DebitMemoTotal12
		   ,ROUND(T.FinanceChargeTotal00, 3)	   AS FinanceChargeTotal00
		   ,ROUND(T.FinanceChargeTotal01, 3)	   AS FinanceChargeTotal01
		   ,ROUND(T.FinanceChargeTotal02, 3)	   AS FinanceChargeTotal02
		   ,ROUND(T.FinanceChargeTotal03, 3)	   AS FinanceChargeTotal03
		   ,ROUND(T.FinanceChargeTotal04, 3)	   AS FinanceChargeTotal04
		   ,ROUND(T.FinanceChargeTotal05, 3)	   AS FinanceChargeTotal05
		   ,ROUND(T.FinanceChargeTotal06, 3)	   AS FinanceChargeTotal06
		   ,ROUND(T.FinanceChargeTotal07, 3)	   AS FinanceChargeTotal07
		   ,ROUND(T.FinanceChargeTotal08, 3)	   AS FinanceChargeTotal08
		   ,ROUND(T.FinanceChargeTotal09, 3)	   AS FinanceChargeTotal09
		   ,ROUND(T.FinanceChargeTotal10, 3)	   AS FinanceChargeTotal10
		   ,ROUND(T.FinanceChargeTotal11, 3)	   AS FinanceChargeTotal11
		   ,ROUND(T.FinanceChargeTotal12, 3)	   AS FinanceChargeTotal12
		   ,ROUND(T.PaymentReceivedTotal00, 3)	   AS PaymentReceivedTotal00
		   ,ROUND(T.PaymentReceivedTotal01, 3)	   AS PaymentReceivedTotal01
		   ,ROUND(T.PaymentReceivedTotal02, 3)	   AS PaymentReceivedTotal02
		   ,ROUND(T.PaymentReceivedTotal03, 3)	   AS PaymentReceivedTotal03
		   ,ROUND(T.PaymentReceivedTotal04, 3)	   AS PaymentReceivedTotal04
		   ,ROUND(T.PaymentReceivedTotal05, 3)	   AS PaymentReceivedTotal05
		   ,ROUND(T.PaymentReceivedTotal06, 3)	   AS PaymentReceivedTotal06
		   ,ROUND(T.PaymentReceivedTotal07, 3)	   AS PaymentReceivedTotal07
		   ,ROUND(T.PaymentReceivedTotal08, 3)	   AS PaymentReceivedTotal08
		   ,ROUND(T.PaymentReceivedTotal09, 3)	   AS PaymentReceivedTotal09
		   ,ROUND(T.PaymentReceivedTotal10, 3)	   AS PaymentReceivedTotal10
		   ,ROUND(T.PaymentReceivedTotal11, 3)	   AS PaymentReceivedTotal11
		   ,ROUND(T.PaymentReceivedTotal12, 3)	   AS PaymentReceivedTotal12
		   ,ROUND(T.SaleTotal00, 3)				   AS SaleTotal00
		   ,ROUND(T.SaleTotal01, 3)				   AS SaleTotal01
		   ,ROUND(T.SaleTotal02, 3)				   AS SaleTotal02
		   ,ROUND(T.SaleTotal03, 3)				   AS SaleTotal03
		   ,ROUND(T.SaleTotal04, 3)				   AS SaleTotal04
		   ,ROUND(T.SaleTotal05, 3)				   AS SaleTotal05
		   ,ROUND(T.SaleTotal06, 3)				   AS SaleTotal06
		   ,ROUND(T.SaleTotal07, 3)				   AS SaleTotal07
		   ,ROUND(T.SaleTotal08, 3)				   AS SaleTotal08
		   ,ROUND(T.SaleTotal09, 3)				   AS SaleTotal09
		   ,ROUND(T.SaleTotal10, 3)				   AS SaleTotal10
		   ,ROUND(T.SaleTotal11, 3)				   AS SaleTotal11
		   ,ROUND(T.SaleTotal12, 3)				   AS SaleTotal12
		   ,ROUND(T.YearToDateAccruedRevenue, 3)   AS YearToDateAccruedRevenue
		   ,ROUND(T.YearTODateCostOfGoodsSold, 3)  AS YearToDateCostOfGoodsSold
		   ,ROUND(T.YearTODateCreditMemo, 3)	   AS YearToDateCreditMemo
		   ,ROUND(T.YearTODateDiscounts, 3)		   AS YearToDateDiscounts
		   ,ROUND(T.YearToDateDebitMemo, 3)		   AS YearToDateDebitMemo
		   ,ROUND(T.YearTODateFinanceCharge, 3)	   AS YearToDateFinanceCharge
		   ,ROUND(T.YearToDateReceipts, 3)		   AS YearToDateReceipts
		   ,ROUND(T.YearToDateSales, 3)			   AS YearToDateSales
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwARHist T
			INNER JOIN CommonRows	T2 ON T2.CustomerId		= T.CustomerId
										  AND T2.CompanyId	= T.CompanyId
										  AND T2.FiscalYear = T.FiscalYear
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableHistory', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;