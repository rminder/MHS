

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 8-August, 2018
-- Description: Delete rows from Ods.SL.CustomerClass
--		that are contained in OdsStaging.SL.CustomerClass.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteCustomerClass
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteCustomerClass]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select ClassId From OdsStaging.SL.CustClassDelete Where IsOds = 1
		Except
		Select ClassId From OdsStaging.SL.CustClassDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.CustomerClass					 T
		INNER JOIN CTE T2 ON RTRIM(T2.ClassId) = T.ClassId;

	SELECT @@ROWCOUNT
END;