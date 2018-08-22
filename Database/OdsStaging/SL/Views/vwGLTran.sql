



CREATE VIEW [SL].[vwGLTran] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([Acct])		   AS Account
   ,RTRIM([BaseCuryID])	   AS BaseCurrencyId
   ,RTRIM([BatNbr])		   AS BatchNumber
   ,RTRIM([CpnyID])		   AS CompanyId
   ,[CrAmt]				   AS CreditAmount
   ,[CuryCrAmt]			   AS CurrencyCreditAmount
   ,[CuryDrAmt]			   AS CurrencyDebitAmount
   ,RTRIM([CuryId])		   AS CurrencyId
   ,[CuryRate]			   AS CurrencyRate
   ,[DrAmt]				   AS DebitAmount
   ,RTRIM([FiscYr])		   AS FiscalYear
   ,RTRIM([JrnlType])	   AS JournalType
   ,RTRIM([LedgerID])	   AS LedgerId
   ,RTRIM([LineNbr])	   AS LineNumber
   ,[LUpd_DateTime]		   AS LastUpdate
   ,RTRIM([Module])		   AS Module
   ,RTRIM([PerPost])	   AS PeriodToPost
   ,CASE
		WHEN LEN(RTRIM(PerPost)) > 0 THEN CONVERT(DATETIME, SUBSTRING(PerPost, 1, 4) + '-' + SUBSTRING(PerPost, 5, 2) + '-01')
		ELSE NULL
	END					   AS PeriodFinancialDate
   ,[Posted]			   AS Posted
   ,RTRIM([ProjectID])	   AS ProjectId
   ,[Rlsed]				   AS Released
   ,RTRIM([Sub])		   AS SubaccountId
   ,RTRIM([TaskID])		   AS TaskId
   ,[TranDate]			   AS TransactionDate
   ,RTRIM([TranDesc])	   AS TransactionDescription
   ,RTRIM([TranType])	   AS TransactionType
   ,GETUTCDATE()		   AS ImportDate
   ,BalanceType
   ,CASE
		WHEN LEN(RTRIM(Sub)) >= 2 THEN  SUBSTRING([Sub], 1, 2)
		ELSE ''
	END AS SubSeg1
   ,CASE
		WHEN LEN(RTRIM(Sub)) = 6 THEN  SUBSTRING([Sub], 3, 4)
		ELSE ''
	END AS SubSeg2
   ,RefNbr				   AS TransactionReferenceNumber
FROM SL.GLTran;
