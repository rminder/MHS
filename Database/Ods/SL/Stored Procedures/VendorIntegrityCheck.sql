
-- ===================================================
-- Author:		Randy Minder
-- Create date: 24-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[VendorIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[VendorIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.Vendor;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.Vendor;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-Vendor', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT VendorId
		FROM ODS.SL.Vendor
		INTERSECT
		SELECT VendorId
		FROM ODSStaging.SL.vwVendor
	)
		,RowDifferences
	AS
	(
		SELECT
       T.City
      ,T.ClassId
      ,T.Country
      ,T.Name
      ,T.State
      ,T.Status
      ,T.VendorId
      ,T.Zip
      ,T.LastUpdate
		FROM ODS.SL.Vendor	  T
			INNER JOIN CommonRows T2 ON T2.VendorId = T.VendorId
		EXCEPT
		SELECT
       T.City
      ,T.ClassId
      ,T.Country
      ,T.Name
      ,T.State
      ,T.Status
      ,T.VendorId
      ,T.Zip
      ,T.LastUpdate
		FROM ODSStaging.SL.vwVendor T
			INNER JOIN CommonRows  T2 ON T2.VendorId = T.VendorId
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-Vendor', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;