CREATE VIEW SL.vwBudgetSetup
AS
SELECT
	[RowId]
   ,[AllowMasking]
   ,[BudgetLedgerId]
   ,[BudgetYear]
   ,[CompanyId]
   ,[CreateSubaccounts]
   ,[Description]
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
   ,[SubSegMask00]
   ,[SubSegMask01]
   ,[SubSegMask02]
   ,[SubSegMask03]
   ,[SubSegMask04]
   ,[SubSegMask05]
   ,[SubSegMask06]
   ,[SubSegMask07]
   ,[Type]
   ,[UseBudgetGroups]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[BudgetSetup];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwBudgetSetup] TO [OdsUser]
    AS [dbo];

