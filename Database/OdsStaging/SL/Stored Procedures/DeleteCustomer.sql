

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 8-August, 2018
-- Description: Delete rows from Ods.SL.Customer
--		that are contained in OdsStaging.SL.Customer.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteCustomer
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteCustomer]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CustId From OdsStaging.SL.CustomerDelete Where IsOds = 1
		Except
		Select CustId From OdsStaging.SL.CustomerDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.Customer						T
		INNER JOIN CTE T2 ON RTRIM(T2.CustId) = T.CustomerId;

	SELECT @@ROWCOUNT
END;