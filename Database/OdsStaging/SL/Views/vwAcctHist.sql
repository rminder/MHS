


CREATE VIEW [SL].[vwAcctHist] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([Acct]) AS Account
   ,RTRIM([BalanceType]) AS BalanceType
   ,[BegBal] AS BeginningBalance
   ,RTRIM([CpnyID]) AS CompanyId
   ,RTRIM([CuryId]) AS CurrencyId
   ,RTRIM([FiscYr]) AS FiscalYear
   ,RTRIM([LedgerId]) AS LedgerId
   ,RTRIM([Sub]) AS SubaccountId
   ,BdgtRvsnDate AS BudgetRevisionDate
   ,PtdBal00 AS PostedBalance00
   ,PtdBal01 AS PostedBalance01
   ,PtdBal02 AS PostedBalance02
   ,PtdBal03 AS PostedBalance03
   ,PtdBal04 AS PostedBalance04
   ,PtdBal05 AS PostedBalance05
   ,PtdBal06 AS PostedBalance06
   ,PtdBal07 AS PostedBalance07
   ,PtdBal08 AS PostedBalance08
   ,PtdBal09 AS PostedBalance09
   ,PtdBal10 AS PostedBalance10
   ,PtdBal11 AS PostedBalance11
   ,PtdBal12 AS PostedBalance12
   ,[LUpd_DateTime] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SL].[AcctHist];