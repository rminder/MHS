-- ===================================================
-- Author:		Randy Minder
-- Create date: 22-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[GeneralLedgerTransactionIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[GeneralLedgerTransactionIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;
	DECLARE @FirstStagingDate DATETIME2(7);

	-- Because of the volume of data in this table, and the time constraints we have (less than 1 hour between iterations)
	-- we're dealing with a subset of ATTran data. Find the earliest last update time in the staging table and we'll
	-- validate all rows equal to and after that date.
	SELECT @FirstStagingDate = MIN(LUpd_DateTime) FROM OdsStaging.SL.GLTran;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.GeneralLedgerTransaction
	WHERE LastUpdate >= @FirstStagingDate

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.GLTran;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-GeneralLedgerTransaction', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			BatchNumber
		   ,LineNumber
		   ,Module
		FROM ODS.SL.GeneralLedgerTransaction
		INTERSECT
		SELECT
			BatchNumber
		   ,LineNumber
		   ,Module
		FROM ODSStaging.SL.vwGLTran
	)
		,RowDifferences
	AS
	(
		SELECT
			T.Account
		   ,T.BaseCurrencyId
		   ,T.[BatchNumber]
		   ,T.CompanyId
		   ,ROUND(T.CreditAmount, 3)		 AS CreditAmount
		   ,ROUND(T.CurrencyCreditAmount, 3) AS CurrencyCreditAmount
		   ,ROUND(T.CurrencyDebitAmount, 3)	 AS CurrencyDebitAmount
		   ,T.CurrencyId
		   ,T.CurrencyRate
		   ,ROUND(T.DebitAmount, 3)			 AS DebitAmount
		   ,T.FiscalYear
		   ,T.JournalType
		   ,T.LedgerId
		   ,T.[LineNumber]
		   ,T.[Module]
		   ,T.PeriodToPost
		   ,T.PeriodFinancialDate
		   ,T.Posted
		   ,T.ProjectId
		   ,T.Released
		   ,T.SubaccountId
		   ,T.SubSeg1
		   ,T.SubSeg2
		   ,T.TaskId
		   ,T.TransactionDate
		   ,T.TransactionDesc
		   ,T.TransactionType
		   ,T.TransactionReferenceNumber
		   ,T.BalanceType
		   ,T.LastUpdate
		FROM ODS.SL.GeneralLedgerTransaction T
			INNER JOIN CommonRows			 T2 ON T2.BatchNumber	 = T.BatchNumber
												   AND T2.LineNumber = T.LineNumber
												   AND T2.Module	 = T.Module
		EXCEPT
		SELECT
			T.Account
		   ,T.BaseCurrencyId
		   ,T.[BatchNumber]
		   ,T.CompanyId
		   ,ROUND(T.CreditAmount, 3)		 AS CreditAmount
		   ,ROUND(T.CurrencyCreditAmount, 3) AS CurrencyCreditAmount
		   ,ROUND(T.CurrencyDebitAmount, 3)	 AS CurrencyDebitAmount
		   ,T.CurrencyId
		   ,T.CurrencyRate
		   ,ROUND(T.DebitAmount, 3)			 AS DebitAmount
		   ,T.FiscalYear
		   ,T.JournalType
		   ,T.LedgerId
		   ,T.[LineNumber]
		   ,T.[Module]
		   ,T.PeriodToPost
		   ,T.PeriodFinancialDate
		   ,T.Posted
		   ,T.ProjectId
		   ,T.Released
		   ,T.SubaccountId
		   ,T.SubSeg1
		   ,T.SubSeg2
		   ,T.TaskId
		   ,T.TransactionDate
		   ,T.TransactionDescription
		   ,T.TransactionType
		   ,T.TransactionReferenceNumber
		   ,T.BalanceType
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwGLTran T
			INNER JOIN CommonRows	T2 ON T2.BatchNumber	= T.BatchNumber
										  AND T2.LineNumber = T.LineNumber
										  AND T2.Module		= T.Module
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-GeneralLedgerTransaction', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;