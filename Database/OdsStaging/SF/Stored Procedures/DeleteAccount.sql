-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 05-September, 2018
-- Description: Delete rows from Ods.SL.Account
--		that are contained in OdsStaging.SL.Account.
--
-- Account: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccount
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteAccount]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.Account
		Except
		Select Id FROM SF.AccountDelete
	)

	DELETE T
	FROM Ods.SF.Account T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END