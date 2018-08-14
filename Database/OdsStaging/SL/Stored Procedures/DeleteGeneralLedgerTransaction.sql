
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 21-July, 2018
-- Description: Delete rows from Ods.SL.GeneralLedgerTransaction
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteGeneralLedgerTransaction]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select BatNbr, LineNbr, Module From OdsStaging.SL.GLTranDelete Where IsOds = 1
		Except
		Select BatNbr, LineNbr, Module From OdsStaging.SL.GLTranDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.GeneralLedgerTransaction T
		INNER JOIN CTE T2 ON RTRIM(T2.BatNbr) = T.BatchNumber AND RTRIM(T2.LineNbr) = T.LineNumber AND RTRIM(T2.Module) = T.Module
END
