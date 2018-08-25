
CREATE VIEW [SF].[vwSVMXC__Service_Group_Members__c]
AS
SELECT
	[Id]
   ,[IsDeleted]
   ,ISNULL([Name], '')																			  AS Name
   ,[CreatedDate]
   ,ISNULL([CreatedById], '')																	  AS CreatedById
   ,[LastModifiedDate]
   ,ISNULL([LastModifiedById], '')																  AS LastModifiedById
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,ISNULL([SVMXC__Service_Group__c], '')														  AS ServiceGroup
   ,[SVMXC__Active__c]																			  AS IsActive
   ,[SVMXC__Average_Drive_Time__c]																  AS AverageDriveTime
   ,[SVMXC__Average_Speed__c]																	  AS AverageSpeed
   ,[SVMXC__Break_Duration__c]																	  AS BreakDuration
   ,ISNULL([SVMXC__Break_Hours__c], '')															  AS BreakHours
   ,ISNULL([SVMXC__Break_Type__c], '')															  AS BreakType
   ,ISNULL([SVMXC__City__c], '')																  AS City
   ,ISNULL([SVMXC__Country__c], '')																  AS Country
   ,ISNULL([SVMXC__Email__c], '')																  AS Email
   ,[SVMXC__Enable_Scheduling__c]																  AS EnableScheduling
   ,[SVMXC__Fixed_Cost__c]																		  AS FixedCost
   ,ISNULL([SVMXC__Inventory_Location__c], '')													  AS InventoryLocation
   ,[SVMXC__Latitude__c]																		  AS Latitude
   ,[SVMXC__Longitude__c]																		  AS Longitude
   ,[SVMXC__Max_Daily_Hours__c]																	  AS MaximumDailyHours
   ,[SVMXC__Max_Distance__c]																	  AS MaximumDistance
   ,[SVMXC__Max_Hours__c]																		  AS MaximumHours
   ,ISNULL([SVMXC__Member_information__c], '')													  AS MemberInformation
   ,ISNULL([SVMXC__Overtime_Hours__c], '')														  AS OvertimeHours
   ,[SVMXC__Per_Hour_Cost__c]																	  AS PerHourCost
   ,[SVMXC__Per_Mile_Cost__c]																	  AS PerMileCost
   ,ISNULL([SVMXC__Phone__c], '')																  AS Phone
   ,ISNULL([SVMXC__Role__c], '')																  AS [Role]
   ,ISNULL([SVMXC__Salesforce_User__c], '')														  AS SalesForceUser
   ,[SVMXC__Select__c]																			  AS [SELECT]
   ,ISNULL([SVMXC__Service_Territory__c], '')													  AS ServiceTerritory
   ,ISNULL([SVMXC__State__c], '')																  AS State
   ,ISNULL([SVMXC__Street__c], '')																  AS Street
   ,[SVMXC__Third_Party__c]																		  AS ThirdParty
   ,ISNULL([SVMXC__Working_Hours__c], '')														  AS WorkingHours
   ,ISNULL([SVMXC__Zip__c], '')																	  AS Zip
   ,ISNULL([SVMXC__Optimizer_External_ID__c],'')												  AS OptimizerExternalId
   ,ISNULL([SVMXC__Territory__c_SVMXC__Service_Territory__r_SVMXC__Optimizer_External_ID__c], '') AS TerritoryServiceTerritoryOptimizerExternalId
   ,ISNULL([User_SVMXC__Salesforce_User__r_UNITY_Agent_ID__c], '')								  AS UserSalesforceUserrUnityAgentId
   ,[SVMXC_Manage_Inventory__c]																	  AS ServiceMaxManageInventory
   ,[SVMXC__Latitude_Home__c]																	  AS LatitudeHome
   ,[SVMXC__Longitude_Home__c]																	  AS LongitudeHome
   ,[LastModifiedDate]																			  AS LastUpdate
   ,GETUTCDATE()																				  AS ImportDate
FROM [SF].[SVMXC__Service_Group_Members__c];