﻿-- =============================================
-- Author:		Randy Minder
-- Create date: 07-September, 2018
-- Description:	Get all history for the target
--		table.
-- =============================================
CREATE FUNCTION [SL].[BudgetSetupGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] [INT] NOT NULL,
	[AllowMasking] [BIT] NOT NULL,
	[BudgetLedgerId] [VARCHAR](10) NOT NULL,
	[BudgetYear] [VARCHAR](4) NOT NULL,
	[CompanyId] [VARCHAR](10) NOT NULL,
	[CreateSubaccounts] [BIT] NOT NULL,
	[Description] [VARCHAR](30) NOT NULL,
	[Include13] [BIT] NOT NULL,
	[NumberSegments] [SMALLINT] NOT NULL,
	[SubSeg00] [SMALLINT] NOT NULL,
	[SubSeg01] [SMALLINT] NOT NULL,
	[SubSeg02] [SMALLINT] NOT NULL,
	[SubSeg03] [SMALLINT] NOT NULL,
	[SubSeg04] [SMALLINT] NOT NULL,
	[SubSeg05] [SMALLINT] NOT NULL,
	[SubSeg06] [SMALLINT] NOT NULL,
	[SubSeg07] [SMALLINT] NOT NULL,
	[SubSegMask00] [VARCHAR](24) NOT NULL,
	[SubSegMask01] [VARCHAR](24) NOT NULL,
	[SubSegMask02] [VARCHAR](24) NOT NULL,
	[SubSegMask03] [VARCHAR](24) NOT NULL,
	[SubSegMask04] [VARCHAR](24) NOT NULL,
	[SubSegMask05] [VARCHAR](24) NOT NULL,
	[SubSegMask06] [VARCHAR](24) NOT NULL,
	[SubSegMask07] [VARCHAR](24) NOT NULL,
	[Type] [VARCHAR](1) NOT NULL,
	[UseBudgetGroups] [SMALLINT] NOT NULL,
	[LastUpdate] [DATETIME2](7) NOT NULL,
	[ImportDate] [DATETIME2](7) NOT NULL,
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
	FROM SL.BudgetSetup FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SL.BudgetSetup
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
	FROM SL.BudgetSetup FOR SYSTEM_TIME ALL T 
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
			,[AllowMasking]
			,[BudgetLedgerId]
			,[BudgetYear]
			,[CompanyId]
			,[CreateSubaccounts]
			,[Description]
			,[Include13]
			,[NumberSegments]
			,[SubSeg00]
			,[SubSeg01]
			,[SubSeg02]
			,[SubSeg03]
			,[SubSeg04]
			,[SubSeg05]
			,[SubSeg06]
			,[SubSeg07]
			,[SubSegMask00]
			,[SubSegMask01]
			,[SubSegMask02]
			,[SubSegMask03]
			,[SubSegMask04]
			,[SubSegMask05]
			,[SubSegMask06]
			,[SubSegMask07]
			,[Type]
			,[UseBudgetGroups]
			,[LastUpdate]
			,[ImportDate]
			,ValidFrom
			,ValidTo
		FROM SL.BudgetSetup
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
	(
		 [RowId]
		,[AllowMasking]
		,[BudgetLedgerId]
		,[BudgetYear]
		,[CompanyId]
		,[CreateSubaccounts]
		,[Description]
		,[Include13]
		,[NumberSegments]
		,[SubSeg00]
		,[SubSeg01]
		,[SubSeg02]
		,[SubSeg03]
		,[SubSeg04]
		,[SubSeg05]
		,[SubSeg06]
		,[SubSeg07]
		,[SubSegMask00]
		,[SubSegMask01]
		,[SubSegMask02]
		,[SubSegMask03]
		,[SubSegMask04]
		,[SubSegMask05]
		,[SubSegMask06]
		,[SubSegMask07]
		,[Type]
		,[UseBudgetGroups]
		,[LastUpdate]
		,[ImportDate]
		,__Operation
		,__OperationDate
	)
	SELECT DISTINCT
		 T.[RowId]
		,[AllowMasking]
		,[BudgetLedgerId]
		,[BudgetYear]
		,[CompanyId]
		,[CreateSubaccounts]
		,[Description]
		,[Include13]
		,[NumberSegments]
		,[SubSeg00]
		,[SubSeg01]
		,[SubSeg02]
		,[SubSeg03]
		,[SubSeg04]
		,[SubSeg05]
		,[SubSeg06]
		,[SubSeg07]
		,[SubSegMask00]
		,[SubSegMask01]
		,[SubSegMask02]
		,[SubSegMask03]
		,[SubSegMask04]
		,[SubSegMask05]
		,[SubSegMask06]
		,[SubSegMask07]
		,[Type]
		,[UseBudgetGroups]
		,T.[LastUpdate]
		,T.[ImportDate]
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END