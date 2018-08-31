

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 11-Aug, 2018
-- Description: Delete rows from Ods.SL.VendorClass
--		that are contained in OdsStaging.SL.VendorClass.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteVendorClass]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select ClassId From OdsStaging.SL.VendClassDelete Where IsOds = 1
		Except
		Select ClassId From OdsStaging.SL.VendClassDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.VendorClass T
		INNER JOIN CTE T2 ON RTRIM(T2.ClassID) = T.ClassId

	SELECT @@ROWCOUNT
END