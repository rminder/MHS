CREATE VIEW SL.vwAccountsReceivableDocument
AS
SELECT
	[RowId]
   ,[CompanyId]
   ,[CustomerId]
   ,[DocumentType]
   ,[TransactionReferenceNumber]
   ,[BatchNumber]
   ,[BatchSequence]
   ,[DocumentDate]
   ,[DueDate]
   ,[DocumentBalance]
   ,[CurrencyDocumentBalance]
   ,[OriginalDocumentAmount]
   ,[SubaccountId]
   ,[PeriodToPost]
   ,[WorkOrder]
   ,[Released]
   ,[OpenDocument]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[AccountsReceivableDocument];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountsReceivableDocument] TO [OdsUser]
    AS [dbo];

