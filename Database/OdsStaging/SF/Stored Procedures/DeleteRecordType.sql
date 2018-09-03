-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 31-August, 2018
-- Description: Delete rows from Ods.SL.RecordType
--		that are contained in OdsStaging.SL.RecordType.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteRecordType
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteRecordType]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.RecordType
		Except
		Select Id FROM SF.RecordTypeDelete
	)

	DELETE T
	FROM Ods.SF.RecordType T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END