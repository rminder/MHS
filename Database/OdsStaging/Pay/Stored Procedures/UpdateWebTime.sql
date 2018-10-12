-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 11-October, 2018
-- Description: Move new and update WebTime rows from staging to
--			Ods.
--
-- Exec [Pay].[UpdateWebTime]
-- ===============================================================
CREATE PROCEDURE [Pay].[UpdateWebTime]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RowsMerged INT = 0;

	-- Find rows in staging that do not exist in Ods
	;
	WITH MissingRows
	AS
	(
		SELECT
			[CompanyId]
		   ,[EmployeeId]
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
		   ,[PunchId]
		FROM ODSStaging.Pay.WebTime
		EXCEPT
		SELECT
			[CompanyId]
		   ,[EmployeeId]
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
		   ,[PunchId]
		FROM ODS.Pay.WebTime
	)

	-- Retrieve all rows from MissingRows and retrieve the associated file names
	,SourceRows AS
	(
		SELECT
			T.[CompanyId]
		   ,T.[EmployeeId]
		   ,T.[BadgeNumber]
		   ,T.[LastName]
		   ,T.[FirstName]
		   ,T.[MiddleInitial]
		   ,T.[Title]
		   ,T.[PersonalEmail]
		   ,T.[WorkEmail]
		   ,T.[MobileNumber]
		   ,T.[PayDescription]
		   ,T.[PayType]
		   ,T.[Date]
		   ,T.[RoundedTimeIn]
		   ,T.[RoundedTimeOut]
		   ,T.[ActualTimeIn]
		   ,T.[ActualTimeOut]
		   ,T.[Hours]
		   ,T.[PunchType]
		   ,T.[LaborLevel1Code]
		   ,T.[LaborLevel1Description]
		   ,T.[LaborLevel2Code]
		   ,T.[LaborLevel2Description]
		   ,T.[LaborLevel3Code]
		   ,T.[LaborLevel3Description]
		   ,T.[LaborLevel4Code]
		   ,T.[LaborLevel4Description]
		   ,T.[LaborLevel5Code]
		   ,T.[LaborLevel5Description]
		   ,T.[PunchId]
		   ,T2.[FileName] AS ImportFileName
		FROM MissingRows					  T
			INNER JOIN ODSStaging.Pay.WebTime T2 ON T2.CompanyId		  = T.CompanyId
													AND T2.EmployeeId	  = T.EmployeeId
													AND T2.PunchId		  = T.PunchId
													AND T2.PayDescription = T.PayDescription
													AND T2.Date			  = T.Date
													AND T2.ActualTimeIn	  = T.ActualTimeIn
	)
	-- Merge all the missing rows in staging to Ods
	MERGE ODS.Pay.WebTime AS TARGET
	USING SourceRows AS SOURCE
	ON (
		   TARGET.CompanyId = SOURCE.CompanyId
		   AND TARGET.EmployeeId = SOURCE.EmployeeId
		   AND TARGET.PunchId = SOURCE.PunchId
		   AND Target.PayDescription = Source.PayDescription
		   AND Target.Date = Source.Date
		   AND Target.ActualTimeIn = Source.ActualTimeIn
	   )
	WHEN MATCHED THEN UPDATE SET
						  TARGET.BadgeNumber = SOURCE.BadgeNumber
						 ,TARGET.LastName = SOURCE.LastName
						 ,TARGET.FirstName = SOURCE.FirstName
						 ,TARGET.MiddleInitial = SOURCE.MiddleInitial
						 ,TARGET.Title = SOURCE.Title
						 ,TARGET.PersonalEmail = SOURCE.PersonalEmail
						 ,TARGET.WorkEmail = SOURCE.WorkEmail
						 ,TARGET.MobileNumber = SOURCE.MobileNumber
						 ,TARGET.PayType = SOURCE.PayType
						 ,TARGET.RoundedTimeIn = SOURCE.RoundedTimeIn
						 ,TARGET.RoundedTimeOut = SOURCE.RoundedTimeOut
						 ,TARGET.ActualTimeOut = SOURCE.ActualTimeOut
						 ,TARGET.Hours = SOURCE.Hours
						 ,TARGET.PunchType = SOURCE.PunchType
						 ,TARGET.LaborLevel1Code = SOURCE.LaborLevel1Code
						 ,TARGET.LaborLevel2Code = SOURCE.LaborLevel2Code
						 ,TARGET.LaborLevel3Code = SOURCE.LaborLevel3Code
						 ,TARGET.LaborLevel4Code = SOURCE.LaborLevel4Code
						 ,TARGET.LaborLevel5Code = SOURCE.LaborLevel5Code
						 ,TARGET.LaborLevel1Description = SOURCE.LaborLevel1Description
						 ,TARGET.LaborLevel2Description = SOURCE.LaborLevel2Description
						 ,TARGET.LaborLevel3Description = SOURCE.LaborLevel3Description
						 ,TARGET.LaborLevel4Description = SOURCE.LaborLevel4Description
						 ,TARGET.LaborLevel5Description = SOURCE.LaborLevel5Description
						 ,Target.[ImportFileName] = Source.[ImportFileName]
						 ,TARGET.LastUpdate = GETUTCDATE()
	WHEN NOT MATCHED BY TARGET THEN
		INSERT
		(
			[CompanyId]
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
		   ,[ImportFileName]
		   ,[LastUpdate]
		   ,[ImportDate]
		)
		VALUES
			 (SOURCE.CompanyId
			 ,SOURCE.EmployeeId
			 ,SOURCE.PunchId
			 ,SOURCE.BadgeNumber
			 ,SOURCE.LastName
			 ,SOURCE.FirstName
			 ,SOURCE.MiddleInitial
			 ,SOURCE.Title
			 ,SOURCE.PersonalEmail
			 ,SOURCE.WorkEmail
			 ,SOURCE.MobileNumber
			 ,SOURCE.PayDescription
			 ,SOURCE.PayType
			 ,SOURCE.Date
			 ,SOURCE.RoundedTimeIn
			 ,SOURCE.RoundedTimeOut
			 ,SOURCE.ActualTimeIn
			 ,SOURCE.ActualTimeOut
			 ,SOURCE.Hours
			 ,SOURCE.PunchType
			 ,SOURCE.LaborLevel1Code
			 ,SOURCE.LaborLevel1Description
			 ,SOURCE.LaborLevel2Code
			 ,SOURCE.LaborLevel2Description
			 ,SOURCE.LaborLevel3Code
			 ,SOURCE.LaborLevel3Description
			 ,SOURCE.LaborLevel4Code
			 ,SOURCE.LaborLevel4Description
			 ,SOURCE.LaborLevel5Code
			 ,SOURCE.LaborLevel5Description
			 ,Source.[ImportFileName]
			 ,GETUTCDATE()
			 ,GETUTCDATE());


	SET @RowsMerged = @@ROWCOUNT;

	IF @RowsMerged > 0
		INSERT INTO Ods.Pay.ImportLog (DataImported, RowsMerged, Status, Comments, TimestampUtc)
		VALUES
			 ('WebTime', @RowsMerged, 'Success', '', GETUTCDATE());
END;