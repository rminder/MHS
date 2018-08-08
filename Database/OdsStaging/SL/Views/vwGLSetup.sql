
CREATE VIEW [SL].[vwGLSetup]
AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM(SetupId)			AS SetupId
   ,RTRIM([BegFiscalYr])	AS BeginFiscalYear
   ,RTRIM([CpnyId])			AS CompanyId
   ,RTRIM([CpnyName])		AS CompanyName
   ,RTRIM([FiscalPerEnd00]) AS FiscalPeriodEnd00
   ,RTRIM([FiscalPerEnd01]) AS FiscalPeriodEnd01
   ,RTRIM([FiscalPerEnd02]) AS FiscalPeriodEnd02
   ,RTRIM([FiscalPerEnd03]) AS FiscalPeriodEnd03
   ,RTRIM([FiscalPerEnd04]) AS FiscalPeriodEnd04
   ,RTRIM([FiscalPerEnd05]) AS FiscalPeriodEnd05
   ,RTRIM([FiscalPerEnd06]) AS FiscalPeriodEnd06
   ,RTRIM([FiscalPerEnd07]) AS FiscalPeriodEnd07
   ,RTRIM([FiscalPerEnd08]) AS FiscalPeriodEnd08
   ,RTRIM([FiscalPerEnd09]) AS FiscalPeriodEnd09
   ,RTRIM([FiscalPerEnd10]) AS FiscalPeriodEnd10
   ,RTRIM([FiscalPerEnd11]) AS FiscalPeriodEnd11
   ,RTRIM([FiscalPerEnd12]) AS FiscalPeriodEnd12
   ,RTRIM([LedgerID])		AS LedgerId
   ,[NbrPer]				AS NumberOfPeriods
   ,RTRIM([PerNbr])			AS CurrentFiscalPeriod
   ,RTRIM([RetEarnAcct])	AS RetainedEarningsAccount
   ,RTRIM([YtdNetIncAcct])	AS NetIncomeAccount
   ,LUpd_DateTime			AS LastUpdate
   ,GETUTCDATE()			AS ImportDate
FROM [SL].[GLSetup];