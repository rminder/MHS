-- ===================================================
-- Author:		Randy Minder
-- Create date: 22-September, 3018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsReceivableTransactionIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsReceivableTransactionIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;
	DECLARE @FirstStagingDate DATETIME2(7);

	-- Because of the volume of data in this table, and the time constraints we have (less than 1 hour between iterations)
	-- we're dealing with a subset of ATTran data. Find the earliest last update time in the staging table and we'll
	-- validate all rows equal to and after that date.
	SELECT @FirstStagingDate = MIN(LUpd_DateTime) FROM OdsStaging.SL.ARTran;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsReceivableTransaction
	WHERE LastUpdate >= @FirstStagingDate

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.ARTran;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableTransaction', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			CustomerId
		   ,LineNumber
		   ,RecordId
		   ,TransactionReferenceNumber
		   ,TransactionType
		FROM ODS.SL.AccountsReceivableTransaction
		INTERSECT
		SELECT
			CustomerId
		   ,LineNumber
		   ,RecordID
		   ,TransactionReferenceNumber
		   ,TransactionType
		FROM ODSStaging.SL.vwARTran
	)
		,RowDifferences
	AS
	(
		SELECT
			T.Account
		   ,T.BatchNumber
		   ,T.CompanyId
		   ,T.CurrencyId
		   ,ROUND(T.CurrencyRate, 3)			  AS CurrencyRate
		   ,ROUND(T.CurrencyTransactionAmount, 3) AS CurrencyTransactionAmount
		   ,T.[CustomerId]
		   ,T.DebitOrCredit
		   ,T.FiscalYear
		   ,T.InventoryId
		   ,T.JournalType
		   ,T.[LineNumber]
		   ,T.PeriodToPost
		   ,T.PeriodFinancialDate
		   ,T.ProjectId
		   ,T.[RecordId]
		   ,T.[TransactionReferenceNumber]
		   ,T.Released
		   ,T.SiteId
		   ,T.SalesPersonId
		   ,T.SubaccountId
		   ,T.SubSeg1
		   ,T.SubSeg2
		   ,T.TaskId
		   ,ROUND(T.TransactionAmount, 3)		  AS TransactionAmount
		   ,T.TransactionDate
		   ,T.[TransactionType]
		   ,T.WarehouseLocation
		   ,T.TransactionDescription
		   ,T.LastUpdate
		FROM ODS.SL.AccountsReceivableTransaction T
			INNER JOIN CommonRows				  T2 ON T2.CustomerId					  = T.CustomerId
														AND T2.LineNumber				  = T.LineNumber
														AND T2.RecordId					  = T.RecordId
														AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
														AND T2.TransactionType			  = T.TransactionType
		EXCEPT
		SELECT
			T.Account
		   ,T.BatchNumber
		   ,T.CompanyId
		   ,T.CurrencyId
		   ,ROUND(T.CurrencyRate, 3)			  AS CurrencyRate
		   ,ROUND(T.CurrencyTransactionAmount, 3) AS CurrencyTransactionAmount
		   ,T.[CustomerId]
		   ,T.DebitOrCredit
		   ,T.FiscalYear
		   ,T.InventoryId
		   ,T.JournalType
		   ,T.[LineNumber]
		   ,T.PeriodToPost
		   ,T.PeriodFinancialDate
		   ,T.ProjectId
		   ,T.[RecordID]
		   ,T.[TransactionReferenceNumber]
		   ,T.Released
		   ,T.SiteId
		   ,T.SalesPersonId
		   ,T.SubaccountId
		   ,T.SubSeg1
		   ,T.SubSeg2
		   ,T.TaskId
		   ,ROUND(T.TransactionAmount, 3)		  AS TransactionAmount
		   ,T.TransactionDate
		   ,T.[TransactionType]
		   ,T.WarehouseLocation
		   ,T.TransactionDescription
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwARTran T
			INNER JOIN CommonRows	T2 ON T2.CustomerId						= T.CustomerId
										  AND T2.LineNumber					= T.LineNumber
										  AND T2.RecordId					= T.RecordID
										  AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
										  AND T2.TransactionType			= T.TransactionType
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableTransaction', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;