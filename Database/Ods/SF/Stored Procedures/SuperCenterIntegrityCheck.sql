-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[SuperCenterIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[SuperCenterIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.SuperCenter;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.Super_Center__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-SuperCenter', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.SuperCenter
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSuper_Center__C
	)
		,RowDifferences
	AS
	(
		SELECT
			T.Id
		   ,T.OwnerId
		   ,T.IsDeleted
		   ,T.Name
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,ROUND(T.ProjectedEquipmentRevenueToTarget, 4) AS ProjectedEquipmentRevenueToTarget
		   ,ROUND(T.ProjectedServiceRevenueToTarget, 4) AS ProjectedServiceRevenueToTarget
		   ,ROUND(T.ProjectedTotalEquipmentRevenue, 4) AS ProjectedTotalEquipmentRevenue
		   ,ROUND(T.ProjectedTotalServiceRevenue, 4) AS ProjectedTotalServiceRevenue
		   ,ROUND(T.TotalEquipmentGrossProfitActual, 4) AS TotalEquipmentGrossProfitActual
		   ,ROUND(T.TotalEquipmentRevenueActual, 4) AS TotalEquipmentRevenueActual
		   ,ROUND(T.TotalServiceGrossProfitActual, 4) AS TotalServiceGrossProfitActual
		   ,ROUND(T.TotalServiceRevenueActual, 4) AS TotalServiceRevenueActual
		   ,ROUND(T.TotalMonthlySalesAverage, 4) AS TotalMonthlySalesAverage
		   ,ROUND(T.TotalMonthlySalesAverageTarget, 4) AS TotalMonthlySalesAverageTarget
		   ,ROUND(T.AdjustedTotalMSATarget, 4) AS AdjustedTotalMSATarget
		   ,T.LastUpdate
		FROM ODS.SF.vwSuperCenter T
			INNER JOIN CommonRows T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18)) AS Id
		   ,T.OwnerId
		   ,T.IsDeleted
		   ,T.Name
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,ROUND(T.ProjectedEquipmentRevenueToTarget, 4) AS ProjectedEquipmentRevenueToTarget
		   ,ROUND(T.ProjectedServiceRevenueToTarget, 4) AS ProjectedServiceRevenueToTarget
		   ,ROUND(T.ProjectedTotalEquipmentRevenue, 4) AS ProjectedTotalEquipmentRevenue
		   ,ROUND(T.ProjectedTotalServiceRevenue, 4) AS ProjectedTotalServiceRevenue
		   ,ROUND(T.TotalEquipmentGrossProfitActual, 4) AS TotalEquipmentGrossProfitActual
		   ,ROUND(T.TotalEquipmentRevenueActual, 4) AS TotalEquipmentRevenueActual
		   ,ROUND(T.TotalServiceGrossProfitActual, 4) AS TotalServiceGrossProfitActual
		   ,ROUND(T.TotalServiceRevenueActual, 4) AS TotalServiceRevenueActual
		   ,ROUND(T.TotalMonthlySalesAverage, 4) AS TotalMonthlySalesAverage
		   ,ROUND(T.TotalMonthlySalesAverageTarget, 4) AS TotalMonthlySalesAverageTarget
		   ,ROUND(T.AdjustedTotalMSATarget, 4) AS AdjustedTotalMSATarget
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSuper_Center__C T
			INNER JOIN CommonRows			 T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Note, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SFLastModifiedDate
	   ,T.LastModifiedDate	AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences							   T
		INNER JOIN ODSStaging.SF.vwSuper_Center__C T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-SuperCenter', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSuper_Center__C
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;