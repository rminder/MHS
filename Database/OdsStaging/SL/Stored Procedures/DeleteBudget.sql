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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.Budget T
		INNER JOIN OdsStaging.SL.BudgetDelete T2 ON RTRIM(T2.CpnyId) = T.CompanyId And RTRIM(T2.BudgetYear) = T.BudgetYear And RTRIM(T2.BudgetLedgerId) = T.BudgetLedgerId And RTRIM(BdgtSegment) = T.BudgetSegment
END