

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
   ,DocBal		     AS DocumentBalance
   ,RTRIM(Sub)	     AS SubaccountId
   ,''				 AS ProfitCenterId
   ,''				 AS LocationId
   ,RTRIM([PerPost]) AS PeriodToPost
   ,RTRIM(InvcNbr)	 AS InvoiceNumber
   ,OpenDoc          AS OpenDocument
   ,Rlsed            AS Released
   ,RecordID		 AS RecordId
   ,[LUpd_DateTime]	 AS LastUpdate
   ,GETUTCDATE()	 AS ImportDate
FROM SL.APDoc;