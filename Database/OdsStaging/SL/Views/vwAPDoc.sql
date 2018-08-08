CREATE VIEW [SL].[vwAPDoc]
AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([Acct])	 AS Account
   ,RTRIM([CpnyID])	 AS CompanyId
   ,RTRIM(VendId)	 AS VendorId
   ,RTRIM(RefNbr)	 AS TransactionReferenceNumber
   ,DocDate			 AS DocumentDate
   ,DueDate			 AS DueDate
   ,DiscDate		 AS DiscountDate
   ,CuryDocBal		 AS CurrencyDocumentBalance
   ,RTRIM(DocType)	 AS DocumentType
   ,CASE
		WHEN RTRIM(DocType) IN ( 'VO', 'AC' ) THEN CuryDocBal * 1
		WHEN RTRIM(DocType) IN ( 'AD', 'CK', 'EP', 'HC', 'QC' ) THEN CuryDocBal * -1
		ELSE CuryDocBal * 1
	END				 AS DocumentBalance
   ,ISNULL((
		SELECT TOP (1) SubaccountId
		FROM Ods.SL.AccountsPayableTransaction
		WHERE TransactionReferenceNumber = RTRIM(SL.APDoc.RefNbr)
	),'000000')		 AS SubaccountId
   ,CASE
		WHEN LEN(RTRIM(Sub)) >= 2 THEN SUBSTRING([Sub], 1, 2)
		ELSE ''
	END				 AS ProfitCenterId
   ,CASE
		WHEN LEN(RTRIM(Sub)) = 6 THEN SUBSTRING([Sub], 3, 4)
		ELSE ''
	END				 AS LocationId
   ,RTRIM([PerPost]) AS PeriodToPost
   ,RTRIM(InvcNbr)	 AS InvoiceNumber
   ,RecordID		 AS RecordId
   ,[LUpd_DateTime]	 AS LastUpdate
   ,GETUTCDATE()	 AS ImportDate
FROM SL.APDoc;