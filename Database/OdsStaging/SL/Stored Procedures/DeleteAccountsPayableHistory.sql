-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 16-August, 2018
-- Description: Delete rows from Ods.SL.AccountsPayableHistory
--		that are contained in OdsStaging.SL.AccountsPayableHistory.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsPayableHistory
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountsPayableHistory]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CpnyId, VendId, FiscYr From OdsStaging.SL.APHistDelete Where IsOds = 1
		Except
		Select CpnyId, VendId, FiscYr From OdsStaging.SL.APHistDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsPayableHistory T
		INNER JOIN CTE T2 ON RTRIM(T2.VendId) = T.VendorId And RTRIM(T2.CpnyId) = T.CompanyId And RTRIM(T2.FiscYr) = T.FiscalYear
END;