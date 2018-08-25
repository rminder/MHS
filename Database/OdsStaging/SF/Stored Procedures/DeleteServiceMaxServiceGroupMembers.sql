-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 25-August, 2018
-- Description: Delete rows from Ods.SL.ServiceMaxServiceGroupMembersDetail
--		that are contained in OdsStaging.SL.ServiceMaxServiceGroupMembersDetail.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteServiceMaxServiceGroupMembers
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteServiceMaxServiceGroupMembers]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.ServiceMaxServiceGroupMembers
		Except
		Select Id FROM SF.SVMXC__Service_Group_Members__cDelete
	)

	DELETE T
	FROM Ods.SF.ServiceMaxServiceGroupMembers T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END