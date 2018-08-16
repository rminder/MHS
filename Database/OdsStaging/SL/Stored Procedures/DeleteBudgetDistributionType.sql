-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 15-August, 2018
-- Description: Delete rows from Ods.SL.BudgetDistributionType
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteBudgetDistributionType
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteBudgetDistributionType]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select DistType From OdsStaging.SL.Budget_Dist_TypeDelete Where IsOds = 1
		Except
		Select DistType From OdsStaging.SL.Budget_Dist_TypeDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.BudgetDistributionType T
		INNER JOIN CTE T2 ON RTRIM(T2.DistType) = T.DistributionType

END