
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 27-August, 2018
-- Description: Delete rows from Ods.SL.ServiceMaxOrderLineDetail
--		that are contained in OdsStaging.SL.ServiceMaxOrderLineDetail.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteServiceMaxOrderLine
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteServiceMaxOrderLine]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.ServiceMaxServiceOrderLine
		Except
		Select Id FROM SF.SVMXC__Service_Order_Line__cDelete
	)

	DELETE T
	FROM Ods.SF.ServiceMaxServiceOrderLine T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END