-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxServiceGroupMembersIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxServiceGroupMembersIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxServiceGroupMembers;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__Service_Group_Members__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceGroupMembers', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxServiceGroupMembers
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSVMXC__Service_Group_Members__c
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Id]
		   --,T.IsDeleted
		   ,T.Name
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceGroup
		   ,T.IsActive
		   ,ROUND(T.AverageDriveTime, 4)	AS AverageDriveTime
		   ,ROUND(T.AverageSpeed, 4)		AS AverageSpeed
		   ,ROUND(T.BreakDuration, 4)		AS BreakDuration
		   ,T.BreakHours
		   ,T.BreakType
		   ,T.City
		   ,T.Country
		   ,T.Email
		   ,T.EnableScheduling
		   ,ROUND(T.FixedCost, 4)			AS FixedCost
		   ,T.InventoryLocation
		   ,ROUND(T.Latitude, 6)			AS Latitude
		   ,ROUND(T.Longitude, 6)			AS Longitude
		   ,ROUND(T.[MaximumDailyHours], 4) AS MaximumDailyHours
		   ,ROUND(T.[MaximumDistance], 4)	AS MaximumDistance
		   ,ROUND(T.[MaximumHours], 4)		AS MaximumHours
		   ,T.Memberinformation
		   ,T.OvertimeHours
		   ,ROUND(T.PerHourCost, 4)			AS PerHourCost
		   ,ROUND(T.PerMileCost, 4)			AS PerMileCost
		   ,T.Phone
		   ,T.Role
		   ,T.SalesForceUser
		   ,T.[Select]
		   ,T.ServiceTerritory
		   ,T.State
		   ,T.Street
		   ,T.ThirdParty
		   ,T.WorkingHours
		   ,T.Zip
		   ,T.OptimizerExternalId
		   ,T.TerritoryServiceTerritoryOptimizerExternalId
		   ,T.UserSalesforceUserrUnityAgentId
		   ,T.ServiceMaxManageInventory
		   ,ROUND(T.LatitudeHome, 6)		AS LatitudeHome
		   ,ROUND(T.LongitudeHome, 6)		AS LongitudeHome
		   ,T.LastUpdate
		FROM ODS.SF.vwServiceMaxServiceGroupMembers T
			INNER JOIN CommonRows					T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18)) AS Id
		   --,T.IsDeleted
		   ,CAST(T.Name AS VARCHAR(80)) AS Name
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceGroup
		   ,T.IsActive
		   ,ROUND(T.AverageDriveTime, 4)	AS AverageDriveTime
		   ,ROUND(T.AverageSpeed, 4)		AS AverageSpeed
		   ,ROUND(T.BreakDuration, 4)		AS BreakDuration
		   ,T.BreakHours
		   ,T.BreakType
		   ,T.City
		   ,T.Country
		   ,T.Email
		   ,T.EnableScheduling
		   ,ROUND(T.FixedCost, 4)			AS FixedCost
		   ,T.InventoryLocation
		   ,ROUND(T.Latitude, 6)			AS Latitude
		   ,ROUND(T.Longitude, 6)			AS Longitude
		   ,ROUND(T.[MaximumDailyHours], 4) AS MaximumDailyHours
		   ,ROUND(T.[MaximumDistance], 4)	AS MaximumDistance
		   ,ROUND(T.[MaximumHours], 4)		AS MaximumHours
		   ,T.Memberinformation
		   ,T.OvertimeHours
		   ,ROUND(T.PerHourCost, 4)			AS PerHourCost
		   ,ROUND(T.PerMileCost, 4)			AS PerMileCost
		   ,T.Phone
		   ,T.Role
		   ,T.SalesForceUser
		   ,T.[Select]
		   ,T.ServiceTerritory
		   ,T.State
		   ,T.Street
		   ,T.ThirdParty
		   ,T.WorkingHours
		   ,T.Zip
		   ,T.OptimizerExternalId
		   ,T.TerritoryServiceTerritoryOptimizerExternalId
		   ,T.UserSalesforceUserrUnityAgentId
		   ,T.ServiceMaxManageInventory
		   ,ROUND(T.LatitudeHome, 6)		AS LatitudeHome
		   ,ROUND(T.LongitudeHome, 6)		AS LongitudeHome
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__Service_Group_Members__c T
			INNER JOIN CommonRows							 T2 ON T2.Id = T.Id
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
	FROM RowDifferences									   T
		INNER JOIN ODSStaging.SF.vwSVMXC__Service_Group_Members__c T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceGroupMembers', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	 -- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	 -- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__Service_Group_Members__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;