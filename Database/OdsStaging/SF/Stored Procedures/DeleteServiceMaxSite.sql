-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 25-August, 2018
-- Description: Delete rows from Ods.SL.ServiceMaxSiteDetail
--		that are contained in OdsStaging.SL.ServiceMaxSiteDetail.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteServiceMaxSite
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteServiceMaxSite]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.ServiceMaxSite
		Except
		Select Id FROM SF.SVMXC__Site___cDelete
	)

	DELETE T
	FROM Ods.SF.ServiceMaxSite T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END