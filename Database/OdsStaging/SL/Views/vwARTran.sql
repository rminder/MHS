CREATE VIEW [SL].[vwARTran] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([Acct])		   AS Account
   ,RTRIM([BatNbr])		   AS BatchNumber
   ,RTRIM([CpnyID])		   AS CompanyId
   ,[CuryId]			   AS CurrencyId
   ,[CuryRate]			   AS CurrencyRate
   ,[CuryTranAmt]		   AS CurrencyTransactionAmount
   ,[CustId]			   AS CustomerId
   ,RTRIM([FiscYr])		   AS FiscalYear
   ,RTRIM([InvtId])		   AS InventoryId
   ,RTRIM([JrnlType])	   AS JournalType
   ,RTRIM([LineNbr])	   AS LineNumber
   ,[DrCr]				   AS DebitOrCredit
   ,RTRIM([PerPost])	   AS PeriodToPost
   ,CASE
		WHEN LEN(RTRIM(PerPost)) > 0 THEN CONVERT(DATETIME, SUBSTRING(PerPost, 1, 4) + '-' + SUBSTRING(PerPost, 5, 2) + '-01')
		ELSE NULL
	END					   AS PeriodFinancialDate
   ,RTRIM([ProjectID])	   AS ProjectId
   ,RecordID
   ,RTRIM(RefNbr)		   AS TransactionReferenceNumber
   ,[Rlsed]				   AS Released
   ,RTRIM(SiteId)		   AS SiteId
   ,RTRIM(SlsperId)		   AS SalesPersonId
   ,RTRIM([Sub])		   AS SubaccountId
   ,SUBSTRING([Sub], 1, 2) AS SubSeg1
   ,SUBSTRING([Sub], 3, 4) AS SubSeg2
   ,RTRIM([TaskID])		   AS TaskId
   ,[TranAmt]			   AS TransactionAmount
   ,[TranDate]			   AS TransactionDate
   ,RTRIM([TranType])	   AS TransactionType
   ,RTRIM(WhseLoc)		   AS WarehouseLocation
   ,RTRIM([TranDesc])	   AS TransactionDescription
   ,[LUpd_DateTime]		   AS LastUpdate
   ,[RowVersion]	 AS [RowVersion]
   ,GETUTCDATE()		   AS ImportDate
FROM SL.ARTran;