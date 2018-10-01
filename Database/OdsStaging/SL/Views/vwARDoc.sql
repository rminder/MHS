
CREATE VIEW [SL].[vwARDoc]
AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM(CpnyID)	 AS CompanyId
   ,RTRIM(CustId)	 AS CustomerId
   ,RTRIM(DocType)	 AS DocumentType
   ,RTRIM(RefNbr)	 AS TransactionReferenceNumber
   ,RTRIM(BatNbr)	 AS BatchNumber
   ,BatSeq			 AS BatchSequence
   ,DocDate			 AS DocumentDate
   ,DueDate			 AS DueDate
   ,DocBal			 AS DocumentBalance
   ,CuryDocBal		 AS CurrencyDocumentBalance
   ,OrigDocAmt		 AS OriginalDocumentAmount
   ,''				 AS SubaccountId
   ,RTRIM([PerPost]) AS PeriodToPost
   ,RTRIM(User1)	 AS WorkOrder
   ,Rlsed			 AS Released
   ,OpenDoc			 AS OpenDocument
   ,[LUpd_DateTime]	 AS LastUpdate
   ,[RowVersion]	 AS [RowVersion]
   ,GETUTCDATE()	 AS ImportDate
FROM SL.ARDoc;