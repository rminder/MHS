-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 18-August, 2018
-- Description: Delete rows from Ods.SL.MaterialHandlingInvoice
--		that are contained in OdsStaging.SL.MaterialHandlingInvoice.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteMaterialHandlingInvoice]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.MaterialHandlingInvoice
		Except
		Select Id FROM SF.MH_Invoice__cDelete
	)

	DELETE T
	FROM Ods.SF.MaterialHandlingInvoice T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END