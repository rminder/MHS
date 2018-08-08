
-- =============================================
-- Author:		Randy Minder
-- Create date: 2-August, 2018
-- Description:	Get all history for the target
--		table.
-- =============================================
CREATE FUNCTION [SL].[AccountsReceivableTransactionGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] [INT] IDENTITY(1,1) NOT NULL,
	[Account] [VARCHAR](10) NOT NULL,
	[BatchNumber] [VARCHAR](10) NOT NULL,
	[CompanyId] [VARCHAR](10) NOT NULL,
	[CurrencyId] [VARCHAR](4) NOT NULL,
	[CurrencyRate] [DECIMAL](32, 16) NULL,
	[CurrencyTransactionAmount] [DECIMAL](32, 16) NULL,
	[CustomerId] [VARCHAR](15) NOT NULL,
	[DebitOrCredit] [CHAR](1) NOT NULL,
	[FiscalYear] [VARCHAR](4) NOT NULL,
	[InventoryId] [VARCHAR](30) NOT NULL,
	[JournalType] [VARCHAR](3) NOT NULL,
	[LineNumber] [SMALLINT] NULL,
	[PeriodToPost] [VARCHAR](6) NOT NULL,
	[PeriodFinancialDate] [DATETIME2](7) NULL,
	[ProjectId] [VARCHAR](16) NOT NULL,
	[RecordId] [INT] NULL,
	[TransactionReferenceNumber] [VARCHAR](10) NOT NULL,
	[Released] [INT] NULL,
	[SiteId] [VARCHAR](10) NOT NULL,
	[SalesPersonId] [VARCHAR](10) NOT NULL,
	[SubaccountId] [VARCHAR](24) NOT NULL,
	[SubSeg1] [VARCHAR](4) NOT NULL,
	[SubSeg2] [VARCHAR](4) NOT NULL,
	[TaskId] [VARCHAR](32) NOT NULL,
	[TransactionAmount] [DECIMAL](32, 16) NULL,
	[TransactionDate] [DATETIME] NULL,
	[TransactionType] [VARCHAR](2) NOT NULL,
	[WarehouseLocation] [VARCHAR](10) NOT NULL,
	[TransactionDescription] [VARCHAR](30) NOT NULL,
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
	FROM SL.AccountsReceivableTransaction FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SL.AccountsReceivableTransaction
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
	FROM SL.AccountsReceivableTransaction FOR SYSTEM_TIME ALL T 
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
		   ,[Account]
		   ,[BatchNumber]
		   ,[CompanyId]
		   ,[CurrencyId]
		   ,[CurrencyRate]
		   ,[CurrencyTransactionAmount]
		   ,[CustomerId]
		   ,[DebitOrCredit]
		   ,[FiscalYear]
		   ,[InventoryId]
		   ,[JournalType]
		   ,[LineNumber]
		   ,[PeriodToPost]
		   ,[PeriodFinancialDate]
		   ,[ProjectId]
		   ,[RecordId]
		   ,[TransactionReferenceNumber]
		   ,[Released]
		   ,[SiteId]
		   ,[SalesPersonId]
		   ,[SubaccountId]
		   ,[SubSeg1]
		   ,[SubSeg2]
		   ,[TaskId]
		   ,[TransactionAmount]
		   ,[TransactionDate]
		   ,[TransactionType]
		   ,[WarehouseLocation]
		   ,[TransactionDescription]
		   ,[LastUpdate]
		   ,[ImportDate]
		   ,[ValidFrom]
		   ,[ValidTo]
		FROM SL.AccountsReceivableTransaction
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc
	)

	INSERT INTO @ResultsTable
		 (
			 [Account]
			,[BatchNumber]
			,[CompanyId]
			,[CurrencyId]
			,[CurrencyRate]
			,[CurrencyTransactionAmount]
			,[CustomerId]
			,[DebitOrCredit]
			,[FiscalYear]
			,[InventoryId]
			,[JournalType]
			,[LineNumber]
			,[PeriodToPost]
			,[PeriodFinancialDate]
			,[ProjectId]
			,[RecordId]
			,[TransactionReferenceNumber]
			,[Released]
			,[SiteId]
			,[SalesPersonId]
			,[SubaccountId]
			,[SubSeg1]
			,[SubSeg2]
			,[TaskId]
			,[TransactionAmount]
			,[TransactionDate]
			,[TransactionType]
			,[WarehouseLocation]
			,[TransactionDescription]
			,LastUpdate
			,ImportDate
			,__Operation
			,__OperationDate)
	SELECT DISTINCT
		 T.[Account]
		,T.[BatchNumber]
		,T.[CompanyId]
		,T.[CurrencyId]
		,T.[CurrencyRate]
		,T.[CurrencyTransactionAmount]
		,T.[CustomerId]
		,T.[DebitOrCredit]
		,T.[FiscalYear]
		,T.[InventoryId]
		,T.[JournalType]
		,T.[LineNumber]
		,T.[PeriodToPost]
		,T.[PeriodFinancialDate]
		,T.[ProjectId]
		,T.[RecordId]
		,T.[TransactionReferenceNumber]
		,T.[Released]
		,T.[SiteId]
		,T.[SalesPersonId]
		,T.[SubaccountId]
		,T.[SubSeg1]
		,T.[SubSeg2]
		,T.[TaskId]
		,T.[TransactionAmount]
		,T.[TransactionDate]
		,T.[TransactionType]
		,T.[WarehouseLocation]
		,T.[TransactionDescription]
		,T.[LastUpdate]
		,T.[ImportDate]
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END