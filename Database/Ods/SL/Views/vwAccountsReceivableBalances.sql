CREATE VIEW [SL].[vwAccountsReceivableBalances]
AS

--
-- This view queries the SL.AccountsReceivableDocument table to generate
-- AR balances on open documents.
--

WITH InitialQuery
AS
(
	SELECT
		CompanyId
	   ,CustomerId
	   ,DocumentType
	   ,TransactionReferenceNumber
	   ,BatchNumber
	   ,BatchSequence
	   ,DocumentDate
	   ,DueDate
	   ,CASE
			WHEN DocumentType IN ( 'CM', 'PA', 'PP', 'SB' ) THEN CurrencyDocumentBalance * -1
			WHEN DocumentType IN ( 'DM', 'IN', 'SC' ) THEN CurrencyDocumentBalance * 1
			WHEN DocumentType = 'RP' THEN CurrencyDocumentBalance * 0
			ELSE CurrencyDocumentBalance * 1
		END				 AS DocumentBalance
	   ,CASE
			WHEN DocumentType IN ( 'CM', 'PA', 'PP', 'SB' ) THEN OriginalDocumentAmount * -1
			WHEN DocumentType IN ( 'DM', 'IN', 'SC' ) THEN OriginalDocumentAmount * 1
			WHEN DocumentType = 'RP' THEN OriginalDocumentAmount * 0
			ELSE OriginalDocumentAmount * 1
		END				 AS OriginalDocumentAmount
	   ,ISNULL((
				   SELECT TOP (1) SubaccountId
				   FROM SL.AccountsReceivableTransaction
				   WHERE
					   TransactionReferenceNumber		= T.TransactionReferenceNumber
					   AND TransactionType = T.DocumentType
					   AND CustomerId	= T.CustomerId
			   )
			  ,'000000'
			  )			 AS SubaccountId
	   ,PeriodToPost
	   ,WorkOrder
	   ,Released
	   ,OpenDocument
	   ,LastUpdate
	   ,ImportDate
	FROM SL.AccountsReceivableDocument T
)
SELECT
	InitialQuery.CompanyId
   ,InitialQuery.CustomerId
   ,InitialQuery.DocumentType
   ,InitialQuery.DueDate
   ,InitialQuery.DocumentDate
   ,InitialQuery.TransactionReferenceNumber
   ,InitialQuery.BatchNumber
   ,InitialQuery.BatchSequence
   ,InitialQuery.DocumentBalance
   ,InitialQuery.OriginalDocumentAmount
   ,InitialQuery.SubaccountId
   ,CASE
		WHEN LEN(InitialQuery.SubaccountId) >= 2 THEN SUBSTRING(InitialQuery.SubaccountId, 1, 2)
		ELSE ''
	END			AS ProfitCenterId
   ,CASE
		WHEN LEN(InitialQuery.SubaccountId) = 6 THEN SUBSTRING(InitialQuery.SubaccountId, 3, 4)
		ELSE ''
	END			AS LocationId
   ,InitialQuery.PeriodToPost
   ,InitialQuery.WorkOrder
   ,InitialQuery.Released
   ,InitialQuery.OpenDocument
   ,InitialQuery.LastUpdate
   ,InitialQuery.ImportDate
FROM InitialQuery;
GO
GRANT SELECT
    ON OBJECT::[SL].[vwAccountsReceivableBalances] TO [OdsUser]
    AS [dbo];

