
CREATE VIEW [SL].[vwBudget] AS

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
GO
GRANT SELECT
    ON OBJECT::[SL].[vwBudget] TO [OdsUser]
    AS [dbo];

