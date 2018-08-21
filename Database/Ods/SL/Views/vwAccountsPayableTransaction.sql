CREATE VIEW SL.vwAccountsPayableTransaction
AS
SELECT
	[RowId]
   ,[Account]
   ,[BatchNumber]
   ,[CompanyId]
   ,[CurrencyId]
   ,[CurrencyRate]
   ,[CurrencyTransactionAmount]
   ,[DebitOrCredit]
   ,[EmployeeId]
   ,[FiscalYear]
   ,[InventoryId]
   ,[JournalType]
   ,[PeriodFinancialDate]
   ,[PeriodToPost]
   ,[ProjectId]
   ,[RecordId]
   ,[TransactionReferenceNumber]
   ,[Released]
   ,[SiteId]
   ,[SubaccountId]
   ,[SubSeg1]
   ,[SubSeg2]
   ,[TaskId]
   ,[TransactionAmount]
   ,[TransactionDate]
   ,[TransactionType]
   ,[VendorId]
   ,[TransactionDescription]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[AccountsPayableTransaction];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountsPayableTransaction] TO [OdsUser]
    AS [dbo];

