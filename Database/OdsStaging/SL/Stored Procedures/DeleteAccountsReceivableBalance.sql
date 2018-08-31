
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 15-August, 2018
-- Description: Delete rows from Ods.SL.AccountsReceivableBalance
--		that are contained in OdsStaging.SL.AccountsReceivableBalance.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsReceivableBalance
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountsReceivableBalance]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CpnyId, CustId From OdsStaging.SL.AR_BalancesDelete Where IsOds = 1
		Except
		Select CpnyId, CustId From OdsStaging.SL.AR_BalancesDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsReceivableBalance T
		INNER JOIN CTE T2 ON RTRIM(T2.CustId) = T.CustomerId And RTRIM(T2.CpnyId) = T.CompanyId;

	SELECT @@ROWCOUNT
END;