CREATE VIEW SL.vwAccountsReceivableTransaction
AS
SELECT
	[RowId]
   ,[Account]
   ,[BatchNumber]
   ,[CompanyId]
   ,[CurrencyId]
   ,[CurrencyRate]
   ,[CurrencyTransactionAmount]
   ,[CustomerId]
   ,[DebitOrCredit]
   ,[FiscalYear]
   ,[InventoryId]
   ,[JournalType]
   ,[LineNumber]
   ,[PeriodToPost]
   ,[PeriodFinancialDate]
   ,[ProjectId]
   ,[RecordId]
   ,[TransactionReferenceNumber]
   ,[Released]
   ,[SiteId]
   ,[SalesPersonId]
   ,[SubaccountId]
   ,[SubSeg1]
   ,[SubSeg2]
   ,[TaskId]
   ,[TransactionAmount]
   ,[TransactionDate]
   ,[TransactionType]
   ,[WarehouseLocation]
   ,[TransactionDescription]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[AccountsReceivableTransaction];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountsReceivableTransaction] TO [OdsUser]
    AS [dbo];

