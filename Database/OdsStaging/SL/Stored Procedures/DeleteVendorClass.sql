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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.VendorClass T
		INNER JOIN OdsStaging.SL.VendClassDelete T2 ON RTRIM(T2.ClassID) = T.ClassId
END