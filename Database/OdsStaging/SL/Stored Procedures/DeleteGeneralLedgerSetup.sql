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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.GeneralLedgerSetup			   T
		INNER JOIN OdsStaging.SL.GLSetupDelete T2 ON RTRIM(T2.SetupId) = T.SetupId;
END;