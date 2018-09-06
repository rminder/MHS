-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 04-September, 2018
-- Description: Delete rows from Ods.SL.User
--		that are contained in OdsStaging.SL.User.
--
-- User: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteUser
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteUser]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.[User]
		Except
		Select Id FROM SF.UserDelete
	)

	DELETE T
	FROM Ods.SF.[User] T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END