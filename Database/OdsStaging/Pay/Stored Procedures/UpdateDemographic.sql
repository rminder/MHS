-- ===================================================================
-- Author:      Randy Minder
-- Create Date: 15-October, 2018
-- Description: Move new and update Demographic rows from staging to
--			Ods.
--
-- Exec [Pay].[UpdateDemographic]
-- ===================================================================
CREATE PROCEDURE [Pay].[UpdateDemographic]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RowsMerged INT = 0;

	-- We process one CSV file at a time. Therefore, all the rows in the OdsStaging.Pay.Demographic table will have the same
	-- import file name
	DECLARE @ImportFileName VARCHAR(80) = ISNULL((SELECT TOP 1 FileName FROM ODSStaging.Pay.Demographic), '')
	DECLARE @ImportFileDate Date = ISNULL((SELECT TOP 1 FileDate FROM OdsStaging.Pay.Demographic),'') 

	-- Find rows in staging that do not exist in Ods
	;
	WITH MissingRows
	AS
	(
		SELECT
			[Employee_ID]														   AS EmployeeId
		   ,[Paylocity_Company_Code]											   AS CompanyId
		   ,[SSN]																   AS SocialSecurityNumber
		   ,[First_Name]														   AS FirstName
		   ,[Middle_Initial]													   AS MiddleInitial
		   ,[Last_Name]															   AS LastName
		   ,[Address_1]															   AS Address1
		   ,[Address_2]															   AS Address2
		   ,[City]																   AS City
		   ,[State]																   AS State
		   ,[Postal]															   AS PostalCode
		   ,[County]															   AS County
		   ,[Birth_Date]														   AS BirthDate
		   ,[Hire_Date]															   AS HireDate
		   ,[Adjusted_Seniority_Date]											   AS [AdjustedSeniorityDate]
		   ,[Rehire_Date]														   AS RehireDate
		   ,[Employment_Term_Date]												   AS [EmploymentTerminationDate]
		   ,[Term_Reason]														   AS TerminationReason
		   ,[Employee_Status]													   AS EmployeeStatus
		   ,[Employee_Type_Description]											   AS EmployeeTypeDescription
		   ,[Gender]															   AS Gender
		   ,[Marital_Status]													   AS MaritalStatus
		   ,[Home_Phone]														   AS HomePhone
		   ,[Personal_Email]													   AS PersonalEmail
		   ,[Mobile_Phone]														   AS MobilePhone
		   ,[Work_Phone]														   AS WorkPhone
		   ,[Work_Email]														   AS WorkEmail
		   ,[Work_Location_Name]												   AS WorkLocationName
		   ,[Job_Title]															   AS JobTitle
		   ,[Position_Code]														   AS PositionCode
		   ,[Position_Description]												   AS PositionDescription
		   ,[Cost_Center_1]														   AS CostCenter1
		   ,[Cost_Center_1_Description]											   AS [CostCenter1Description]
		   ,[Cost_Center_2]														   AS CostCenter2
		   ,[Cost_Center_2_Description]											   AS [CostCenter2Description]
		   ,[Cost_Center_3]														   AS CostCenter3
		   ,[Cost_Center_3_Description]											   AS [CostCenter3Description]
		   ,[Ethnicity]
		   ,[EEO_Class]															   AS EeoClass
		   ,[Pay_Group_Code]													   AS PayGroupCode
		   ,[Pay_Frequency]														   AS PayFrequency
		   ,[Hourly_Salary]														   AS HourlyOrSalary
		   ,[Default_Hours]														   AS DefaultHours
		   ,[Highly_Compensated]												   AS HighlyCompensated
		   ,[Benefit_Class_Code]												   AS BenefitClassCode
		   ,[Benefit_Class_Description]											   AS [BenefitClassDescription]
		   ,[Benefit_Class_Effective_Date]										   AS [BenefitClassEffectiveDate]
		   ,[Benefit_Override_Salary]											   AS [BenefitOverrideSalary]
		   ,[Benefit_Salary_Effective_Date]										   AS [BenefitSalaryEffectiveDate]
		   ,IIF(LEN([Benefit_Hours_Per_Week]) = 0, NULL, [Benefit_Hours_Per_Week]) AS [BenefitHoursPerWeek]
		   ,[Benefit_Location]													   AS BenefitLocation
		   ,[Benefit_Division]													   AS BenefitDivision
		   ,[Benefit_Termination_Date]											   AS BenefitTerminationDate
		   ,[Badge_Number_Clock_Number]											   AS BadgeNumberClockNumber
		   ,[Web_Time_Badge_Number]												   AS WebTimeBadgeNumber
		   ,[Enable_Time_and_Labor]												   AS EnableTimeAndLabor
		   ,[Eligible_for_Rehire_]												   AS EligibleForRehire
		   ,[_Target_Bonus_]													   AS TargetBonus
		   ,[_Area_]															   AS Area
		   ,[_USER_DEFINED_FIELD_3_]											   AS UserDefinedField3
		   ,[_USER_DEFINED_FIELD_4_]											   AS UserDefinedField4
		   ,[_USER_DEFINED_FIELD_5_]											   AS UserDefinedField5
		   ,[_USER_DEFINED_FIELD_6_]											   AS UserDefinedField6
		   ,[_USER_DEFINED_FIELD_7_]											   AS UserDefinedField7
		   ,[_USER_DEFINED_FIELD_8_]											   AS UserDefinedField8
		   ,[_USER_DEFINED_FIELD_9_]											   AS UserDefinedField9
		   ,[_USER_DEFINED_FIELD_10_]											   AS UserDefinedField10
		FROM ODSStaging.Pay.Demographic
		EXCEPT
		SELECT
			[EmployeeId]
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
		FROM ODS.Pay.Demographic
	)

	-- Merge all the missing rows in staging to Ods
	MERGE ODS.Pay.Demographic AS TARGET
	USING MissingRows AS SOURCE
	ON (TARGET.CompanyId = SOURCE.CompanyId AND TARGET.EmployeeId = SOURCE.EmployeeId)
	WHEN MATCHED THEN UPDATE SET
						  [EmployeeId] = SOURCE.[EmployeeId]
						 ,[CompanyId] = SOURCE.[CompanyId]
						 ,[SocialSecurityNumber] = SOURCE.[SocialSecurityNumber]
						 ,[FirstName] = SOURCE.[FirstName]
						 ,[MiddleInitial] = SOURCE.[MiddleInitial]
						 ,[LastName] = SOURCE.[LastName]
						 ,[Address1] = SOURCE.[Address1]
						 ,[Address2] = SOURCE.[Address2]
						 ,[City] = SOURCE.[City]
						 ,[State] = SOURCE.[State]
						 ,[PostalCode] = SOURCE.[PostalCode]
						 ,[County] = SOURCE.[County]
						 ,[BirthDate] = SOURCE.[BirthDate]
						 ,[HireDate] = SOURCE.[HireDate]
						 ,[AdjustedSeniorityDate] = SOURCE.[AdjustedSeniorityDate]
						 ,[RehireDate] = SOURCE.[RehireDate]
						 ,[EmploymentTerminationDate] = SOURCE.[EmploymentTerminationDate]
						 ,[TerminationReason] = SOURCE.[TerminationReason]
						 ,[EmployeeStatus] = SOURCE.[EmployeeStatus]
						 ,[EmployeeTypeDescription] = SOURCE.[EmployeeTypeDescription]
						 ,[Gender] = SOURCE.[Gender]
						 ,[MaritalStatus] = SOURCE.[MaritalStatus]
						 ,[HomePhone] = SOURCE.[HomePhone]
						 ,[PersonalEmail] = SOURCE.[PersonalEmail]
						 ,[MobilePhone] = SOURCE.[MobilePhone]
						 ,[WorkPhone] = SOURCE.[WorkPhone]
						 ,[WorkEmail] = SOURCE.[WorkEmail]
						 ,[WorkLocationName] = SOURCE.[WorkLocationName]
						 ,[JobTitle] = SOURCE.[JobTitle]
						 ,[PositionCode] = SOURCE.[PositionCode]
						 ,[PositionDescription] = SOURCE.[PositionDescription]
						 ,[CostCenter1] = SOURCE.[CostCenter1]
						 ,[CostCenter1Description] = SOURCE.[CostCenter1Description]
						 ,[CostCenter2] = SOURCE.[CostCenter2]
						 ,[CostCenter2Description] = SOURCE.[CostCenter2Description]
						 ,[CostCenter3] = SOURCE.[CostCenter3]
						 ,[CostCenter3Description] = SOURCE.[CostCenter3Description]
						 ,[Ethnicity] = SOURCE.[Ethnicity]
						 ,[EeoClass] = SOURCE.[EeoClass]
						 ,[PayGroupCode] = SOURCE.[PayGroupCode]
						 ,[PayFrequency] = SOURCE.[PayFrequency]
						 ,[HourlyOrSalary] = SOURCE.[HourlyOrSalary]
						 ,[DefaultHours] = SOURCE.[DefaultHours]
						 ,[HighlyCompensated] = SOURCE.[HighlyCompensated]
						 ,[BenefitClassCode] = SOURCE.[BenefitClassCode]
						 ,[BenefitClassDescription] = SOURCE.[BenefitClassDescription]
						 ,[BenefitClassEffectiveDate] = SOURCE.[BenefitClassEffectiveDate]
						 ,[BenefitOverrideSalary] = SOURCE.[BenefitOverrideSalary]
						 ,[BenefitSalaryEffectiveDate] = SOURCE.[BenefitSalaryEffectiveDate]
						 ,[BenefitHoursPerWeek] = SOURCE.[BenefitHoursPerWeek]
						 ,[BenefitLocation] = SOURCE.[BenefitLocation]
						 ,[BenefitDivision] = SOURCE.[BenefitDivision]
						 ,[BenefitTerminationDate] = SOURCE.[BenefitTerminationDate]
						 ,[BadgeNumberClockNumber] = SOURCE.[BadgeNumberClockNumber]
						 ,[WebTimeBadgeNumber] = SOURCE.[WebTimeBadgeNumber]
						 ,[EnableTimeandLabor] = SOURCE.[EnableTimeandLabor]
						 ,[EligibleforRehire] = SOURCE.[EligibleforRehire]
						 ,[TargetBonus] = SOURCE.[TargetBonus]
						 ,[Area] = SOURCE.[Area]
						 ,[UserDefinedField3] = SOURCE.[UserDefinedField3]
						 ,[UserDefinedField4] = SOURCE.[UserDefinedField4]
						 ,[UserDefinedField5] = SOURCE.[UserDefinedField5]
						 ,[UserDefinedField6] = SOURCE.[UserDefinedField6]
						 ,[UserDefinedField7] = SOURCE.[UserDefinedField7]
						 ,[UserDefinedField8] = SOURCE.[UserDefinedField8]
						 ,[UserDefinedField9] = SOURCE.[UserDefinedField9]
						 ,[UserDefinedField10] = SOURCE.[UserDefinedField10]
						 ,[ImportDate] = GETUTCDATE()
						 ,[ImportFileName] = @ImportFileName
						 ,[ImportFileDate] = @ImportFileDate
						 ,[LastUpdate] = GETUTCDATE()
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
		(
			[EmployeeId]
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
		   ,[ImportFileName]
		   ,[ImportFileDate]
		   ,[ImportDate]
		   ,[LastUpdate]
		)
		VALUES
			 (SOURCE.[EmployeeId]
			 ,SOURCE.[CompanyId]
			 ,SOURCE.[SocialSecurityNumber]
			 ,SOURCE.[FirstName]
			 ,SOURCE.[MiddleInitial]
			 ,SOURCE.[LastName]
			 ,SOURCE.[Address1]
			 ,SOURCE.[Address2]
			 ,SOURCE.[City]
			 ,SOURCE.[State]
			 ,SOURCE.[PostalCode]
			 ,SOURCE.[County]
			 ,SOURCE.[BirthDate]
			 ,SOURCE.[HireDate]
			 ,SOURCE.[AdjustedSeniorityDate]
			 ,SOURCE.[RehireDate]
			 ,SOURCE.[EmploymentTerminationDate]
			 ,SOURCE.[TerminationReason]
			 ,SOURCE.[EmployeeStatus]
			 ,SOURCE.[EmployeeTypeDescription]
			 ,SOURCE.[Gender]
			 ,SOURCE.[MaritalStatus]
			 ,SOURCE.[HomePhone]
			 ,SOURCE.[PersonalEmail]
			 ,SOURCE.[MobilePhone]
			 ,SOURCE.[WorkPhone]
			 ,SOURCE.[WorkEmail]
			 ,SOURCE.[WorkLocationName]
			 ,SOURCE.[JobTitle]
			 ,SOURCE.[PositionCode]
			 ,SOURCE.[PositionDescription]
			 ,SOURCE.[CostCenter1]
			 ,SOURCE.[CostCenter1Description]
			 ,SOURCE.[CostCenter2]
			 ,SOURCE.[CostCenter2Description]
			 ,SOURCE.[CostCenter3]
			 ,SOURCE.[CostCenter3Description]
			 ,SOURCE.[Ethnicity]
			 ,SOURCE.[EeoClass]
			 ,SOURCE.[PayGroupCode]
			 ,SOURCE.[PayFrequency]
			 ,SOURCE.[HourlyOrSalary]
			 ,SOURCE.[DefaultHours]
			 ,SOURCE.[HighlyCompensated]
			 ,SOURCE.[BenefitClassCode]
			 ,SOURCE.[BenefitClassDescription]
			 ,SOURCE.[BenefitClassEffectiveDate]
			 ,SOURCE.[BenefitOverrideSalary]
			 ,SOURCE.[BenefitSalaryEffectiveDate]
			 ,SOURCE.[BenefitHoursPerWeek]
			 ,SOURCE.[BenefitLocation]
			 ,SOURCE.[BenefitDivision]
			 ,SOURCE.[BenefitTerminationDate]
			 ,SOURCE.[BadgeNumberClockNumber]
			 ,SOURCE.[WebTimeBadgeNumber]
			 ,SOURCE.[EnableTimeandLabor]
			 ,SOURCE.[EligibleforRehire]
			 ,SOURCE.[TargetBonus]
			 ,SOURCE.[Area]
			 ,SOURCE.[UserDefinedField3]
			 ,SOURCE.[UserDefinedField4]
			 ,SOURCE.[UserDefinedField5]
			 ,SOURCE.[UserDefinedField6]
			 ,SOURCE.[UserDefinedField7]
			 ,SOURCE.[UserDefinedField8]
			 ,SOURCE.[UserDefinedField9]
			 ,SOURCE.[UserDefinedField10]
			 ,@ImportFileName
			 ,@ImportFileDate
			 ,GETUTCDATE()
			 ,GETUTCDATE());

	SET @RowsMerged = @@ROWCOUNT;

	IF @RowsMerged > 0
		INSERT INTO ODS.Pay.ImportLog (DataImported, RowsMerged, Status, Comments, ImportFileName, TimestampUtc)
		VALUES
			 ('Demographic', @RowsMerged, 'Success', '', @ImportFileName, GETUTCDATE());
END;