-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 11-August, 2018
-- Description: Delete rows from Ods.SL.Ledger
--		that are contained in OdsStaging.SL.Ledger.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
-- 
-- Exec SL.DeleteLedger
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteLedger]
AS
BEGIN
	SET NOCOUNT ON;

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.Ledger					      T
		INNER JOIN OdsStaging.SL.LedgerDelete T2 ON RTRIM(T2.LedgerId) = T.LedgerId;
END;