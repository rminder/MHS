


-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 9-August, 2018
-- Description: Delete rows from Ods.SL.Vendor
--		that are contained in OdsStaging.SL.Vendor.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteVendor
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteVendor]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select VendId From OdsStaging.SL.VendorDelete Where IsOds = 1
		Except
		Select VendId From OdsStaging.SL.VendorDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.Vendor						  T
		INNER JOIN CTE T2 ON RTRIM(T2.VendId) = T.VendorId;

	SELECT @@ROWCOUNT
END;