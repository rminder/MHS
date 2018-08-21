CREATE VIEW SL.vwGeneralLedgerSetup
AS
SELECT
	[RowId]
   ,[SetupId]
   ,[BeginFiscalYear]
   ,[CompanyId]
   ,[CompanyName]
   ,[FiscalPeriodEnd00]
   ,[FiscalPeriodEnd01]
   ,[FiscalPeriodEnd02]
   ,[FiscalPeriodEnd03]
   ,[FiscalPeriodEnd04]
   ,[FiscalPeriodEnd05]
   ,[FiscalPeriodEnd06]
   ,[FiscalPeriodEnd07]
   ,[FiscalPeriodEnd08]
   ,[FiscalPeriodEnd09]
   ,[FiscalPeriodEnd10]
   ,[FiscalPeriodEnd11]
   ,[FiscalPeriodEnd12]
   ,[LedgerId]
   ,[NumberOfPeriods]
   ,[CurrentFiscalPeriod]
   ,[RetainedEarningsAccount]
   ,[NetIncomeAccount]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[GeneralLedgerSetup];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwGeneralLedgerSetup] TO [OdsUser]
    AS [dbo];

