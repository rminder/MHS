
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 13-August, 2018
-- Description: Delete rows from Ods.SL.Budget
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteBudget
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteBudget]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CpnyId, BudgetYear, BudgetLedgerId, BdgtSegment From OdsStaging.SL.BudgetDelete Where IsOds = 1
		Except
		Select CpnyId, BudgetYear, BudgetLedgerId, BdgtSegment From OdsStaging.SL.BudgetDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.Budget T
		INNER JOIN CTE T2 ON RTRIM(T2.CpnyId) = T.CompanyId
											AND RTRIM(T2.BudgetYear)		= T.BudgetYear
											AND RTRIM(T2.BudgetLedgerId)	= T.BudgetLedgerId
											AND RTRIM(T2.BdgtSegment)		= T.BudgetSegment;

END