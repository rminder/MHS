CREATE VIEW SL.vwBudgetGroup
AS
SELECT
	[RowId]
   ,[Access]
   ,[BudgetSegment]
   ,[BudgetLedgerId]
   ,[BudgetYear]
   ,[CompanyId]
   ,[GroupId]
   ,[NoteId]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[BudgetGroup];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwBudgetGroup] TO [OdsUser]
    AS [dbo];

