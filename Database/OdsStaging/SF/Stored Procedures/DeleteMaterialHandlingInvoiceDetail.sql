
-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 19-August, 2018
-- Description: Delete rows from Ods.SL.MaterialHandlingInvoiceDetail
--		that are contained in OdsStaging.SL.MaterialHandlingInvoiceDetail.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteMaterialHandlingInvoiceDetail]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.MaterialHandlingInvoiceDetail
		Except
		Select Id FROM SF.MH_Invoice_Details__cDelete
	)

	DELETE T
	FROM Ods.SF.MaterialHandlingInvoiceDetail T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END