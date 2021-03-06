﻿Create View SL.vwBudgetDistributionType As

SELECT 
	 [RowId]
	,[DistributionType]
	,[Description]
	,[NoteId]
	,[BudgetPercent00]
	,[BudgetPercent01]
	,[BudgetPercent02]
	,[BudgetPercent03]
	,[BudgetPercent04]
	,[BudgetPercent05]
	,[BudgetPercent06]
	,[BudgetPercent07]
	,[BudgetPercent08]
	,[BudgetPercent09]
	,[BudgetPercent10]
	,[BudgetPercent11]
	,[BudgetPercentTotal]
	,[LastUpdate]
	,[ImportDate]
FROM [SL].[BudgetDistributionType]
GO
GRANT SELECT
    ON OBJECT::[SL].[vwBudgetDistributionType] TO [OdsUser]
    AS [dbo];

