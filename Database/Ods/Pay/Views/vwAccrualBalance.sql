CREATE VIEW Pay.vwAccrualBalance
AS
SELECT
	[RowId]
   ,[CompanyId]
   ,[EmployeeId]
   ,[AccrualCode]
   ,[EffectiveDate]
   ,[AvailableHours]
   ,[CurrentPeriodUsedHours]
   ,[CurrentPeriodAccruedHours]
   ,[YearToDateUsedHours]
   ,[YearToDateAccruedHours]
   ,[SocialSecurityNumber]
   ,[LastUpdate]
   ,[ImportDate]
   ,[PreviousPeriodCarriedOverHours]
FROM [ODS].[Pay].[AccrualBalance];