

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 11-Aug, 2018
-- Description: Delete rows from Ods.SL.Subaccount
--		that are contained in OdsStaging.SL.Subaccount.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteSubaccount]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Sub From OdsStaging.SL.SubAcctDelete Where IsOds = 1
		Except
		Select Sub From OdsStaging.SL.SubAcctDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.Subaccount T
		INNER JOIN CTE T2 ON RTRIM(T2.Sub) = T.SubaccountId

	SELECT @@ROWCOUNT
END