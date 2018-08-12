
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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.Vendor						  T
		INNER JOIN OdsStaging.SL.VendorDelete T2 ON RTRIM(T2.VendId) = T.VendorId;
END;