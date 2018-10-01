-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsReceivableBalanceIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsReceivableBalanceIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsReceivableBalance;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.AR_Balances;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableBalance', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

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
		FROM ODS.SL.AccountsReceivableBalance
		INTERSECT
		SELECT
			CompanyId
		   ,CustomerId
		FROM ODSStaging.SL.vwAR_Balances
	)
		,RowDifferences
	AS
	(
		SELECT
			ROUND(T.AgeBalance00, 2)			  AS AgeBalance00
		   ,ROUND(T.AgeBalance01, 2)			  AS AgeBalance01
		   ,ROUND(T.AgeBalance02, 2)			  AS AgeBalance02
		   ,ROUND(T.AgeBalance03, 2)			  AS AgeBalance03
		   ,ROUND(T.AgeBalance04, 2)			  AS AgeBalance04
		   ,ROUND(T.AverageDaysToPay, 2)		  AS AverageDaysToPay
		   ,T.[CompanyId]
		   ,ROUND(T.CreditLImit, 2)				  AS CreditLImit
		   ,ROUND(T.CurrentBalance, 2)			  AS CurrentBalance
		   ,T.CurrencyId
		   ,T.[CustomerId]
		   ,ROUND(T.FutureBalance, 2)			  AS FutureBalance
		   ,T.LastActivityDate
		   ,T.LastAgingDate
		   ,T.LastFinanceChargesDate
		   ,T.LastInvoiceDate
		   ,ROUND(T.LastStatementBalance00, 2)	  AS LastStatementBalance00
		   ,ROUND(T.LastStatementBalance01, 2)	  AS LastStatementBalance01
		   ,ROUND(T.LastStatementBalance02, 2)	  AS LastStatementBalance02
		   ,ROUND(T.LastStatementBalance03, 2)	  AS LastStatementBalance03
		   ,ROUND(T.LastStatementBalance04, 2)	  AS LastStatementBalance04
		   ,ROUND(T.LastStatementBeginBalance, 2) AS LastStatementBeginBalance
		   ,T.LastStatementDate
		   ,T.NumberOfInvoicesPaid
		   ,T.NoteId
		   ,T.PaidInvoiceDays
		   ,T.PeriodNumber
		   ,T.TotalOutstandingOpenOrders
		   ,ROUND(T.TotalPrePaid, 2)			  AS TotalPrePaid
		   ,ROUND(T.TotalShipped, 2)			  AS TotalShipped
		   ,T.LastUpdate
		FROM ODS.SL.AccountsReceivableBalance T
			INNER JOIN CommonRows			  T2 ON T2.CompanyId	  = T.CompanyId
													AND T2.CustomerId = T.CustomerId
		EXCEPT
		SELECT
			ROUND(T.AgeBalance00, 2)			  AS AgeBalance00
		   ,ROUND(T.AgeBalance01, 2)			  AS AgeBalance01
		   ,ROUND(T.AgeBalance02, 2)			  AS AgeBalance02
		   ,ROUND(T.AgeBalance03, 2)			  AS AgeBalance03
		   ,ROUND(T.AgeBalance04, 2)			  AS AgeBalance04
		   ,ROUND(T.AverageDaysToPay, 2)		  AS AverageDaysToPay
		   ,T.[CompanyId]
		   ,ROUND(T.CreditLimit, 2)				  AS CreditLImit
		   ,ROUND(T.CurrentBalance, 2)			  AS CurrentBalance
		   ,T.CurrencyId
		   ,T.[CustomerId]
		   ,ROUND(T.FutureBalance, 2)			  AS FutureBalance
		   ,T.LastActivityDate
		   ,T.LastAgingDate
		   ,T.LastFinanceChargesDate
		   ,T.LastInvoiceDate
		   ,ROUND(T.LastStatementBalance00, 2)	  AS LastStatementBalance00
		   ,ROUND(T.LastStatementBalance01, 2)	  AS LastStatementBalance01
		   ,ROUND(T.LastStatementBalance02, 2)	  AS LastStatementBalance02
		   ,ROUND(T.LastStatementBalance03, 2)	  AS LastStatementBalance03
		   ,ROUND(T.LastStatementBalance04, 2)	  AS LastStatementBalance04
		   ,ROUND(T.LastStatementBeginBalance, 2) AS LastStatementBeginBalance
		   ,T.LastStatementDate
		   ,T.NumberOfInvoicesPaid
		   ,T.NoteId
		   ,T.PaidInvoiceDays
		   ,T.PeriodNumber
		   ,T.TotalOutstandingOpenOrders
		   ,ROUND(T.TotalPrePaid, 2)			  AS TotalPrePaid
		   ,ROUND(T.TotalShipped, 2)			  AS TotalShipped
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwAR_Balances T
			INNER JOIN CommonRows		 T2 ON T2.CompanyId		 = T.CompanyId
											   AND T2.CustomerId = T.CustomerId
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableBalance', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;