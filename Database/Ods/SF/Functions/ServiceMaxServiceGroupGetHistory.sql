-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 29-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxServiceGroupGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxServiceGroupGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [varchar](18) NOT NULL,
	[OwnerId] [varchar](18) NOT NULL,
	[IsDeleted] [tinyint] NULL,
	[Name] [varchar](80) NOT NULL,
	[RecordTypeId] [varchar](18) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [varchar](18) NOT NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[LastModifiedById] [varchar](18) NOT NULL,
	[SystemModStamp] [datetime2](7) NULL,
	[LastActivityDate] [datetime2](7) NULL,
	[LastViewedDate] [datetime2](7) NULL,
	[LastReferencedDate] [datetime2](7) NULL,
	[IsActive] [tinyint] NULL,
	[City] [varchar](100) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[GroupCode] [varchar](100) NOT NULL,
	[GroupType] [varchar](255) NOT NULL,
	[Latitude] [decimal](32, 16) NULL,
	[Longitude] [decimal](32, 16) NULL,
	[Phone] [varchar](40) NOT NULL,
	[Select] [tinyint] NULL,
	[State] [varchar](100) NOT NULL,
	[Street] [varchar](255) NOT NULL,
	[Zip] [varchar](100) NOT NULL,
	[SuperCenter] [varchar](255) NOT NULL,
	[Segment] [varchar](255) NOT NULL,
	[CompanyCode] [varchar](25) NOT NULL,
	[Company] [varchar](25) NOT NULL,
	[CompanyLegalName] [varchar](40) NOT NULL,
	[OptimizerConnectionName] [varchar](100) NOT NULL,
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
	FROM SF.ServiceMaxServiceGroup FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxServiceGroup
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
	FROM SF.ServiceMaxServiceGroup FOR SYSTEM_TIME ALL T 
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
			,[OwnerId]
			,[IsDeleted]
			,[Name]
			,[RecordTypeId]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModStamp]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[IsActive]
			,[City]
			,[Country]
			,[Description]
			,[Email]
			,[GroupCode]
			,[GroupType]
			,[Latitude]
			,[Longitude]
			,[Phone]
			,[Select]
			,[State]
			,[Street]
			,[Zip]
			,[SuperCenter]
			,[Segment]
			,[CompanyCode]
			,[Company]
			,[CompanyLegalName]
			,[OptimizerConnectionName]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.ServiceMaxServiceGroup
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Id]
			,[OwnerId]
			,[IsDeleted]
			,[Name]
			,[RecordTypeId]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModStamp]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[IsActive]
			,[City]
			,[Country]
			,[Description]
			,[Email]
			,[GroupCode]
			,[GroupType]
			,[Latitude]
			,[Longitude]
			,[Phone]
			,[Select]
			,[State]
			,[Street]
			,[Zip]
			,[SuperCenter]
			,[Segment]
			,[CompanyCode]
			,[Company]
			,[CompanyLegalName]
			,[OptimizerConnectionName]
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
		,[OwnerId]
		,T.IsDeleted
		,T.Name
		,T.RecordTypeId
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,[LastActivityDate]
		,T.LastViewedDate
		,T.LastReferencedDate
		,T.IsActive
		,[City]
		,[Country]
		,T.Description
		,[Email]
		,[GroupCode]
		,[GroupType]
		,[Latitude]
		,[Longitude]
		,[Phone]
		,[Select]
		,[State]
		,[Street]
		,[Zip]
		,[SuperCenter]
		,[Segment]
		,[CompanyCode]
		,[Company]
		,[CompanyLegalName]
		,[OptimizerConnectionName]
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