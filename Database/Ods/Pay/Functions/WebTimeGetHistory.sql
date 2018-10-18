-- ==================================================
-- Author:		Randy Minder
-- Create date: 18-October, 2018
-- Description:	Get all history for the target
--		table.
--
-- Select * From Pay.WebTimeGetHistory(NULL, NULL)
-- ==================================================
CREATE FUNCTION [Pay].[WebTimeGetHistory] (@StartDateUtc DATETIME2, @EndDateUtc DATETIME2)
RETURNS @ResultsTable TABLE
(
	RowId BIGINT NOT NULL
   ,[CompanyId] [INT] NOT NULL
   ,[EmployeeId] [INT] NOT NULL
   ,[PunchId] [INT] NOT NULL
   ,[BadgeNumber] [INT] NOT NULL
   ,[LastName] [VARCHAR](50) NOT NULL
   ,[FirstName] [VARCHAR](50) NOT NULL
   ,[MiddleInitial] [CHAR](1) NOT NULL
   ,[Title] [VARCHAR](50) NOT NULL
   ,[PersonalEmail] [VARCHAR](50) NOT NULL
   ,[WorkEmail] [VARCHAR](50) NOT NULL
   ,[MobileNumber] [VARCHAR](50) NOT NULL
   ,[PayDescription] [VARCHAR](50) NOT NULL
   ,[PayType] [VARCHAR](50) NOT NULL
   ,[Date] [DATE] NOT NULL
   ,[RoundedTimeIn] [VARCHAR](20) NOT NULL
   ,[RoundedTimeOut] [VARCHAR](20) NOT NULL
   ,[ActualTimeIn] [VARCHAR](20) NOT NULL
   ,[ActualTimeOut] [VARCHAR](20) NOT NULL
   ,[Hours] [DECIMAL](5, 2) NULL
   ,[PunchType] [VARCHAR](20) NOT NULL
   ,[LaborLevel1Code] [VARCHAR](20) NOT NULL
   ,[LaborLevel1Description] [VARCHAR](50) NOT NULL
   ,[LaborLevel2Code] [VARCHAR](20) NOT NULL
   ,[LaborLevel2Description] [VARCHAR](50) NOT NULL
   ,[LaborLevel3Code] [VARCHAR](20) NOT NULL
   ,[LaborLevel3Description] [VARCHAR](50) NOT NULL
   ,[LaborLevel4Code] [VARCHAR](20) NOT NULL
   ,[LaborLevel4Description] [VARCHAR](50) NOT NULL
   ,[LaborLevel5Code] [VARCHAR](20) NOT NULL
   ,[LaborLevel5Description] [VARCHAR](50) NOT NULL
   ,[LastUpdate] [DATETIME2](7) NOT NULL
   ,[ImportDate] [DATETIME2](7) NOT NULL
   ,[ImportFileName] [VARCHAR](80) NOT NULL
   ,[ImportFileDate] [DATE] NOT NULL
   ,[__Operation] CHAR(1) NOT NULL
   ,[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	IF @StartDateUtc IS NULL
		SET @StartDateUtc = '1/1/2018'
	IF @EndDateUtc IS NULL
		SET @EndDateUtc = '12/31/2099'


	DECLARE @DistinctPKValue TABLE (RowId BIGINT NOT NULL, UNIQUE CLUSTERED (RowId));
	DECLARE @ActivityTable TABLE
	(
		RowId BIGINT NOT NULL
	   ,ValidFrom DATETIME2 NOT NULL
	   ,ValidTo DATETIME2 NOT NULL
	   ,RowNumber INT NOT NULL
	   ,MaxRowNumber INT NOT NULL
	   ,
	   UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	);
	DECLARE @EndDateTableState TABLE (RowId BIGINT NOT NULL, UNIQUE CLUSTERED (RowId));
	DECLARE @InsertUpdateDeleteTable TABLE
	(
		RowId BIGINT NOT NULL
	   ,Operation CHAR(1) NOT NULL
	   ,OperationDate DATETIME2 NOT NULL
	   ,
	   UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	);

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT
		   RowId
	FROM Pay.WebTime FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc) -- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc); -- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM Pay.WebTime
		FOR SYSTEM_TIME AS OF @EndDateUtc T
		INNER JOIN @EndDateTableState	  T2 ON T2.RowId = T.RowId;

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		T.RowId
	   ,ValidFrom
	   ,ValidTo
	   ,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
	   ,SUM(1) OVER (PARTITION BY T.RowId)							AS MaxRowNumber
	FROM Pay.WebTime FOR SYSTEM_TIME ALL T
		INNER JOIN @DistinctPKValue		 T2 ON T2.RowId = T.RowId;

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
	   ,'I'		  AS Operation
	   ,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE
		RowNumber = 1
		AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc;

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
	   ,'U'			AS Operation
	   ,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;
	WITH BaseTableActivity
	AS
	(
		SELECT
			[RowId]
		   ,[CompanyId]
		   ,[EmployeeId]
		   ,[PunchId]
		   ,[BadgeNumber]
		   ,[LastName]
		   ,[FirstName]
		   ,[MiddleInitial]
		   ,[Title]
		   ,[PersonalEmail]
		   ,[WorkEmail]
		   ,[MobileNumber]
		   ,[PayDescription]
		   ,[PayType]
		   ,[Date]
		   ,[RoundedTimeIn]
		   ,[RoundedTimeOut]
		   ,[ActualTimeIn]
		   ,[ActualTimeOut]
		   ,[Hours]
		   ,[PunchType]
		   ,[LaborLevel1Code]
		   ,[LaborLevel1Description]
		   ,[LaborLevel2Code]
		   ,[LaborLevel2Description]
		   ,[LaborLevel3Code]
		   ,[LaborLevel3Description]
		   ,[LaborLevel4Code]
		   ,[LaborLevel4Description]
		   ,[LaborLevel5Code]
		   ,[LaborLevel5Description]
		   ,[LastUpdate]
		   ,[ImportDate]
		   ,[ImportFileName]
		   ,[ImportFileDate]
		   ,[ValidFrom]
		   ,[ValidTo]
		FROM Pay.WebTime
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc
	)
	INSERT INTO @ResultsTable
		 (RowId
		 ,[CompanyId]
		 ,[EmployeeId]
		 ,[PunchId]
		 ,[BadgeNumber]
		 ,[LastName]
		 ,[FirstName]
		 ,[MiddleInitial]
		 ,[Title]
		 ,[PersonalEmail]
		 ,[WorkEmail]
		 ,[MobileNumber]
		 ,[PayDescription]
		 ,[PayType]
		 ,[Date]
		 ,[RoundedTimeIn]
		 ,[RoundedTimeOut]
		 ,[ActualTimeIn]
		 ,[ActualTimeOut]
		 ,[Hours]
		 ,[PunchType]
		 ,[LaborLevel1Code]
		 ,[LaborLevel1Description]
		 ,[LaborLevel2Code]
		 ,[LaborLevel2Description]
		 ,[LaborLevel3Code]
		 ,[LaborLevel3Description]
		 ,[LaborLevel4Code]
		 ,[LaborLevel4Description]
		 ,[LaborLevel5Code]
		 ,[LaborLevel5Description]
		 ,[LastUpdate]
		 ,[ImportDate]
		 ,[ImportFileName]
		 ,[ImportFileDate]
		 ,__Operation
		 ,__OperationDate)
	SELECT DISTINCT
		   T.RowId
		  ,T.CompanyId
		  ,T.EmployeeId
		  ,T.PunchId
		  ,T.BadgeNumber
		  ,T.LastName
		  ,T.FirstName
		  ,T.MiddleInitial
		  ,T.Title
		  ,T.PersonalEmail
		  ,T.WorkEmail
		  ,T.MobileNumber
		  ,T.PayDescription
		  ,T.PayType
		  ,T.Date
		  ,T.RoundedTimeIn
		  ,T.RoundedTimeOut
		  ,T.ActualTimeIn
		  ,T.ActualTimeOut
		  ,T.Hours
		  ,T.PunchType
		  ,T.LaborLevel1Code
		  ,T.LaborLevel1Description
		  ,T.LaborLevel2Code
		  ,T.LaborLevel2Description
		  ,T.LaborLevel3Code
		  ,T.LaborLevel3Description
		  ,T.LaborLevel4Code
		  ,T.LaborLevel4Description
		  ,T.LaborLevel5Code
		  ,T.LaborLevel5Description
		  ,T.LastUpdate
		  ,T.ImportDate
		  ,T.ImportFileName
		  ,T.ImportFileDate
		  ,T2.Operation
		  ,T2.OperationDate
	FROM BaseTableActivity					T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId			= T.RowId
												  AND
												  ((T2.Operation =	  'I' AND T2.OperationDate = T.ValidFrom)
												   OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom)
												   OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo)
												  )
	WHERE
		T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc;

	RETURN;
END;