
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 28-August, 2018
-- Description: Delete rows from Ods.SL.Product2
--		that are contained in OdsStaging.SL.Product2.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteProduct2
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteProduct2]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.Product2
		Except
		Select Id FROM SF.Product2Delete
	)

	DELETE T
	FROM Ods.SF.Product2 T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END