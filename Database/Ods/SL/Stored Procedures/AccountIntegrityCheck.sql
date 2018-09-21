-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountHistoryIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.Account;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.Account;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-Account', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Account
		FROM ODS.SL.Account
		INTERSECT
		SELECT Account
		FROM ODSStaging.SL.vwAccount
	)
	,RowDifferences
	AS
	(
		SELECT
			T.Account
		   ,T.AccountType
		   ,T.AccountCategory
		   ,T.AccountCategorySpecified
		   ,T.Active
		   ,T.ClassId
		   ,T.ConsolidationAccount
		   ,T.CurrencyId
		   ,T.Description
		   ,T.RatioGroup
		   ,T.IsSummarized
		   ,T.LastUpdate
		FROM ODS.SL.vwAccount	  T
			INNER JOIN CommonRows T2 ON T2.Account = T.Account
		EXCEPT
		SELECT
			T.Account
		   ,T.AccountType
		   ,T.AccountCategory
		   ,T.AccountCategorySpecified
		   ,T.Active
		   ,T.ClassId
		   ,T.ConsolidationAccount
		   ,T.CurrencyId
		   ,T.Description
		   ,T.RatioGroup
		   ,T.IsSummarized
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwAccount T
			INNER JOIN CommonRows	  T2 ON T2.Account = T.Account
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-Account'
			 ,'Difference in column values'
			 ,0
			 ,0
			 ,(SELECT * FROM #TempTable FOR JSON AUTO
)			);

END;