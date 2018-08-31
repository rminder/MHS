

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 13-August, 2018
-- Description: Delete rows from Ods.SL.AccountsPayableBalance
--		that are contained in OdsStaging.SL.AccountsPayableBalance.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsPayableBalance
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountsPayableBalance]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CpnyId, VendId From OdsStaging.SL.AP_BalancesDelete Where IsOds = 1
		Except
		Select CpnyId, VendId From OdsStaging.SL.AP_BalancesDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsPayableBalance T
		INNER JOIN CTE T2 ON RTRIM(T2.VendId) = T.VendorId And RTRIM(T2.CpnyId) = T.CompanyId;

	SELECT @@ROWCOUNT
END;