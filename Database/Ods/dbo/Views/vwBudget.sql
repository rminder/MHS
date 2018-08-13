Create View dbo.vwBudget AS

SELECT 
	 [RowId]
	,[ActualLedgerId]
	,[BudgetSegment]
	,[BeginDate]
	,[BudgetLedgerId]
	,[BudgetYear]
	,[CompanyId]
	,[EndDate]
	,[NoteId]
	,[ShortDescription]
	,[LastUpdate]
	,[ImportDate]
	,[ValidFrom]
	,[ValidTo]
FROM [SL].[Budget]