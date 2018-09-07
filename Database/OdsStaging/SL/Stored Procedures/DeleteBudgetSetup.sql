-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 07-September, 2018
-- Description: Delete rows from Ods.SL.BudgetSetup
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteBudgetSetup
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteBudgetSetup]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		SELECT CpnyId, BudgetLedgerId FROM OdsStaging.SL.BUSetupDelete WHERE IsOds = 1
		EXCEPT
		SELECT CpnyId, BudgetLedgerId FROM OdsStaging.SL.BUSetupdelete WHERE IsOds = 0
	)

	DELETE T
	FROM Ods.SL.BudgetSetup T
		INNER JOIN CTE T2 ON RTRIM(T2.CpnyId) = T.CompanyId AND RTRIM(T2.BudgetLedgerId) = T.BudgetLedgerId

	SELECT @@ROWCOUNT
END