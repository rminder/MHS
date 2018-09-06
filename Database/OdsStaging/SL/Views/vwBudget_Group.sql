CREATE VIEW SL.vwBudget_Group
AS
SELECT
	[Access]
   ,RTRIM([BdgtSegment])	AS BudgetSegment
   ,RTRIM([BudgetLedgerID]) AS BudgetLedgerId
   ,RTRIM([BudgetYear])		AS BudgetYear
   ,RTRIM([CpnyID])			AS CompanyId
   ,RTRIM([GroupID])		AS GroupId
   ,RTRIM([NoteID])			AS NoteId
   ,[LUpd_DateTime]			AS LastUpdate
   ,GETUTCDATE()			AS ImportDate
FROM [SL].[Budget_Group];