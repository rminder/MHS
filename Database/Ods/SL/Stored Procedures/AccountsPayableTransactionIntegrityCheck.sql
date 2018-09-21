-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsPayableTransactionIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsPayableTransactionIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsPayableTransaction;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.APTran;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableTransaction', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			Account
		   ,BatchNumber
		   ,SubaccountId
		   ,TransactionReferenceNumber
		   ,RecordId
		FROM ODS.SL.AccountsPayableTransaction
		INTERSECT
		SELECT
			Account
		   ,BatchNumber
		   ,SubaccountId
		   ,TransactionReferenceNumber
		   ,RecordID
		FROM ODSStaging.SL.vwAPTran
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Account]
		   ,T.[BatchNumber]
		   ,T.CompanyId
		   ,T.CurrencyId
		   ,ROUND(T.CurrencyRate, 2)			  AS CurrencyRate
		   ,ROUND(T.CurrencyTransactionAmount, 2) AS CurrencyTransactionAmount
		   ,T.DebitOrCredit
		   ,T.EmployeeId
		   ,T.FiscalYear
		   ,T.InventoryId
		   ,T.JournalType
		   ,T.PeriodFinancialDate
		   ,T.PeriodToPost
		   ,T.ProjectId
		   ,T.[RecordId]
		   ,T.[TransactionReferenceNumber]
		   ,T.Released
		   ,T.SiteId
		   ,T.[SubaccountId]
		   ,T.SubSeg1
		   ,T.SubSeg2
		   ,T.TaskId
		   ,ROUND(T.TransactionAmount, 2)		  AS TransactionAmount
		   ,T.TransactionDate
		   ,T.TransactionType
		   ,T.VendorId
		   ,T.TransactionDescription
		   ,T.LastUpdate
		FROM ODS.SL.AccountsPayableTransaction T
			INNER JOIN CommonRows			   T2 ON T2.Account						   = T.Account
													 AND T2.BatchNumber				   = T.BatchNumber
													 AND T2.SubaccountId			   = T.SubaccountId
													 AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
													 AND T2.RecordId				   = T.RecordId
		EXCEPT
		SELECT
			T.[Account]
		   ,T.[BatchNumber]
		   ,T.CompanyId
		   ,T.CurrencyId
		   ,ROUND(T.CurrencyRate, 2)			  AS CurrencyRate
		   ,ROUND(T.CurrencyTransactionAmount, 2) AS CurrencyTransactionAmount
		   ,T.DebitOrCredit
		   ,T.EmployeeId
		   ,T.FiscalYear
		   ,T.InventoryId
		   ,T.JournalType
		   ,T.PeriodFinancialDate
		   ,T.PeriodToPost
		   ,T.ProjectId
		   ,T.[RecordID]
		   ,T.[TransactionReferenceNumber]
		   ,T.Released
		   ,T.SiteId
		   ,T.[SubaccountId]
		   ,T.SubSeg1
		   ,T.SubSeg2
		   ,T.TaskId
		   ,ROUND(T.TransactionAmount, 2)		  AS TransactionAmount
		   ,T.TransactionDate
		   ,T.TransactionType
		   ,T.VendorId
		   ,T.TransactionDescription
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwAPTran T
			INNER JOIN CommonRows	T2 ON T2.Account						= T.Account
										  AND T2.BatchNumber				= T.BatchNumber
										  AND T2.SubaccountId				= T.SubaccountId
										  AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
										  AND T2.RecordId					= T.RecordID
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableTransaction', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;