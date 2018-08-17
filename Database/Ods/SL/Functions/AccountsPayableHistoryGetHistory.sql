-- =============================================
-- Author:		Randy Minder
-- Create date: 16-August, 2018
-- Description:	Get all history for the target
--		table.
-- =============================================
CREATE FUNCTION [SL].[AccountsPayableHistoryGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] [INT] NOT NULL,
	[BeginBalance] [decimal](32, 16) NOT NULL,
	[CompanyId] [varchar](10) NOT NULL,
	[CurrencyId] [varchar](4) NOT NULL,
	[FiscalYear] [varchar](4) NOT NULL,
	[NoteId] [int] NOT NULL,
	[PeriodNumber] [varchar](6) NOT NULL,
	[CreditAdjustments00] [decimal](32, 16) NOT NULL,
	[CreditAdjustments01] [decimal](32, 16) NOT NULL,
	[CreditAdjustments02] [decimal](32, 16) NOT NULL,
	[CreditAdjustments03] [decimal](32, 16) NOT NULL,
	[CreditAdjustments04] [decimal](32, 16) NOT NULL,
	[CreditAdjustments05] [decimal](32, 16) NOT NULL,
	[CreditAdjustments06] [decimal](32, 16) NOT NULL,
	[CreditAdjustments07] [decimal](32, 16) NOT NULL,
	[CreditAdjustments08] [decimal](32, 16) NOT NULL,
	[CreditAdjustments09] [decimal](32, 16) NOT NULL,
	[CreditAdjustments10] [decimal](32, 16) NOT NULL,
	[CreditAdjustments11] [decimal](32, 16) NOT NULL,
	[CreditAdjustments12] [decimal](32, 16) NOT NULL,
	[DiscountsTaken00] [decimal](32, 16) NOT NULL,
	[DiscountsTaken01] [decimal](32, 16) NOT NULL,
	[DiscountsTaken02] [decimal](32, 16) NOT NULL,
	[DiscountsTaken03] [decimal](32, 16) NOT NULL,
	[DiscountsTaken04] [decimal](32, 16) NOT NULL,
	[DiscountsTaken05] [decimal](32, 16) NOT NULL,
	[DiscountsTaken06] [decimal](32, 16) NOT NULL,
	[DiscountsTaken07] [decimal](32, 16) NOT NULL,
	[DiscountsTaken08] [decimal](32, 16) NOT NULL,
	[DiscountsTaken09] [decimal](32, 16) NOT NULL,
	[DiscountsTaken10] [decimal](32, 16) NOT NULL,
	[DiscountsTaken11] [decimal](32, 16) NOT NULL,
	[DiscountsTaken12] [decimal](32, 16) NOT NULL,
	[DebitAdjustments00] [decimal](32, 16) NOT NULL,
	[DebitAdjustments01] [decimal](32, 16) NOT NULL,
	[DebitAdjustments02] [decimal](32, 16) NOT NULL,
	[DebitAdjustments03] [decimal](32, 16) NOT NULL,
	[DebitAdjustments04] [decimal](32, 16) NOT NULL,
	[DebitAdjustments05] [decimal](32, 16) NOT NULL,
	[DebitAdjustments06] [decimal](32, 16) NOT NULL,
	[DebitAdjustments07] [decimal](32, 16) NOT NULL,
	[DebitAdjustments08] [decimal](32, 16) NOT NULL,
	[DebitAdjustments09] [decimal](32, 16) NOT NULL,
	[DebitAdjustments10] [decimal](32, 16) NOT NULL,
	[DebitAdjustments11] [decimal](32, 16) NOT NULL,
	[DebitAdjustments12] [decimal](32, 16) NOT NULL,
	[Payments00] [decimal](32, 16) NOT NULL,
	[Payments01] [decimal](32, 16) NOT NULL,
	[Payments02] [decimal](32, 16) NOT NULL,
	[Payments03] [decimal](32, 16) NOT NULL,
	[Payments04] [decimal](32, 16) NOT NULL,
	[Payments05] [decimal](32, 16) NOT NULL,
	[Payments06] [decimal](32, 16) NOT NULL,
	[Payments07] [decimal](32, 16) NOT NULL,
	[Payments08] [decimal](32, 16) NOT NULL,
	[Payments09] [decimal](32, 16) NOT NULL,
	[Payments10] [decimal](32, 16) NOT NULL,
	[Payments11] [decimal](32, 16) NOT NULL,
	[Payments12] [decimal](32, 16) NOT NULL,
	[Purchases00] [decimal](32, 16) NOT NULL,
	[Purchases01] [decimal](32, 16) NOT NULL,
	[Purchases02] [decimal](32, 16) NOT NULL,
	[Purchases03] [decimal](32, 16) NOT NULL,
	[Purchases04] [decimal](32, 16) NOT NULL,
	[Purchases05] [decimal](32, 16) NOT NULL,
	[Purchases06] [decimal](32, 16) NOT NULL,
	[Purchases07] [decimal](32, 16) NOT NULL,
	[Purchases08] [decimal](32, 16) NOT NULL,
	[Purchases09] [decimal](32, 16) NOT NULL,
	[Purchases10] [decimal](32, 16) NOT NULL,
	[Purchases11] [decimal](32, 16) NOT NULL,
	[Purchases12] [decimal](32, 16) NOT NULL,
	[VendorId] [varchar](15) NOT NULL,
	[YearToDateCreditAdjustments] [decimal](32, 16) NOT NULL,
	[YearToDateDiscountsTaken] [decimal](32, 16) NOT NULL,
	[YearToDateDebitAdjustments] [decimal](32, 16) NOT NULL,
	[YearToDatePayments] [decimal](32, 16) NOT NULL,
	[YearToDatePurchases] [decimal](32, 16) NOT NULL,
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
	FROM SL.AccountsPayableHistory FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SL.AccountsPayableHistory
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
	FROM SL.AccountsPayableHistory FOR SYSTEM_TIME ALL T 
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
			,[BeginBalance]
			,[CompanyId]
			,[CurrencyId]
			,[FiscalYear]
			,[NoteId]
			,[PeriodNumber]
			,[CreditAdjustments00]
			,[CreditAdjustments01]
			,[CreditAdjustments02]
			,[CreditAdjustments03]
			,[CreditAdjustments04]
			,[CreditAdjustments05]
			,[CreditAdjustments06]
			,[CreditAdjustments07]
			,[CreditAdjustments08]
			,[CreditAdjustments09]
			,[CreditAdjustments10]
			,[CreditAdjustments11]
			,[CreditAdjustments12]
			,[DiscountsTaken00]
			,[DiscountsTaken01]
			,[DiscountsTaken02]
			,[DiscountsTaken03]
			,[DiscountsTaken04]
			,[DiscountsTaken05]
			,[DiscountsTaken06]
			,[DiscountsTaken07]
			,[DiscountsTaken08]
			,[DiscountsTaken09]
			,[DiscountsTaken10]
			,[DiscountsTaken11]
			,[DiscountsTaken12]
			,[DebitAdjustments00]
			,[DebitAdjustments01]
			,[DebitAdjustments02]
			,[DebitAdjustments03]
			,[DebitAdjustments04]
			,[DebitAdjustments05]
			,[DebitAdjustments06]
			,[DebitAdjustments07]
			,[DebitAdjustments08]
			,[DebitAdjustments09]
			,[DebitAdjustments10]
			,[DebitAdjustments11]
			,[DebitAdjustments12]
			,[Payments00]
			,[Payments01]
			,[Payments02]
			,[Payments03]
			,[Payments04]
			,[Payments05]
			,[Payments06]
			,[Payments07]
			,[Payments08]
			,[Payments09]
			,[Payments10]
			,[Payments11]
			,[Payments12]
			,[Purchases00]
			,[Purchases01]
			,[Purchases02]
			,[Purchases03]
			,[Purchases04]
			,[Purchases05]
			,[Purchases06]
			,[Purchases07]
			,[Purchases08]
			,[Purchases09]
			,[Purchases10]
			,[Purchases11]
			,[Purchases12]
			,[VendorId]
			,[YearToDateCreditAdjustments]
			,[YearToDateDiscountsTaken]
			,[YearToDateDebitAdjustments]
			,[YearToDatePayments]
			,[YearToDatePurchases]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SL.AccountsPayableHistory
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[BeginBalance]
			,[CompanyId]
			,[CurrencyId]
			,[FiscalYear]
			,[NoteId]
			,[PeriodNumber]
			,[CreditAdjustments00]
			,[CreditAdjustments01]
			,[CreditAdjustments02]
			,[CreditAdjustments03]
			,[CreditAdjustments04]
			,[CreditAdjustments05]
			,[CreditAdjustments06]
			,[CreditAdjustments07]
			,[CreditAdjustments08]
			,[CreditAdjustments09]
			,[CreditAdjustments10]
			,[CreditAdjustments11]
			,[CreditAdjustments12]
			,[DiscountsTaken00]
			,[DiscountsTaken01]
			,[DiscountsTaken02]
			,[DiscountsTaken03]
			,[DiscountsTaken04]
			,[DiscountsTaken05]
			,[DiscountsTaken06]
			,[DiscountsTaken07]
			,[DiscountsTaken08]
			,[DiscountsTaken09]
			,[DiscountsTaken10]
			,[DiscountsTaken11]
			,[DiscountsTaken12]
			,[DebitAdjustments00]
			,[DebitAdjustments01]
			,[DebitAdjustments02]
			,[DebitAdjustments03]
			,[DebitAdjustments04]
			,[DebitAdjustments05]
			,[DebitAdjustments06]
			,[DebitAdjustments07]
			,[DebitAdjustments08]
			,[DebitAdjustments09]
			,[DebitAdjustments10]
			,[DebitAdjustments11]
			,[DebitAdjustments12]
			,[Payments00]
			,[Payments01]
			,[Payments02]
			,[Payments03]
			,[Payments04]
			,[Payments05]
			,[Payments06]
			,[Payments07]
			,[Payments08]
			,[Payments09]
			,[Payments10]
			,[Payments11]
			,[Payments12]
			,[Purchases00]
			,[Purchases01]
			,[Purchases02]
			,[Purchases03]
			,[Purchases04]
			,[Purchases05]
			,[Purchases06]
			,[Purchases07]
			,[Purchases08]
			,[Purchases09]
			,[Purchases10]
			,[Purchases11]
			,[Purchases12]
			,[VendorId]
			,[YearToDateCreditAdjustments]
			,[YearToDateDiscountsTaken]
			,[YearToDateDebitAdjustments]
			,[YearToDatePayments]
			,[YearToDatePurchases]
			,[LastUpdate]
			,[ImportDate]
			,__Operation
			,__OperationDate)
	SELECT DISTINCT
		 T.[RowId]
		,[BeginBalance]
		,[CompanyId]
		,[CurrencyId]
		,[FiscalYear]
		,[NoteId]
		,[PeriodNumber]
		,[CreditAdjustments00]
		,[CreditAdjustments01]
		,[CreditAdjustments02]
		,[CreditAdjustments03]
		,[CreditAdjustments04]
		,[CreditAdjustments05]
		,[CreditAdjustments06]
		,[CreditAdjustments07]
		,[CreditAdjustments08]
		,[CreditAdjustments09]
		,[CreditAdjustments10]
		,[CreditAdjustments11]
		,[CreditAdjustments12]
		,[DiscountsTaken00]
		,[DiscountsTaken01]
		,[DiscountsTaken02]
		,[DiscountsTaken03]
		,[DiscountsTaken04]
		,[DiscountsTaken05]
		,[DiscountsTaken06]
		,[DiscountsTaken07]
		,[DiscountsTaken08]
		,[DiscountsTaken09]
		,[DiscountsTaken10]
		,[DiscountsTaken11]
		,[DiscountsTaken12]
		,[DebitAdjustments00]
		,[DebitAdjustments01]
		,[DebitAdjustments02]
		,[DebitAdjustments03]
		,[DebitAdjustments04]
		,[DebitAdjustments05]
		,[DebitAdjustments06]
		,[DebitAdjustments07]
		,[DebitAdjustments08]
		,[DebitAdjustments09]
		,[DebitAdjustments10]
		,[DebitAdjustments11]
		,[DebitAdjustments12]
		,[Payments00]
		,[Payments01]
		,[Payments02]
		,[Payments03]
		,[Payments04]
		,[Payments05]
		,[Payments06]
		,[Payments07]
		,[Payments08]
		,[Payments09]
		,[Payments10]
		,[Payments11]
		,[Payments12]
		,[Purchases00]
		,[Purchases01]
		,[Purchases02]
		,[Purchases03]
		,[Purchases04]
		,[Purchases05]
		,[Purchases06]
		,[Purchases07]
		,[Purchases08]
		,[Purchases09]
		,[Purchases10]
		,[Purchases11]
		,[Purchases12]
		,[VendorId]
		,[YearToDateCreditAdjustments]
		,[YearToDateDiscountsTaken]
		,[YearToDateDebitAdjustments]
		,[YearToDatePayments]
		,[YearToDatePurchases]
		,[LastUpdate]
		,[ImportDate]
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END