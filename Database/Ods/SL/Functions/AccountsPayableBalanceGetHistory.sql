﻿-- =============================================
-- Author:		Randy Minder
-- Create date: 13-August, 2018
-- Description:	Get all history for the target
--		table.
-- =============================================
CREATE FUNCTION [SL].[AccountsPayableBalanceGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] [int] NOT NULL,
	[CompanyId] [varchar](10) NOT NULL,
	[CurrentBalance] [decimal](32, 16) NOT NULL,
	[CurrencyId] [varchar](4) NOT NULL,
	[CurrentYear1099Box00] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box01] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box02] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box03] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box04] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box05] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box06] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box07] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box08] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box09] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box10] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box11] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box12] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box13] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Box14] [decimal](32, 16) NOT NULL,
	[CurrentYear1099Interest] [decimal](32, 16) NOT NULL,
	[FutureBalance] [decimal](32, 16) NOT NULL,
	[LastCheckDate] [datetime2](7) NOT NULL,
	[LastVoucherDate] [datetime2](7) NOT NULL,
	[NoteId] [int] NOT NULL,
	[NextYear1099Box00] [decimal](32, 16) NOT NULL,
	[NextYear1099Box01] [decimal](32, 16) NOT NULL,
	[NextYear1099Box02] [decimal](32, 16) NOT NULL,
	[NextYear1099Box03] [decimal](32, 16) NOT NULL,
	[NextYear1099Box04] [decimal](32, 16) NOT NULL,
	[NextYear1099Box05] [decimal](32, 16) NOT NULL,
	[NextYear1099Box06] [decimal](32, 16) NOT NULL,
	[NextYear1099Box07] [decimal](32, 16) NOT NULL,
	[NextYear1099Box08] [decimal](32, 16) NOT NULL,
	[NextYear1099Box09] [decimal](32, 16) NOT NULL,
	[NextYear1099Box10] [decimal](32, 16) NOT NULL,
	[NextYear1099Box11] [decimal](32, 16) NOT NULL,
	[NextYear1099Box12] [decimal](32, 16) NOT NULL,
	[NextYear1099Box13] [decimal](32, 16) NOT NULL,
	[NextYear1099Box14] [decimal](32, 16) NOT NULL,
	[NextYear1099Interest] [decimal](32, 16) NOT NULL,
	[PeriodNumber] [varchar](6) NOT NULL,
	[VendorID] [varchar](15) NOT NULL,
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
	FROM SL.AccountsPayableBalance FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SL.AccountsPayableBalance
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
	FROM SL.AccountsPayableBalance FOR SYSTEM_TIME ALL T 
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
			,[CompanyId]
			,[CurrentBalance]
			,[CurrencyId]
			,[CurrentYear1099Box00]
			,[CurrentYear1099Box01]
			,[CurrentYear1099Box02]
			,[CurrentYear1099Box03]
			,[CurrentYear1099Box04]
			,[CurrentYear1099Box05]
			,[CurrentYear1099Box06]
			,[CurrentYear1099Box07]
			,[CurrentYear1099Box08]
			,[CurrentYear1099Box09]
			,[CurrentYear1099Box10]
			,[CurrentYear1099Box11]
			,[CurrentYear1099Box12]
			,[CurrentYear1099Box13]
			,[CurrentYear1099Box14]
			,[CurrentYear1099Interest]
			,[FutureBalance]
			,[LastCheckDate]
			,[LastVoucherDate]
			,[NoteId]
			,[NextYear1099Box00]
			,[NextYear1099Box01]
			,[NextYear1099Box02]
			,[NextYear1099Box03]
			,[NextYear1099Box04]
			,[NextYear1099Box05]
			,[NextYear1099Box06]
			,[NextYear1099Box07]
			,[NextYear1099Box08]
			,[NextYear1099Box09]
			,[NextYear1099Box10]
			,[NextYear1099Box11]
			,[NextYear1099Box12]
			,[NextYear1099Box13]
			,[NextYear1099Box14]
			,[NextYear1099Interest]
			,[PeriodNumber]
			,[VendorID]
			,[LastUpdate]
			,[ImportDate]
			,ValidFrom
			,ValidTo
		FROM SL.AccountsPayableBalance
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
	(
		 [RowId]
		,[CompanyId]
		,[CurrentBalance]
		,[CurrencyId]
		,[CurrentYear1099Box00]
		,[CurrentYear1099Box01]
		,[CurrentYear1099Box02]
		,[CurrentYear1099Box03]
		,[CurrentYear1099Box04]
		,[CurrentYear1099Box05]
		,[CurrentYear1099Box06]
		,[CurrentYear1099Box07]
		,[CurrentYear1099Box08]
		,[CurrentYear1099Box09]
		,[CurrentYear1099Box10]
		,[CurrentYear1099Box11]
		,[CurrentYear1099Box12]
		,[CurrentYear1099Box13]
		,[CurrentYear1099Box14]
		,[CurrentYear1099Interest]
		,[FutureBalance]
		,[LastCheckDate]
		,[LastVoucherDate]
		,[NoteId]
		,[NextYear1099Box00]
		,[NextYear1099Box01]
		,[NextYear1099Box02]
		,[NextYear1099Box03]
		,[NextYear1099Box04]
		,[NextYear1099Box05]
		,[NextYear1099Box06]
		,[NextYear1099Box07]
		,[NextYear1099Box08]
		,[NextYear1099Box09]
		,[NextYear1099Box10]
		,[NextYear1099Box11]
		,[NextYear1099Box12]
		,[NextYear1099Box13]
		,[NextYear1099Box14]
		,[NextYear1099Interest]
		,[PeriodNumber]
		,[VendorID]
		,[LastUpdate]
		,[ImportDate]
		,__Operation
		,__OperationDate
	)
	SELECT DISTINCT
		 T.[RowId]
		,T.[CompanyId]
		,T.[CurrentBalance]
		,T.[CurrencyId]
		,T.[CurrentYear1099Box00]
		,T.[CurrentYear1099Box01]
		,T.[CurrentYear1099Box02]
		,T.[CurrentYear1099Box03]
		,T.[CurrentYear1099Box04]
		,T.[CurrentYear1099Box05]
		,T.[CurrentYear1099Box06]
		,T.[CurrentYear1099Box07]
		,T.[CurrentYear1099Box08]
		,T.[CurrentYear1099Box09]
		,T.[CurrentYear1099Box10]
		,T.[CurrentYear1099Box11]
		,T.[CurrentYear1099Box12]
		,T.[CurrentYear1099Box13]
		,T.[CurrentYear1099Box14]
		,T.[CurrentYear1099Interest]
		,T.[FutureBalance]
		,T.[LastCheckDate]
		,T.[LastVoucherDate]
		,T.[NoteId]
		,T.[NextYear1099Box00]
		,T.[NextYear1099Box01]
		,T.[NextYear1099Box02]
		,T.[NextYear1099Box03]
		,T.[NextYear1099Box04]
		,T.[NextYear1099Box05]
		,T.[NextYear1099Box06]
		,T.[NextYear1099Box07]
		,T.[NextYear1099Box08]
		,T.[NextYear1099Box09]
		,T.[NextYear1099Box10]
		,T.[NextYear1099Box11]
		,T.[NextYear1099Box12]
		,T.[NextYear1099Box13]
		,T.[NextYear1099Box14]
		,T.[NextYear1099Interest]
		,T.[PeriodNumber]
		,T.[VendorID]
		,T.[LastUpdate]
		,T.[ImportDate]
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END