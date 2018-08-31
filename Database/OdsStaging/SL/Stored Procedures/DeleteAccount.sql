


-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 24-July, 2018
-- Description: Delete rows from Ods.SL.Account
--		that are contained in OdsStaging.SL.Account.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccount]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Acct From OdsStaging.SL.AccountDelete Where IsOds = 1
		Except
		Select Acct From OdsStaging.SL.AccountDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.Account T
		INNER JOIN CTE T2 ON RTRIM(T2.Acct) = T.Account

	SELECT @@ROWCOUNT
END
