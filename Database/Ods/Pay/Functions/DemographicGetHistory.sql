-- ==================================================
-- Author:		Randy Minder
-- Create date: 18-October, 2018
-- Description:	Get all history for the target
--		table.
--
-- Select * From Pay.DemographicGetHistory(NULL, NULL)
-- ==================================================
CREATE FUNCTION [Pay].[DemographicGetHistory] (@StartDateUtc DATETIME2, @EndDateUtc DATETIME2)
RETURNS @ResultsTable TABLE
(
	RowId BIGINT NOT NULL
   ,[EmployeeId] [INT] NOT NULL
   ,[CompanyId] [INT] NOT NULL
   ,[SocialSecurityNumber] [NVARCHAR](50) NOT NULL
   ,[FirstName] [NVARCHAR](50) NOT NULL
   ,[MiddleInitial] [CHAR](1) NOT NULL
   ,[LastName] [NVARCHAR](50) NOT NULL
   ,[Address1] [NVARCHAR](50) NOT NULL
   ,[Address2] [NVARCHAR](50) NOT NULL
   ,[City] [NVARCHAR](50) NOT NULL
   ,[State] [NVARCHAR](50) NOT NULL
   ,[PostalCode] [NVARCHAR](50) NOT NULL
   ,[County] [NVARCHAR](50) NOT NULL
   ,[BirthDate] [DATE] NULL
   ,[HireDate] [DATE] NULL
   ,[AdjustedSeniorityDate] [DATE] NULL
   ,[RehireDate] [DATE] NULL
   ,[EmploymentTerminationDate] [DATE] NULL
   ,[TerminationReason] [NVARCHAR](50) NOT NULL
   ,[EmployeeStatus] [CHAR](1) NOT NULL
   ,[EmployeeTypeDescription] [NVARCHAR](50) NOT NULL
   ,[Gender] [CHAR](1) NOT NULL
   ,[MaritalStatus] [CHAR](1) NOT NULL
   ,[HomePhone] [NVARCHAR](50) NOT NULL
   ,[PersonalEmail] [NVARCHAR](50) NOT NULL
   ,[MobilePhone] [NVARCHAR](50) NOT NULL
   ,[WorkPhone] [NVARCHAR](50) NOT NULL
   ,[WorkEmail] [NVARCHAR](50) NOT NULL
   ,[WorkLocationName] [NVARCHAR](50) NOT NULL
   ,[JobTitle] [NVARCHAR](100) NOT NULL
   ,[PositionCode] [NVARCHAR](50) NOT NULL
   ,[PositionDescription] [NVARCHAR](100) NOT NULL
   ,[CostCenter1] [NVARCHAR](50) NOT NULL
   ,[CostCenter1Description] [NVARCHAR](50) NOT NULL
   ,[CostCenter2] [NVARCHAR](50) NOT NULL
   ,[CostCenter2Description] [NVARCHAR](50) NOT NULL
   ,[CostCenter3] [NVARCHAR](50) NOT NULL
   ,[CostCenter3Description] [NVARCHAR](50) NOT NULL
   ,[Ethnicity] [NVARCHAR](50) NOT NULL
   ,[EeoClass] [NVARCHAR](50) NOT NULL
   ,[PayGroupCode] [NVARCHAR](50) NOT NULL
   ,[PayFrequency] [CHAR](1) NOT NULL
   ,[HourlyOrSalary] [NVARCHAR](50) NOT NULL
   ,[AnnualSalary] [DECIMAL](10, 2) NULL
   ,[HourlyRate] [DECIMAL](7, 2) NULL
   ,[DefaultHours] [INT] NOT NULL
   ,[HighlyCompensated] [INT] NOT NULL
   ,[BenefitClassCode] [NVARCHAR](50) NOT NULL
   ,[BenefitClassDescription] [NVARCHAR](50) NOT NULL
   ,[BenefitClassEffectiveDate] [DATE] NULL
   ,[BenefitOverrideSalary] [NVARCHAR](50) NOT NULL
   ,[BenefitSalaryEffectiveDate] [DATE] NULL
   ,[BenefitHoursPerWeek] [DECIMAL](7, 2) NULL
   ,[BenefitLocation] [NVARCHAR](50) NOT NULL
   ,[BenefitDivision] [NVARCHAR](50) NOT NULL
   ,[BenefitTerminationDate] [DATE] NULL
   ,[BadgeNumberClockNumber] [NVARCHAR](50) NOT NULL
   ,[WebTimeBadgeNumber] [INT] NULL
   ,[EnableTimeandLabor] [CHAR](1) NOT NULL
   ,[EligibleforRehire] [CHAR](1) NOT NULL
   ,[TargetBonus] [VARCHAR](50) NOT NULL
   ,[Area] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField3] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField4] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField5] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField6] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField7] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField8] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField9] [NVARCHAR](50) NOT NULL
   ,[UserDefinedField10] [NVARCHAR](50) NOT NULL
   ,[ImportDate] [DATETIME2](7) NOT NULL
   ,[ImportFileName] [VARCHAR](80) NOT NULL
   ,[ImportFileDate] [DATE] NOT NULL
   ,[LastUpdate] [DATETIME2](7) NOT NULL
   ,[__Operation] CHAR(1) NOT NULL
   ,[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	IF @StartDateUtc IS NULL
		SET @StartDateUtc = '1/1/2018';
	IF @EndDateUtc IS NULL
		SET @EndDateUtc = '12/31/2099';


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
	FROM Pay.Demographic FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc) -- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc); -- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM Pay.Demographic
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
	FROM Pay.Demographic FOR SYSTEM_TIME ALL T
		INNER JOIN @DistinctPKValue			 T2 ON T2.RowId = T.RowId;

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
		   ,[EmployeeId]
		   ,[CompanyId]
		   ,[SocialSecurityNumber]
		   ,[FirstName]
		   ,[MiddleInitial]
		   ,[LastName]
		   ,[Address1]
		   ,[Address2]
		   ,[City]
		   ,[State]
		   ,[PostalCode]
		   ,[County]
		   ,[BirthDate]
		   ,[HireDate]
		   ,[AdjustedSeniorityDate]
		   ,[RehireDate]
		   ,[EmploymentTerminationDate]
		   ,[TerminationReason]
		   ,[EmployeeStatus]
		   ,[EmployeeTypeDescription]
		   ,[Gender]
		   ,[MaritalStatus]
		   ,[HomePhone]
		   ,[PersonalEmail]
		   ,[MobilePhone]
		   ,[WorkPhone]
		   ,[WorkEmail]
		   ,[WorkLocationName]
		   ,[JobTitle]
		   ,[PositionCode]
		   ,[PositionDescription]
		   ,[CostCenter1]
		   ,[CostCenter1Description]
		   ,[CostCenter2]
		   ,[CostCenter2Description]
		   ,[CostCenter3]
		   ,[CostCenter3Description]
		   ,[Ethnicity]
		   ,[EeoClass]
		   ,[PayGroupCode]
		   ,[PayFrequency]
		   ,[HourlyOrSalary]
		   ,[AnnualSalary]
		   ,[HourlyRate]
		   ,[DefaultHours]
		   ,[HighlyCompensated]
		   ,[BenefitClassCode]
		   ,[BenefitClassDescription]
		   ,[BenefitClassEffectiveDate]
		   ,[BenefitOverrideSalary]
		   ,[BenefitSalaryEffectiveDate]
		   ,[BenefitHoursPerWeek]
		   ,[BenefitLocation]
		   ,[BenefitDivision]
		   ,[BenefitTerminationDate]
		   ,[BadgeNumberClockNumber]
		   ,[WebTimeBadgeNumber]
		   ,[EnableTimeandLabor]
		   ,[EligibleforRehire]
		   ,[TargetBonus]
		   ,[Area]
		   ,[UserDefinedField3]
		   ,[UserDefinedField4]
		   ,[UserDefinedField5]
		   ,[UserDefinedField6]
		   ,[UserDefinedField7]
		   ,[UserDefinedField8]
		   ,[UserDefinedField9]
		   ,[UserDefinedField10]
		   ,[ImportDate]
		   ,[ImportFileName]
		   ,[ImportFileDate]
		   ,[LastUpdate]
		   ,[ValidFrom]
		   ,[ValidTo]
		FROM Pay.Demographic
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc
	)
	INSERT INTO @ResultsTable
		 ([RowId]
		 ,[EmployeeId]
		 ,[CompanyId]
		 ,[SocialSecurityNumber]
		 ,[FirstName]
		 ,[MiddleInitial]
		 ,[LastName]
		 ,[Address1]
		 ,[Address2]
		 ,[City]
		 ,[State]
		 ,[PostalCode]
		 ,[County]
		 ,[BirthDate]
		 ,[HireDate]
		 ,[AdjustedSeniorityDate]
		 ,[RehireDate]
		 ,[EmploymentTerminationDate]
		 ,[TerminationReason]
		 ,[EmployeeStatus]
		 ,[EmployeeTypeDescription]
		 ,[Gender]
		 ,[MaritalStatus]
		 ,[HomePhone]
		 ,[PersonalEmail]
		 ,[MobilePhone]
		 ,[WorkPhone]
		 ,[WorkEmail]
		 ,[WorkLocationName]
		 ,[JobTitle]
		 ,[PositionCode]
		 ,[PositionDescription]
		 ,[CostCenter1]
		 ,[CostCenter1Description]
		 ,[CostCenter2]
		 ,[CostCenter2Description]
		 ,[CostCenter3]
		 ,[CostCenter3Description]
		 ,[Ethnicity]
		 ,[EeoClass]
		 ,[PayGroupCode]
		 ,[PayFrequency]
		 ,[HourlyOrSalary]
		 ,[AnnualSalary]
		 ,[HourlyRate]
		 ,[DefaultHours]
		 ,[HighlyCompensated]
		 ,[BenefitClassCode]
		 ,[BenefitClassDescription]
		 ,[BenefitClassEffectiveDate]
		 ,[BenefitOverrideSalary]
		 ,[BenefitSalaryEffectiveDate]
		 ,[BenefitHoursPerWeek]
		 ,[BenefitLocation]
		 ,[BenefitDivision]
		 ,[BenefitTerminationDate]
		 ,[BadgeNumberClockNumber]
		 ,[WebTimeBadgeNumber]
		 ,[EnableTimeandLabor]
		 ,[EligibleforRehire]
		 ,[TargetBonus]
		 ,[Area]
		 ,[UserDefinedField3]
		 ,[UserDefinedField4]
		 ,[UserDefinedField5]
		 ,[UserDefinedField6]
		 ,[UserDefinedField7]
		 ,[UserDefinedField8]
		 ,[UserDefinedField9]
		 ,[UserDefinedField10]
		 ,[ImportDate]
		 ,[ImportFileName]
		 ,[ImportFileDate]
		 ,[LastUpdate]
		 ,__Operation
		 ,__OperationDate)
	SELECT DISTINCT
		   T.[RowId]
		  ,T.EmployeeId
		  ,T.CompanyId
		  ,T.SocialSecurityNumber
		  ,T.FirstName
		  ,T.MiddleInitial
		  ,T.LastName
		  ,T.Address1
		  ,T.Address2
		  ,T.City
		  ,T.State
		  ,T.PostalCode
		  ,T.County
		  ,T.BirthDate
		  ,T.HireDate
		  ,T.AdjustedSeniorityDate
		  ,T.RehireDate
		  ,T.EmploymentTerminationDate
		  ,T.TerminationReason
		  ,T.EmployeeStatus
		  ,T.EmployeeTypeDescription
		  ,T.Gender
		  ,T.MaritalStatus
		  ,T.HomePhone
		  ,T.PersonalEmail
		  ,T.MobilePhone
		  ,T.WorkPhone
		  ,T.WorkEmail
		  ,T.WorkLocationName
		  ,T.JobTitle
		  ,T.PositionCode
		  ,T.PositionDescription
		  ,T.CostCenter1
		  ,T.CostCenter1Description
		  ,T.CostCenter2
		  ,T.CostCenter2Description
		  ,T.CostCenter3
		  ,T.CostCenter3Description
		  ,T.Ethnicity
		  ,T.EeoClass
		  ,T.PayGroupCode
		  ,T.PayFrequency
		  ,T.HourlyOrSalary
		  ,T.AnnualSalary
		  ,T.HourlyRate
		  ,T.DefaultHours
		  ,T.HighlyCompensated
		  ,T.BenefitClassCode
		  ,T.BenefitClassDescription
		  ,T.BenefitClassEffectiveDate
		  ,T.BenefitOverrideSalary
		  ,T.BenefitSalaryEffectiveDate
		  ,T.BenefitHoursPerWeek
		  ,T.BenefitLocation
		  ,T.BenefitDivision
		  ,T.BenefitTerminationDate
		  ,T.BadgeNumberClockNumber
		  ,T.WebTimeBadgeNumber
		  ,T.EnableTimeandLabor
		  ,T.EligibleforRehire
		  ,T.TargetBonus
		  ,T.Area
		  ,T.UserDefinedField3
		  ,T.UserDefinedField4
		  ,T.UserDefinedField5
		  ,T.UserDefinedField6
		  ,T.UserDefinedField7
		  ,T.UserDefinedField8
		  ,T.UserDefinedField9
		  ,T.UserDefinedField10
		  ,T.ImportDate
		  ,T.ImportFileName
		  ,T.ImportFileDate
		  ,T.LastUpdate
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