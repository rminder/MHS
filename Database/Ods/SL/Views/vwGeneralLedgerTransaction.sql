
CREATE VIEW [SL].[vwGeneralLedgerTransaction]
AS
SELECT
	[RowId]
   ,[Account]
   ,[BaseCurrencyId]
   ,[BatchNumber]
   ,[CompanyId]
   ,[CreditAmount]
   ,[CurrencyCreditAmount]
   ,[CurrencyDebitAmount]
   ,[CurrencyId]
   ,[CurrencyRate]
   ,[DebitAmount]
   ,[FiscalYear]
   ,[JournalType]
   ,[LedgerId]
   ,[LineNumber]
   ,[Module]
   ,[PeriodToPost]
   ,[PeriodFinancialDate]
   ,[Posted]
   ,[ProjectId]
   ,[Released]
   ,[SubaccountId]
   ,[SubSeg1]
   ,[SubSeg2]
   ,[TaskId]
   ,[TransactionDate]
   ,[TransactionDesc]
   ,[TransactionType]
   ,[TransactionReferenceNumber]
   ,[BalanceType]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[GeneralLedgerTransaction];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwGeneralLedgerTransaction] TO [OdsUser]
    AS [dbo];

