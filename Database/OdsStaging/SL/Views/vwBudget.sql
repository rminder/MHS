Create View SL.vwBudget AS

SELECT 
	 RTRIM([ActualLedgerID]) as ActualLedgerId
	,RTRIM([BdgtSegment]) as BudgetSegment
	,[BeginDate] as BeginDate
	,RTRIM([BudgetLedgerID]) as BudgetLedgerId
	,RTRIM([BudgetYear]) as BudgetYear
	,RTRIM([CpnyID]) as CompanyId
	,[EndDate]
	,RTRIM([NoteID]) as NoteId
	,RTRIM([ShortDescr]) as ShortDescription
   ,[LUpd_DateTime] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SL].[Budget]