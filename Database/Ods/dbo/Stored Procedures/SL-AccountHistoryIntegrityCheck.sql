
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
--
-- Exec [dbo].[SL-AccountHistoryIntegrityCheck]
-- =============================================
CREATE PROCEDURE [dbo].[SL-AccountHistoryIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountHistory;
	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.AcctHist;
	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountHistory', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			CompanyId
		   ,Account
		   ,SubaccountId
		   ,LedgerId
		   ,FiscalYear
		FROM ODS.SL.AccountHistory
		INTERSECT
		SELECT
			CompanyId
		   ,Account
		   ,SubaccountId
		   ,LedgerId
		   ,FiscalYear
		FROM ODSStaging.SL.vwAcctHist
	)
		,RowDifferences
	AS
	(
		SELECT
			T.CompanyId
		   ,T.Account
		   ,T.SubaccountId
		   ,T.LedgerId
		   ,T.FiscalYear
		   ,[BalanceType]
		   ,ROUND([BeginningBalance], 2)	   AS BeginningBalance
		   ,[CurrencyId]
		   ,CAST([BudgetRevisionDate] AS DATE) AS BudgetRevisionDate
		   ,ROUND([PostedBalance00], 2)		   AS PostedBalance00
		   ,ROUND([PostedBalance01], 2)		   AS PostedBalance01
		   ,ROUND([PostedBalance02], 2)		   AS PostedBalance02
		   ,ROUND([PostedBalance03], 2)		   AS PostedBalance03
		   ,ROUND([PostedBalance04], 2)		   AS PostedBalance04
		   ,ROUND([PostedBalance05], 2)		   AS PostedBalance05
		   ,ROUND([PostedBalance06], 2)		   AS PostedBalance06
		   ,ROUND([PostedBalance07], 2)		   AS PostedBalance07
		   ,ROUND([PostedBalance08], 2)		   AS PostedBalance08
		   ,ROUND([PostedBalance09], 2)		   AS PostedBalance09
		   ,ROUND([PostedBalance10], 2)		   AS PostedBalance10
		   ,ROUND([PostedBalance11], 2)		   AS PostedBalance11
		   ,ROUND([PostedBalance12], 2)		   AS PostedBalance12
		   ,CAST([LastUpdate] AS DATETIME2(7)) AS LastUpdate
		FROM ODS.SL.vwAccountHistory T
			INNER JOIN CommonRows	 T2 ON T2.CompanyId		   = T.CompanyId
										   AND T2.Account	   = T.Account
										   AND T2.SubaccountId = T.SubaccountId
										   AND T2.LedgerId	   = T.LedgerId
										   AND T2.FiscalYear   = T.FiscalYear
		EXCEPT
		SELECT
			T.CompanyId
		   ,T.Account
		   ,T.SubaccountId
		   ,T.LedgerId
		   ,T.FiscalYear
		   ,[BalanceType]
		   ,ROUND([BeginningBalance], 2)	   AS BeginningBalance
		   ,[CurrencyId]
		   ,CAST([BudgetRevisionDate] AS DATE) AS BudgetRevisionDate
		   ,ROUND([PostedBalance00], 2)		   AS PostedBalance00
		   ,ROUND([PostedBalance01], 2)		   AS PostedBalance01
		   ,ROUND([PostedBalance02], 2)		   AS PostedBalance02
		   ,ROUND([PostedBalance03], 2)		   AS PostedBalance03
		   ,ROUND([PostedBalance04], 2)		   AS PostedBalance04
		   ,ROUND([PostedBalance05], 2)		   AS PostedBalance05
		   ,ROUND([PostedBalance06], 2)		   AS PostedBalance06
		   ,ROUND([PostedBalance07], 2)		   AS PostedBalance07
		   ,ROUND([PostedBalance08], 2)		   AS PostedBalance08
		   ,ROUND([PostedBalance09], 2)		   AS PostedBalance09
		   ,ROUND([PostedBalance10], 2)		   AS PostedBalance10
		   ,ROUND([PostedBalance11], 2)		   AS PostedBalance11
		   ,ROUND([PostedBalance12], 2)		   AS PostedBalance12
		   ,CAST([LastUpdate] AS DATETIME2(7)) AS LastUpdate
		FROM ODSStaging.SL.vwAcctHist T
			INNER JOIN CommonRows	  T2 ON T2.CompanyId		= T.CompanyId
											AND T2.Account		= T.Account
											AND T2.SubaccountId = T.SubaccountId
											AND T2.LedgerId		= T.LedgerId
											AND T2.FiscalYear	= T.FiscalYear
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountHistory'
			 ,'Difference in column values'
			 ,0
			 ,0
			 ,(SELECT * FROM #TempTable FOR JSON AUTO --PATH, ROOT('Row'))
)			);

END;