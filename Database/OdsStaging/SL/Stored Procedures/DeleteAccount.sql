
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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.Account T
		INNER JOIN OdsStaging.SL.AccountDelete T2 ON RTRIM(T2.Acct) = T.Account
END
