﻿CREATE VIEW [SL].[vwLedger] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([LedgerId]) AS LedgerId
   ,BalanceType
   ,BalRequired as BalanceRequired
   ,RTRIM(BaseCuryID) as BaseCurrencyId
   ,RTRIM([Descr]) AS Description
   ,[LUpd_DateTime] AS LastUpdate
   ,[RowVersion]	 AS [RowVersion]
   ,GETUTCDATE() AS ImportDate
FROM SL.Ledger;