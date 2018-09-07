CREATE VIEW [SL].[vwBuSetup]
AS
SELECT
	[AllowMasking]
   ,RTRIM([BudgetLedgerID]) AS BudgetLedgerId
   ,RTRIM([BudgetYear]) AS BudgetYear
   ,RTRIM([CpnyID]) AS CompanyId
   ,[CreateSubAccts] AS CreateSubaccounts
   ,RTRIM([Descr]) AS Description
   ,[Include13]
   ,[NumberSegments]
   ,[SubSeg00]
   ,[SubSeg01]
   ,[SubSeg02]
   ,[SubSeg03]
   ,[SubSeg04]
   ,[SubSeg05]
   ,[SubSeg06]
   ,[SubSeg07]
   ,RTRIM([SubSegMask00]) AS SubSegMask00
   ,RTRIM([SubSegMask01]) AS SubSegMask01
   ,RTRIM([SubSegMask02]) AS SubSegMask02
   ,RTRIM([SubSegMask03]) AS SubSegMask03
   ,RTRIM([SubSegMask04]) AS SubSegMask04
   ,RTRIM([SubSegMask05]) AS SubSegMask05
   ,RTRIM([SubSegMask06]) AS SubSegMask06
   ,RTRIM([SubSegMask07]) AS SubSegMask07
   ,[Type]
   ,[UseBdgtGroups] AS UseBudgetGroups
   ,[LUpd_DateTime]			AS LastUpdate
   ,GETUTCDATE()			AS ImportDate
FROM [SL].[BUSetup];