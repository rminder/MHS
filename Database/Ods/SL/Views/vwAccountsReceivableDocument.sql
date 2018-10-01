



CREATE VIEW [SL].[vwAccountsReceivableDocument]
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
   ,ISNULL((
		SELECT TOP (1) SubaccountId
		FROM SL.AccountsReceivableTransaction
		WHERE
			TransactionReferenceNumber = T.TransactionReferenceNumber
			AND TransactionType		   = T.DocumentType
			AND CustomerId			   = T.CustomerId
			AND SubaccountId <> '000000'
			AND SubaccountId <> ''
		ORDER BY RecordId
	),'000000') AS SubaccountId
   ,[PeriodToPost]
   ,[WorkOrder]
   ,[Released]
   ,[OpenDocument]
   ,[LastUpdate]
   ,[ImportDate]
   ,[RowVersion]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[AccountsReceivableDocument] T;
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountsReceivableDocument] TO [OdsUser]
    AS [dbo];

