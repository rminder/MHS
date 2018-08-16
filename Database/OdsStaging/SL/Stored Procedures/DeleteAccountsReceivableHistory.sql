-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 16-August, 2018
-- Description: Delete rows from Ods.SL.AccountsReceivableHistory
--		that are contained in OdsStaging.SL.AccountsReceivableHistory.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsReceivableHistory
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountsReceivableHistory]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CpnyId, CustId, FiscYr From OdsStaging.SL.ARHistDelete Where IsOds = 1
		Except
		Select CpnyId, CustId, FiscYr From OdsStaging.SL.ARHistDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsReceivableHistory T
		INNER JOIN CTE T2 ON RTRIM(T2.CustId) = T.CustomerId And RTRIM(T2.CpnyId) = T.CompanyId And RTRIM(T2.FiscYr) = T.FiscalYear
END;