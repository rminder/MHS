
-- ===================================================
-- Author:		Randy Minder
-- Create date: 24-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[CustomerIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[CustomerIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.Customer;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.Customer;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-Customer', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT CustomerId
		FROM ODS.SL.Customer
		INTERSECT
		SELECT CustomerId
		FROM ODSStaging.SL.vwCustomer
	)
		,RowDifferences
	AS
	(
		SELECT
			T.CustomerId
		   ,T.City
		   ,T.ClassId
		   ,T.Country
		   ,T.Name
		   ,T.SalesPersonId
		   ,T.State
		   ,T.Status
		   ,T.Zip
		   ,ROUND(T.CreditLimit, 3) AS CreditLImit
		   ,T.LastUpdate
		FROM ODS.SL.Customer	  T
			INNER JOIN CommonRows T2 ON T2.CustomerId = T.CustomerId
		EXCEPT
		SELECT
			T.CustomerId
		   ,T.City
		   ,T.ClassId
		   ,T.Country
		   ,T.Name
		   ,T.SalesPersonId
		   ,T.State
		   ,T.Status
		   ,T.Zip
		   ,ROUND(T.CreditLimit, 3) AS CreditLImit
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwCustomer T
			INNER JOIN CommonRows  T2 ON T2.CustomerId = T.CustomerId
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-Customer', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;