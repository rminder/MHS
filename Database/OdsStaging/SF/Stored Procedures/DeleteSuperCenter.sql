-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 30-August, 2018
-- Description: Delete rows from Ods.SL.SuperCenter
--		that are contained in OdsStaging.SL.SuperCenter.
--
-- SuperCenter: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteSuperCenter
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteSuperCenter]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.SuperCenter
		Except
		Select Id FROM SF.Super_Center__cDelete
	)

	DELETE T
	FROM Ods.SF.SuperCenter T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END