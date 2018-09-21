-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsPayableHistoryIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsPayableHistoryIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsPayableHistory;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.APHist;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableHistory', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

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
		   ,FiscalYear
		   ,VendorId
		FROM ODS.SL.AccountsPayableHistory
		INTERSECT
		SELECT
			CompanyId
		   ,FiscalYear
		   ,VendorId
		FROM ODSStaging.SL.vwAPHist
	)
		,RowDifferences
	AS
	(
		SELECT
			ROUND(T.BeginBalance, 2)				AS BeginBalance
		   ,T.[CompanyId]
		   ,T.CurrencyId
		   ,T.[FiscalYear]
		   ,T.NoteId
		   ,T.PeriodNumber
		   ,ROUND(T.CreditAdjustments00, 2)			AS CreditAdjustments00
		   ,ROUND(T.CreditAdjustments01, 2)			AS CreditAdjustments01
		   ,ROUND(T.CreditAdjustments02, 2)			AS CreditAdjustments02
		   ,ROUND(T.CreditAdjustments03, 2)			AS CreditAdjustments03
		   ,ROUND(T.CreditAdjustments04, 2)			AS CreditAdjustments04
		   ,ROUND(T.CreditAdjustments05, 2)			AS CreditAdjustments05
		   ,ROUND(T.CreditAdjustments06, 2)			AS CreditAdjustments06
		   ,ROUND(T.CreditAdjustments07, 2)			AS CreditAdjustments07
		   ,ROUND(T.CreditAdjustments08, 2)			AS CreditAdjustments08
		   ,ROUND(T.CreditAdjustments09, 2)			AS CreditAdjustments09
		   ,ROUND(T.CreditAdjustments10, 2)			AS CreditAdjustments10
		   ,ROUND(T.CreditAdjustments11, 2)			AS CreditAdjustments11
		   ,ROUND(T.CreditAdjustments12, 2)			AS CreditAdjustments12
		   ,ROUND(T.DiscountsTaken00, 2)			AS DiscountsTaken00
		   ,ROUND(T.DiscountsTaken01, 2)			AS DiscountsTaken01
		   ,ROUND(T.DiscountsTaken02, 2)			AS DiscountsTaken02
		   ,ROUND(T.DiscountsTaken03, 2)			AS DiscountsTaken03
		   ,ROUND(T.DiscountsTaken04, 2)			AS DiscountsTaken04
		   ,ROUND(T.DiscountsTaken05, 2)			AS DiscountsTaken05
		   ,ROUND(T.DiscountsTaken06, 2)			AS DiscountsTaken06
		   ,ROUND(T.DiscountsTaken07, 2)			AS DiscountsTaken07
		   ,ROUND(T.DiscountsTaken08, 2)			AS DiscountsTaken08
		   ,ROUND(T.DiscountsTaken09, 2)			AS DiscountsTaken09
		   ,ROUND(T.DiscountsTaken10, 2)			AS DiscountsTaken10
		   ,ROUND(T.DiscountsTaken11, 2)			AS DiscountsTaken11
		   ,ROUND(T.DiscountsTaken12, 2)			AS DiscountsTaken12
		   ,ROUND(T.DebitAdjustments00, 2)			AS DebitAdjustments00
		   ,ROUND(T.DebitAdjustments01, 2)			AS DebitAdjustments01
		   ,ROUND(T.DebitAdjustments02, 2)			AS DebitAdjustments02
		   ,ROUND(T.DebitAdjustments03, 2)			AS DebitAdjustments03
		   ,ROUND(T.DebitAdjustments04, 2)			AS DebitAdjustments04
		   ,ROUND(T.DebitAdjustments05, 2)			AS DebitAdjustments05
		   ,ROUND(T.DebitAdjustments06, 2)			AS DebitAdjustments06
		   ,ROUND(T.DebitAdjustments07, 2)			AS DebitAdjustments07
		   ,ROUND(T.DebitAdjustments08, 2)			AS DebitAdjustments08
		   ,ROUND(T.DebitAdjustments09, 2)			AS DebitAdjustments09
		   ,ROUND(T.DebitAdjustments10, 2)			AS DebitAdjustments10
		   ,ROUND(T.DebitAdjustments11, 2)			AS DebitAdjustments11
		   ,ROUND(T.DebitAdjustments12, 2)			AS DebitAdjustments12
		   ,ROUND(T.Payments00, 2)					AS Payments00
		   ,ROUND(T.Payments01, 2)					AS Payments01
		   ,ROUND(T.Payments02, 2)					AS Payments02
		   ,ROUND(T.Payments03, 2)					AS Payments03
		   ,ROUND(T.Payments04, 2)					AS Payments04
		   ,ROUND(T.Payments05, 2)					AS Payments05
		   ,ROUND(T.Payments06, 2)					AS Payments06
		   ,ROUND(T.Payments07, 2)					AS Payments07
		   ,ROUND(T.Payments08, 2)					AS Payments08
		   ,ROUND(T.Payments09, 2)					AS Payments09
		   ,ROUND(T.Payments10, 2)					AS Payments10
		   ,ROUND(T.Payments11, 2)					AS Payments11
		   ,ROUND(T.Payments12, 2)					AS Payments12
		   ,ROUND(T.Purchases00, 2)					AS Purchases00
		   ,ROUND(T.Purchases01, 2)					AS Purchases01
		   ,ROUND(T.Purchases02, 2)					AS Purchases02
		   ,ROUND(T.Purchases03, 2)					AS Purchases03
		   ,ROUND(T.Purchases04, 2)					AS Purchases04
		   ,ROUND(T.Purchases05, 2)					AS Purchases05
		   ,ROUND(T.Purchases06, 2)					AS Purchases06
		   ,ROUND(T.Purchases07, 2)					AS Purchases07
		   ,ROUND(T.Purchases08, 2)					AS Purchases08
		   ,ROUND(T.Purchases09, 2)					AS Purchases09
		   ,ROUND(T.Purchases10, 2)					AS Purchases10
		   ,ROUND(T.Purchases11, 2)					AS Purchases11
		   ,ROUND(T.Purchases12, 2)					AS Purchases12
		   ,T.[VendorId]
		   ,ROUND(T.YearToDateCreditAdjustments, 2) AS YearToDateCreditAdjustments
		   ,ROUND(T.YearToDateDiscountsTaken, 2)	AS YearToDateDiscountsTaken
		   ,ROUND(T.YearToDateDebitAdjustments, 2)	AS YearToDateDebitAdjustments
		   ,ROUND(T.YearToDatePayments, 2)			AS YearToDatePayments
		   ,ROUND(T.YearToDatePurchases, 2)			AS YearToDatePurchases
		   ,T.LastUpdate
		FROM ODS.SL.AccountsPayableHistory T
			INNER JOIN CommonRows		   T2 ON T2.CompanyId	   = T.CompanyId
												 AND T2.VendorId   = T.VendorId
												 AND T2.FiscalYear = T.FiscalYear
		EXCEPT
		SELECT
			ROUND(T.BeginBalance, 2)				AS BeginBalance
		   ,T.[CompanyId]
		   ,T.CurrencyId
		   ,T.[FiscalYear]
		   ,T.NoteId
		   ,T.PeriodNumber
		   ,ROUND(T.CreditAdjustments00, 2)			AS CreditAdjustments00
		   ,ROUND(T.CreditAdjustments01, 2)			AS CreditAdjustments01
		   ,ROUND(T.CreditAdjustments02, 2)			AS CreditAdjustments02
		   ,ROUND(T.CreditAdjustments03, 2)			AS CreditAdjustments03
		   ,ROUND(T.CreditAdjustments04, 2)			AS CreditAdjustments04
		   ,ROUND(T.CreditAdjustments05, 2)			AS CreditAdjustments05
		   ,ROUND(T.CreditAdjustments06, 2)			AS CreditAdjustments06
		   ,ROUND(T.CreditAdjustments07, 2)			AS CreditAdjustments07
		   ,ROUND(T.CreditAdjustments08, 2)			AS CreditAdjustments08
		   ,ROUND(T.CreditAdjustments09, 2)			AS CreditAdjustments09
		   ,ROUND(T.CreditAdjustments10, 2)			AS CreditAdjustments10
		   ,ROUND(T.CreditAdjustments11, 2)			AS CreditAdjustments11
		   ,ROUND(T.CreditAdjustments12, 2)			AS CreditAdjustments12
		   ,ROUND(T.DiscountsTaken00, 2)			AS DiscountsTaken00
		   ,ROUND(T.DiscountsTaken01, 2)			AS DiscountsTaken01
		   ,ROUND(T.DiscountsTaken02, 2)			AS DiscountsTaken02
		   ,ROUND(T.DiscountsTaken03, 2)			AS DiscountsTaken03
		   ,ROUND(T.DiscountsTaken04, 2)			AS DiscountsTaken04
		   ,ROUND(T.DiscountsTaken05, 2)			AS DiscountsTaken05
		   ,ROUND(T.DiscountsTaken06, 2)			AS DiscountsTaken06
		   ,ROUND(T.DiscountsTaken07, 2)			AS DiscountsTaken07
		   ,ROUND(T.DiscountsTaken08, 2)			AS DiscountsTaken08
		   ,ROUND(T.DiscountsTaken09, 2)			AS DiscountsTaken09
		   ,ROUND(T.DiscountsTaken10, 2)			AS DiscountsTaken10
		   ,ROUND(T.DiscountsTaken11, 2)			AS DiscountsTaken11
		   ,ROUND(T.DiscountsTaken12, 2)			AS DiscountsTaken12
		   ,ROUND(T.DebitAdjustments00, 2)			AS DebitAdjustments00
		   ,ROUND(T.DebitAdjustments01, 2)			AS DebitAdjustments01
		   ,ROUND(T.DebitAdjustments02, 2)			AS DebitAdjustments02
		   ,ROUND(T.DebitAdjustments03, 2)			AS DebitAdjustments03
		   ,ROUND(T.DebitAdjustments04, 2)			AS DebitAdjustments04
		   ,ROUND(T.DebitAdjustments05, 2)			AS DebitAdjustments05
		   ,ROUND(T.DebitAdjustments06, 2)			AS DebitAdjustments06
		   ,ROUND(T.DebitAdjustments07, 2)			AS DebitAdjustments07
		   ,ROUND(T.DebitAdjustments08, 2)			AS DebitAdjustments08
		   ,ROUND(T.DebitAdjustments09, 2)			AS DebitAdjustments09
		   ,ROUND(T.DebitAdjustments10, 2)			AS DebitAdjustments10
		   ,ROUND(T.DebitAdjustments11, 2)			AS DebitAdjustments11
		   ,ROUND(T.DebitAdjustments12, 2)			AS DebitAdjustments12
		   ,ROUND(T.Payments00, 2)					AS Payments00
		   ,ROUND(T.Payments01, 2)					AS Payments01
		   ,ROUND(T.Payments02, 2)					AS Payments02
		   ,ROUND(T.Payments03, 2)					AS Payments03
		   ,ROUND(T.Payments04, 2)					AS Payments04
		   ,ROUND(T.Payments05, 2)					AS Payments05
		   ,ROUND(T.Payments06, 2)					AS Payments06
		   ,ROUND(T.Payments07, 2)					AS Payments07
		   ,ROUND(T.Payments08, 2)					AS Payments08
		   ,ROUND(T.Payments09, 2)					AS Payments09
		   ,ROUND(T.Payments10, 2)					AS Payments10
		   ,ROUND(T.Payments11, 2)					AS Payments11
		   ,ROUND(T.Payments12, 2)					AS Payments12
		   ,ROUND(T.Purchases00, 2)					AS Purchases00
		   ,ROUND(T.Purchases01, 2)					AS Purchases01
		   ,ROUND(T.Purchases02, 2)					AS Purchases02
		   ,ROUND(T.Purchases03, 2)					AS Purchases03
		   ,ROUND(T.Purchases04, 2)					AS Purchases04
		   ,ROUND(T.Purchases05, 2)					AS Purchases05
		   ,ROUND(T.Purchases06, 2)					AS Purchases06
		   ,ROUND(T.Purchases07, 2)					AS Purchases07
		   ,ROUND(T.Purchases08, 2)					AS Purchases08
		   ,ROUND(T.Purchases09, 2)					AS Purchases09
		   ,ROUND(T.Purchases10, 2)					AS Purchases10
		   ,ROUND(T.Purchases11, 2)					AS Purchases11
		   ,ROUND(T.Purchases12, 2)					AS Purchases12
		   ,T.[VendorId]
		   ,ROUND(T.YearToDateCreditAdjustments, 2) AS YearToDateCreditAdjustments
		   ,ROUND(T.YearToDateDiscountsTaken, 2)	AS YearToDateDiscountsTaken
		   ,ROUND(T.YearToDateDebitAdjustments, 2)	AS YearToDateDebitAdjustments
		   ,ROUND(T.YearToDatePayments, 2)			AS YearToDatePayments
		   ,ROUND(T.YearToDatePurchases, 2)			AS YearToDatePurchases
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwAPHist T
			INNER JOIN CommonRows	T2 ON T2.CompanyId		= T.CompanyId
										  AND T2.VendorId	= T.VendorId
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
			 ('SL-AccountsPayableHistory', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;