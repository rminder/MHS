
-- =============================================
-- Author:		Randy Minder
-- Create date: 15-August, 2018
-- Description:	Get all history for the target
--		table.
-- =============================================
CREATE FUNCTION [SL].[BudgetDistributionTypeGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] [int] NOT NULL,
	[DistributionType] [varchar](8) NOT NULL,
	[Description] [varchar](30) NOT NULL,
	[NoteId] [int] NOT NULL,
	[BudgetPercent00] [decimal](32, 16) NOT NULL,
	[BudgetPercent01] [decimal](32, 16) NOT NULL,
	[BudgetPercent02] [decimal](32, 16) NOT NULL,
	[BudgetPercent03] [decimal](32, 16) NOT NULL,
	[BudgetPercent04] [decimal](32, 16) NOT NULL,
	[BudgetPercent05] [decimal](32, 16) NOT NULL,
	[BudgetPercent06] [decimal](32, 16) NOT NULL,
	[BudgetPercent07] [decimal](32, 16) NOT NULL,
	[BudgetPercent08] [decimal](32, 16) NOT NULL,
	[BudgetPercent09] [decimal](32, 16) NOT NULL,
	[BudgetPercent10] [decimal](32, 16) NOT NULL,
	[BudgetPercent11] [decimal](32, 16) NOT NULL,
	[BudgetPercentTotal] [decimal](32, 16) NOT NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
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
	FROM SL.BudgetDistributionType FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SL.BudgetDistributionType
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
	FROM SL.BudgetDistributionType FOR SYSTEM_TIME ALL T 
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
			,[DistributionType]
			,[Description]
			,[NoteId]
			,[BudgetPercent00]
			,[BudgetPercent01]
			,[BudgetPercent02]
			,[BudgetPercent03]
			,[BudgetPercent04]
			,[BudgetPercent05]
			,[BudgetPercent06]
			,[BudgetPercent07]
			,[BudgetPercent08]
			,[BudgetPercent09]
			,[BudgetPercent10]
			,[BudgetPercent11]
			,[BudgetPercentTotal]
			,[LastUpdate]
			,[ImportDate]
			,ValidFrom
			,ValidTo
		FROM SL.BudgetDistributionType
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
	(
		 [RowId]
		,[DistributionType]
		,[Description]
		,[NoteId]
		,[BudgetPercent00]
		,[BudgetPercent01]
		,[BudgetPercent02]
		,[BudgetPercent03]
		,[BudgetPercent04]
		,[BudgetPercent05]
		,[BudgetPercent06]
		,[BudgetPercent07]
		,[BudgetPercent08]
		,[BudgetPercent09]
		,[BudgetPercent10]
		,[BudgetPercent11]
		,[BudgetPercentTotal]
		,[LastUpdate]
		,[ImportDate]
		,__Operation
		,__OperationDate
	)
	SELECT DISTINCT
		 T.[RowId]
		,T.[DistributionType]
		,T.[Description]
		,T.[NoteId]
		,T.[BudgetPercent00]
		,T.[BudgetPercent01]
		,T.[BudgetPercent02]
		,T.[BudgetPercent03]
		,T.[BudgetPercent04]
		,T.[BudgetPercent05]
		,T.[BudgetPercent06]
		,T.[BudgetPercent07]
		,T.[BudgetPercent08]
		,T.[BudgetPercent09]
		,T.[BudgetPercent10]
		,T.[BudgetPercent11]
		,T.[BudgetPercentTotal]
		,T.[LastUpdate]
		,T.[ImportDate]
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END