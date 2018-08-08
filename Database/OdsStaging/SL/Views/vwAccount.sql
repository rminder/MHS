
CREATE VIEW [SL].[vwAccount] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([Acct]) AS Account
   ,RTRIM([AcctType]) AS AccountType
   ,RTRIM([AcctType]) AS BaseCurrencyId
   ,RTRIM([Acct_Cat]) AS AccountCategory
   ,RTRIM([Acct_Cat_SW]) AS AccountCategorySpecified
   ,[Active]
   ,RTRIM([ClassId]) AS ClassId
   ,RTRIM([ConsolAcct]) AS ConsolidationAccount
   ,RTRIM([CuryId]) AS CurrencyId
   ,RTRIM([Descr]) AS Description
   ,RTRIM([RatioGrp]) AS RatioGroup
   ,[LUpd_DateTime] AS LastUpdate
   ,[SummPost] AS IsSummarized
   ,GETUTCDATE() AS ImportDate
FROM SL.Account;
