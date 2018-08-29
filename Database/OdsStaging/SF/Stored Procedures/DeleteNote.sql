-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 28-August, 2018
-- Description: Delete rows from Ods.SL.Note
--		that are contained in OdsStaging.SL.Note.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteNote
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteNote]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.Note
		Except
		Select Id FROM SF.NoteDelete
	)

	DELETE T
	FROM Ods.SF.Note T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END