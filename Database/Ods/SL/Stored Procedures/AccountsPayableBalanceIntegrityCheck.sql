-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsPayableBalanceIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsPayableBalanceIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsPayableBalance;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.AP_Balances;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableBalance', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

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
		   ,VendorID
		FROM ODS.SL.AccountsPayableBalance
		INTERSECT
		SELECT
			CompanyId
		   ,VendorId
		FROM ODSStaging.SL.vwAP_Balances
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[CompanyId]
		   ,ROUND(T.CurrentBalance, 2)			AS CurrentBalance
		   ,T.CurrencyId
		   ,ROUND(T.CurrentYear1099Box00, 2)	AS CurrentYear1099Box00
		   ,ROUND(T.CurrentYear1099Box01, 2)	AS CurrentYear1099Box01
		   ,ROUND(T.CurrentYear1099Box02, 2)	AS CurrentYear1099Box02
		   ,ROUND(T.CurrentYear1099Box03, 2)	AS CurrentYear1099Box03
		   ,ROUND(T.CurrentYear1099Box04, 2)	AS CurrentYear1099Box04
		   ,ROUND(T.CurrentYear1099Box05, 2)	AS CurrentYear1099Box05
		   ,ROUND(T.CurrentYear1099Box06, 2)	AS CurrentYear1099Box06
		   ,ROUND(T.CurrentYear1099Box07, 2)	AS CurrentYear1099Box07
		   ,ROUND(T.CurrentYear1099Box08, 2)	AS CurrentYear1099Box08
		   ,ROUND(T.CurrentYear1099Box09, 2)	AS CurrentYear1099Box09
		   ,ROUND(T.CurrentYear1099Box10, 2)	AS CurrentYear1099Box10
		   ,ROUND(T.CurrentYear1099Box11, 2)	AS CurrentYear1099Box11
		   ,ROUND(T.CurrentYear1099Box12, 2)	AS CurrentYear1099Box12
		   ,ROUND(T.CurrentYear1099Box13, 2)	AS CurrentYear1099Box13
		   ,ROUND(T.CurrentYear1099Box14, 2)	AS CurrentYear1099Box14
		   ,ROUND(T.CurrentYear1099Interest, 2) AS CurrentYear1099Interest
		   ,ROUND(T.FutureBalance, 2)			AS FutureBalance
		   ,T.LastCheckDate
		   ,T.LastVoucherDate
		   ,T.NoteId
		   ,ROUND(T.NextYear1099Box00, 2)		AS NextYear1099Box00
		   ,ROUND(T.NextYear1099Box01, 2)		AS NextYear1099Box01
		   ,ROUND(T.NextYear1099Box02, 2)		AS NextYear1099Box02
		   ,ROUND(T.NextYear1099Box03, 2)		AS NextYear1099Box03
		   ,ROUND(T.NextYear1099Box04, 2)		AS NextYear1099Box04
		   ,ROUND(T.NextYear1099Box05, 2)		AS NextYear1099Box05
		   ,ROUND(T.NextYear1099Box06, 2)		AS NextYear1099Box06
		   ,ROUND(T.NextYear1099Box07, 2)		AS NextYear1099Box07
		   ,ROUND(T.NextYear1099Box08, 2)		AS NextYear1099Box08
		   ,ROUND(T.NextYear1099Box09, 2)		AS NextYear1099Box09
		   ,ROUND(T.NextYear1099Box10, 2)		AS NextYear1099Box10
		   ,ROUND(T.NextYear1099Box11, 2)		AS NextYear1099Box11
		   ,ROUND(T.NextYear1099Box12, 2)		AS NextYear1099Box12
		   ,ROUND(T.NextYear1099Box13, 2)		AS NextYear1099Box13
		   ,ROUND(T.NextYear1099Box14, 2)		AS NextYear1099Box14
		   ,ROUND(T.NextYear1099Interest, 2)	AS NextYear1099Interest
		   ,T.PeriodNumber
		   ,T.VendorID
		   ,T.LastUpdate
		FROM ODS.SL.AccountsPayableBalance T
			INNER JOIN CommonRows		   T2 ON T2.CompanyId	 = T.CompanyId
												 AND T2.VendorID = T.VendorID
		EXCEPT
		SELECT
			T.[CompanyId]
		   ,ROUND(T.CurrentBalance, 2)			AS CurrentBalance
		   ,T.CurrencyId
		   ,ROUND(T.CurrentYear1099Box00, 2)	AS CurrentYear1099Box00
		   ,ROUND(T.CurrentYear1099Box01, 2)	AS CurrentYear1099Box01
		   ,ROUND(T.CurrentYear1099Box02, 2)	AS CurrentYear1099Box02
		   ,ROUND(T.CurrentYear1099Box03, 2)	AS CurrentYear1099Box03
		   ,ROUND(T.CurrentYear1099Box04, 2)	AS CurrentYear1099Box04
		   ,ROUND(T.CurrentYear1099Box05, 2)	AS CurrentYear1099Box05
		   ,ROUND(T.CurrentYear1099Box06, 2)	AS CurrentYear1099Box06
		   ,ROUND(T.CurrentYear1099Box07, 2)	AS CurrentYear1099Box07
		   ,ROUND(T.CurrentYear1099Box08, 2)	AS CurrentYear1099Box08
		   ,ROUND(T.CurrentYear1099Box09, 2)	AS CurrentYear1099Box09
		   ,ROUND(T.CurrentYear1099Box10, 2)	AS CurrentYear1099Box10
		   ,ROUND(T.CurrentYear1099Box11, 2)	AS CurrentYear1099Box11
		   ,ROUND(T.CurrentYear1099Box12, 2)	AS CurrentYear1099Box12
		   ,ROUND(T.CurrentYear1099Box13, 2)	AS CurrentYear1099Box13
		   ,ROUND(T.CurrentYear1099Box14, 2)	AS CurrentYear1099Box14
		   ,ROUND(T.CurrentYear1099Interest, 2) AS CurrentYear1099Interest
		   ,ROUND(T.FutureBalance, 2)			AS FutureBalance
		   ,T.LastCheckDate
		   ,T.LastVoucherDate
		   ,T.NoteId
		   ,ROUND(T.NextYear1099Box00, 2)		AS NextYear1099Box00
		   ,ROUND(T.NextYear1099Box01, 2)		AS NextYear1099Box01
		   ,ROUND(T.NextYear1099Box02, 2)		AS NextYear1099Box02
		   ,ROUND(T.NextYear1099Box03, 2)		AS NextYear1099Box03
		   ,ROUND(T.NextYear1099Box04, 2)		AS NextYear1099Box04
		   ,ROUND(T.NextYear1099Box05, 2)		AS NextYear1099Box05
		   ,ROUND(T.NextYear1099Box06, 2)		AS NextYear1099Box06
		   ,ROUND(T.NextYear1099Box07, 2)		AS NextYear1099Box07
		   ,ROUND(T.NextYear1099Box08, 2)		AS NextYear1099Box08
		   ,ROUND(T.NextYear1099Box09, 2)		AS NextYear1099Box09
		   ,ROUND(T.NextYear1099Box10, 2)		AS NextYear1099Box10
		   ,ROUND(T.NextYear1099Box11, 2)		AS NextYear1099Box11
		   ,ROUND(T.NextYear1099Box12, 2)		AS NextYear1099Box12
		   ,ROUND(T.NextYear1099Box13, 2)		AS NextYear1099Box13
		   ,ROUND(T.NextYear1099Box14, 2)		AS NextYear1099Box14
		   ,ROUND(T.NextYear1099Interest, 2)	AS NextYear1099Interest
		   ,T.PeriodNumber
		   ,T.VendorId
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwAP_Balances T
			INNER JOIN CommonRows		 T2 ON T2.CompanyId	   = T.CompanyId
											   AND T2.VendorID = T.VendorId
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableBalance', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;