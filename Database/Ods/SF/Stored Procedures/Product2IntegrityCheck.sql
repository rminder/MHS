-- ===================================================
-- Author:		Randy Minder
-- Create date: 02-October, 3018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[Product2IntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[Product2IntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.Product2;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.Product2;

	IF (@OdsRowCount > @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-Product2', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables. We'll end up with rows in SF that are
		-- not in Ods.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.Product2
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwMH_Invoice_c
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Id]
		   ,T.Name
		   ,T.ProductCode
		   ,T.Description
		   ,T.IsActive
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.Family
		   ,T.RecordTypeId
		   ,T.ExternalDataSourceId
		   ,T.ExternalId
		   ,T.DisplayUrl
		   ,T.QuantityUnitOfMeasure
		   ,T.IsDeleted
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceMaxEnableSerializedTracking
		   ,T.ServiceMaxInheritParentWarranty
		   ,ROUND(T.ServiceMaxProductCost, 3) AS ServiceMaxProductCost
		   ,T.ServiceMaxProductLine
		   ,T.ServiceMaxSelect
		   ,T.ServiceMaxStockable
		   ,T.ServiceMaxTracking
		   ,T.ServiceMaxUnitOfMeasure
		   ,T.ServiceMaxReplacementAvailable
		   ,T.Capacity
		   ,T.HighUsageProduct
		   ,T.Broad
		   ,T.[Group]
		   ,T.Type
		   ,T.PartSerialNumber
		   ,T.Model
		   ,T.Make1
		   ,T.ProductId
		   ,T.UnityProductExternalId
		   ,ROUND(T.SsvyOptimalCost, 3)		  AS SsvyOptimalCost
		   ,T.UnityIsMenuPricing
		   ,T.UnityAssetType
		   ,T.UnityBumperThickness
		   ,T.ServiceMaxProductType
		   ,T.UnityIsStockable
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwProduct2 T
			INNER JOIN CommonRows	  T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			T.[Id]
		   ,T.Name
		   ,T.ProductCode
		   ,T.Description
		   ,T.IsActive
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.Family
		   ,T.RecordTypeId
		   ,T.ExternalDataSourceId
		   ,T.ExternalId
		   ,T.DisplayUrl
		   ,T.QuantityUnitOfMeasure
		   ,T.IsDeleted
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceMaxEnableSerializedTracking
		   ,T.ServiceMaxInheritParentWarranty
		   ,ROUND(T.ServiceMaxProductCost, 3) AS ServiceMaxProductCost
		   ,T.ServiceMaxProductLine
		   ,T.ServiceMaxSelect
		   ,T.ServiceMaxStockable
		   ,T.ServiceMaxTracking
		   ,T.ServiceMaxUnitOfMeasure
		   ,T.ServiceMaxReplacementAvailable
		   ,T.Capacity
		   ,T.HighUsageProduct
		   ,T.Broad
		   ,T.[Group]
		   ,T.Type
		   ,T.PartSerialNumber
		   ,T.Model
		   ,T.Make1
		   ,T.ProductId
		   ,T.UnityProductExternalId
		   ,ROUND(T.SSVYOptimalCost, 3)		  AS SsvyOptimalCost
		   ,T.UnityIsMenuPricing
		   ,T.UnityAssetType
		   ,T.UnityBumperThickness
		   ,T.ServiceMaxProductType
		   ,T.UnityIsStockable
		   ,T.LastUpdate
		FROM ODS.SF.vwProduct2	  T
			INNER JOIN CommonRows T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Product2, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SfLastModifiedDate
	   ,T3.LastModifiedDate AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences					  T
		INNER JOIN ODSStaging.SF.Product2 T2 ON T.Id = T2.Id
		INNER JOIN ODS.SF.Product2		  T3 ON T.Id = T3.Id
	WHERE T2.LastModifiedDate <= T3.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-Product2', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.Product2
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;