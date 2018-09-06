
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 06-September, 2018
-- Description: Delete rows from Ods.SL.BudgetGroup
--		that are contained in OdsStaging.SL.BudgetGroup.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteBudgetGroup]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select BdgtSegment, BudgetLedgerId, BudgetYear, CpnyId, GroupId From OdsStaging.SL.Budget_GroupDelete Where IsOds = 1
		Except
		Select BdgtSegment, BudgetLedgerId, BudgetYear, CpnyId, GroupId From OdsStaging.SL.Budget_GroupDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.BudgetGroup T
		INNER JOIN CTE T2 ON RTRIM(T2.BdgtSegment) = T.BudgetSegment AND RTRIM(T2.BudgetLedgerId) = T.BudgetLedgerId AND RTRIM(T2.BudgetYear) = T.BudgetYear AND RTRIM(T2.CpnyId) = T.CompanyId AND RTRIM(T2.GroupId) = T.GroupId

	SELECT @@ROWCOUNT
END