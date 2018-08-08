
CREATE VIEW [SL].[vwAPTran] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([Acct])		   AS Account
   ,RTRIM([BatNbr])		   AS BatchNumber
   ,RTRIM([CpnyID])		   AS CompanyId
   ,RTRIM([CuryId])		   AS CurrencyId
   ,[CuryRate]			   AS CurrencyRate
   ,[CuryTranAmt]		   AS CurrencyTransactionAmount
   ,[DrCr]				   AS DebitOrCredit
   ,RTRIM(EmployeeID)	   AS EmployeeId
   ,RTRIM([FiscYr])		   AS FiscalYear
   ,RTRIM(InvtID)		   AS InventoryId
   ,RTRIM([JrnlType])	   AS JournalType
   ,CASE
		WHEN LEN(RTRIM(PerPost)) > 0 THEN CONVERT(DATETIME, SUBSTRING(PerPost, 1, 4) + '-' + SUBSTRING(PerPost, 5, 2) + '-01')
		ELSE NULL
	END					   AS PeriodFinancialDate
   ,RTRIM([PerPost])	   AS PeriodToPost
   ,RTRIM([ProjectID])	   AS ProjectId
   ,RecordID
   ,RTRIM(RefNbr)		   AS TransactionReferenceNumber
   ,[Rlsed]				   AS Released
   ,RTRIM(SiteId)		   AS SiteId
   ,RTRIM([Sub])		   AS SubaccountId
   ,CASE
		WHEN LEN(RTRIM(Sub)) >= 2 THEN  SUBSTRING([Sub], 1, 2)
		ELSE ''
	END AS SubSeg1
   ,CASE
		WHEN LEN(RTRIM(Sub)) = 6 THEN  SUBSTRING([Sub], 3, 4)
		ELSE ''
	END AS SubSeg2
   ,RTRIM([TaskID])		   AS TaskId
   ,TranAmt				   AS TransactionAmount
   ,TranDate			   AS TransactionDate
   ,trantype			   AS TransactionType
   ,RTRIM(VendId)		   AS VendorId
   ,RTRIM(TranDesc)		   AS TransactionDescription
   ,[LUpd_DateTime]		   AS LastUpdate
   ,GETUTCDATE()		   AS ImportDate
FROM SL.APTran;