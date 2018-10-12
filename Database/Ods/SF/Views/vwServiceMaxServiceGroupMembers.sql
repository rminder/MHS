﻿CREATE VIEW [SF].[vwServiceMaxServiceGroupMembers]
AS
SELECT
	[RowId]
   ,[Id]
   ,IIF([IsDeleted] = 255, 1, [IsDeleted]) AS [IsDeleted]
   ,[Name]
   ,[CreatedDate]
   ,[CreatedById]
   ,[LastModifiedDate]
   ,[LastModifiedById]
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,[ServiceGroup]
   ,IIF([IsActive] = 255, 1, [IsActive]) AS [IsActive]
   ,[AverageDriveTime]
   ,[AverageSpeed]
   ,[BreakDuration]
   ,[BreakHours]
   ,[BreakType]
   ,[City]
   ,[Country]
   ,[Email]
   ,IIF([EnableScheduling] = 255, 1, [EnableScheduling]) AS [EnableScheduling]
   ,[FixedCost]
   ,[InventoryLocation]
   ,[Latitude]
   ,[Longitude]
   ,[MaxDailyHours]								  AS MaximumDailyHours
   ,[MaxDistance]								  AS MaximumDistance
   ,[MaxHours]									  AS MaximumHours
   ,[Memberinformation]
   ,[OvertimeHours]
   ,[PerHourCost]
   ,[PerMileCost]
   ,[Phone]
   ,[Role]
   ,[SalesForceUser]
   ,IIF([Select] = 255, 1, [Select]) AS [Select]
   ,[ServiceTerritory]
   ,[State]
   ,[Street]
   ,IIF([ThirdParty] = 255, 1, [ThirdParty]) AS [ThirdParty]
   ,[WorkingHours]
   ,[Zip]
   ,[OptimizerExternalId]
   ,[TerritoryServiceTerritoryOptimizerExternalId]
   ,[UserSalesforceUserrUnityAgentId]
   ,IIF([ServiceMaxManageInventory] = 255, 1, [ServiceMaxManageInventory]) AS [ServiceMaxManageInventory]
   ,[LatitudeHome]
   ,[LongitudeHome]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SF].[ServiceMaxServiceGroupMembers];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwServiceMaxServiceGroupMembers] TO [OdsUser]
    AS [dbo];

