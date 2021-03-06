﻿CREATE VIEW SL.vwAccountHistory
AS
SELECT
	[RowId]
   ,[Account]
   ,[BalanceType]
   ,[BeginningBalance]
   ,[CompanyId]
   ,[CurrencyId]
   ,[FiscalYear]
   ,[LedgerId]
   ,[SubaccountId]
   ,[BudgetRevisionDate]
   ,[PostedBalance00]
   ,[PostedBalance01]
   ,[PostedBalance02]
   ,[PostedBalance03]
   ,[PostedBalance04]
   ,[PostedBalance05]
   ,[PostedBalance06]
   ,[PostedBalance07]
   ,[PostedBalance08]
   ,[PostedBalance09]
   ,[PostedBalance10]
   ,[PostedBalance11]
   ,[PostedBalance12]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[AccountHistory];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountHistory] TO [OdsUser]
    AS [dbo];

