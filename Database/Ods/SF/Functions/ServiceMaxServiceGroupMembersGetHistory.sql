-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 29-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxServiceGroupMembersGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxServiceGroupMembersGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [varchar](18) NOT NULL,
	[IsDeleted] [tinyint] NULL,
	[Name] [varchar](80) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [varchar](18) NOT NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[LastModifiedById] [varchar](18) NOT NULL,
	[SystemModstamp] [datetime2](7) NULL,
	[LastActivityDate] [datetime2](7) NULL,
	[LastViewedDate] [datetime2](7) NULL,
	[LastReferencedDate] [datetime2](7) NULL,
	[ServiceGroup] [varchar](18) NOT NULL,
	[IsActive] [tinyint] NULL,
	[AverageDriveTime] [decimal](32, 16) NULL,
	[AverageSpeed] [decimal](32, 16) NULL,
	[BreakDuration] [decimal](32, 16) NULL,
	[BreakHours] [varchar](18) NOT NULL,
	[BreakType] [varchar](255) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[EnableScheduling] [tinyint] NULL,
	[FixedCost] [decimal](32, 16) NULL,
	[InventoryLocation] [varchar](18) NOT NULL,
	[Latitude] [decimal](32, 16) NULL,
	[Longitude] [decimal](32, 16) NULL,
	[MaxDailyHours] [decimal](32, 16) NULL,
	[MaxDistance] [decimal](32, 16) NULL,
	[MaxHours] [decimal](32, 16) NULL,
	[Memberinformation] [varchar](max) NOT NULL,
	[OvertimeHours] [varchar](18) NOT NULL,
	[PerHourCost] [decimal](32, 16) NULL,
	[PerMileCost] [decimal](32, 16) NULL,
	[Phone] [varchar](40) NOT NULL,
	[Role] [varchar](255) NOT NULL,
	[SalesForceUser] [varchar](18) NOT NULL,
	[Select] [tinyint] NULL,
	[ServiceTerritory] [varchar](18) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[Street] [varchar](255) NOT NULL,
	[ThirdParty] [tinyint] NULL,
	[WorkingHours] [varchar](18) NOT NULL,
	[Zip] [varchar](100) NOT NULL,
	[OptimizerExternalId] [varchar](255) NOT NULL,
	[TerritoryServiceTerritoryOptimizerExternalId] [varchar](255) NOT NULL,
	[UserSalesforceUserrUnityAgentId] [varchar](18) NOT NULL,
	[ServiceMaxManageInventory] [tinyint] NULL,
	[LatitudeHome] [decimal](32, 16) NULL,
	[LongitudeHome] [decimal](32, 16) NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL,
	[__Operation] CHAR(1) NOT NULL,
	[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	DECLARE @DistinctPKValue TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)
	)
	DECLARE @ActivityTable TABLE 
	(
		RowId BIGINT NOT NULL,
		ValidFrom DATETIME2	 NOT NULL,
		ValidTo DATETIME2 NOT NULL,
		RowNumber INT NOT NULL,
		MaxRowNumber INT NOT NULL,
		UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	)
	DECLARE @EndDateTableState TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)	
	)
	DECLARE @InsertUpdateDeleteTable TABLE 
	(
		RowId BIGINT NOT NULL,
		Operation CHAR(1) NOT NULL,
		OperationDate DATETIME2 NOT NULL,
		UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	)

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT RowId
	FROM SF.ServiceMaxServiceGroupMembers FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxServiceGroupMembers
		FOR SYSTEM_TIME AS OF @EndDateUtc T
	INNER JOIN @EndDateTableState T2 ON T2.RowId = T.RowId

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		 T.RowId
		,ValidFrom
		,ValidTo
		,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
		,SUM(1) OVER (PARTITION BY T.RowId) AS MaxRowNumber
	FROM SF.ServiceMaxServiceGroupMembers FOR SYSTEM_TIME ALL T 
	INNER JOIN @DistinctPKValue T2 ON T2.RowId = T.RowId

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT Into @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
		,'I' AS Operation
		,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE RowNumber = 1 AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc

	-- Store all the deletes. A delete can be identified by a row in @ActivityTable where RowNumber = MaxRowNumber and the row
	-- doesn't exist in @EndDateStateTable
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
	   ,'D'		AS Operation
	   ,ValidTo AS OperationDate
	FROM @ActivityTable				 T
		LEFT JOIN @EndDateTableState T2 ON T2.RowId = T.RowId
	WHERE
		T.RowNumber = T.MaxRowNumber
		AND T2.RowId IS NULL;

	-- Store all updates. An update can be identified by a row whose RowNumber > 1. If a row is inserted and then deleted (with no updates)
	-- there will only be a single row in history. Each time a row is updated, an entry is added to history. Therefore, the total number of
	-- updates for a row will be maximum row number - 1.
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
		,'U' AS Operation
		,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;WITH BaseTableActivity AS
	(
		SELECT 
			 [RowId]
			,[Id]
			,[IsDeleted]
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
			,[IsActive]
			,[AverageDriveTime]
			,[AverageSpeed]
			,[BreakDuration]
			,[BreakHours]
			,[BreakType]
			,[City]
			,[Country]
			,[Email]
			,[EnableScheduling]
			,[FixedCost]
			,[InventoryLocation]
			,[Latitude]
			,[Longitude]
			,[MaxDailyHours]
			,[MaxDistance]
			,[MaxHours]
			,[Memberinformation]
			,[OvertimeHours]
			,[PerHourCost]
			,[PerMileCost]
			,[Phone]
			,[Role]
			,[SalesForceUser]
			,[Select]
			,[ServiceTerritory]
			,[State]
			,[Street]
			,[ThirdParty]
			,[WorkingHours]
			,[Zip]
			,[OptimizerExternalId]
			,[TerritoryServiceTerritoryOptimizerExternalId]
			,[UserSalesforceUserrUnityAgentId]
			,[ServiceMaxManageInventory]
			,[LatitudeHome]
			,[LongitudeHome]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.ServiceMaxServiceGroupMembers
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Id]
			,[IsDeleted]
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
			,[IsActive]
			,[AverageDriveTime]
			,[AverageSpeed]
			,[BreakDuration]
			,[BreakHours]
			,[BreakType]
			,[City]
			,[Country]
			,[Email]
			,[EnableScheduling]
			,[FixedCost]
			,[InventoryLocation]
			,[Latitude]
			,[Longitude]
			,[MaxDailyHours]
			,[MaxDistance]
			,[MaxHours]
			,[Memberinformation]
			,[OvertimeHours]
			,[PerHourCost]
			,[PerMileCost]
			,[Phone]
			,[Role]
			,[SalesForceUser]
			,[Select]
			,[ServiceTerritory]
			,[State]
			,[Street]
			,[ThirdParty]
			,[WorkingHours]
			,[Zip]
			,[OptimizerExternalId]
			,[TerritoryServiceTerritoryOptimizerExternalId]
			,[UserSalesforceUserrUnityAgentId]
			,[ServiceMaxManageInventory]
			,[LatitudeHome]
			,[LongitudeHome]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
			,__Operation
			,__OperationDate
		)
	SELECT DISTINCT
 		 T.[RowId]
		,T.Id
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
		,T.ServiceGroup
		,T.IsActive
		,T.AverageDriveTime
		,T.AverageSpeed
		,T.BreakDuration
		,T.BreakHours
		,T.BreakType
		,T.City
		,T.Country
		,T.Email
		,T.EnableScheduling
		,T.FixedCost
		,T.InventoryLocation
		,T.Latitude
		,T.Longitude
		,T.MaxDailyHours
		,T.MaxDistance
		,T.MaxHours
		,T.Memberinformation
		,T.OvertimeHours
		,T.PerHourCost
		,T.PerMileCost
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
		,T.LatitudeHome
		,T.LongitudeHome
		,T.LastUpdate
		,T.ImportDate
		,T.ValidFrom
		,T.ValidTo
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END