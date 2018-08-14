
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 7-August, 2018
-- Description: Delete rows from Ods.SL.GeneralLedgerSetup
--		that are contained in OdsStaging.SL.GeneralLedgerSetup.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerSetup
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteGeneralLedgerSetup]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select SetupId From OdsStaging.SL.GLSetupDelete Where IsOds = 1
		Except
		Select SetupId From OdsStaging.SL.GLSetupDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.GeneralLedgerSetup			   T
		INNER JOIN CTE T2 ON RTRIM(T2.SetupId) = T.SetupId;
END;