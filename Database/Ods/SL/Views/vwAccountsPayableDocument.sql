CREATE VIEW [SL].[vwAccountsPayableDocument] AS

WITH CTE AS
(
	SELECT
		Account
	   ,CompanyId
	   ,VendorId
	   ,TransactionReferenceNumber
	   ,DocumentDate
	   ,DueDate
	   ,DiscountDate
	   ,CurrencyDocumentBalance
	   ,DocumentType
	   ,CASE
			WHEN RTRIM(DocumentType) IN ( 'VO', 'AC' ) THEN CurrencyDocumentBalance * 1
			WHEN RTRIM(DocumentType) IN ( 'AD', 'CK', 'EP', 'HC', 'QC' ) THEN CurrencyDocumentBalance * -1
			ELSE CurrencyDocumentBalance * 1
		END				 AS DocumentBalance
	   ,ISNULL((
			SELECT TOP (1) SubaccountId
			FROM Ods.SL.AccountsPayableTransaction
			WHERE TransactionReferenceNumber = SL.AccountsPayableDocument.TransactionReferenceNumber
		),'000000')		 AS SubaccountId
	   ,PeriodToPost
	   ,InvoiceNumber
	   ,RecordID
	   ,Released
	   ,OpenDocument
	   ,LastUpdate
	   ,ImportDate
	FROM [SL].[AccountsPayableDocument]
)

Select
	Account
	,CompanyId
	,VendorId
	,TransactionReferenceNumber
	,DocumentDate
	,DueDate
	,DiscountDate
	,CurrencyDocumentBalance
	,DocumentType
	,DocumentBalance
	,SubaccountId
	,SubString(SubAccountId, 1, 2) as ProfitCenterId
	,SubString(SubAccountId, 3, 4) as LocationId
	,PeriodToPost
	,InvoiceNumber
	,RecordId
	,Released
	,OpenDocument
	,LastUpdate
	,ImportDate
From CTE