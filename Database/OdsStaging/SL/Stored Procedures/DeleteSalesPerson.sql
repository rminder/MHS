

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 9-August, 2018
-- Description: Delete rows from Ods.SL.SalesPerson
--		that are contained in OdsStaging.SL.SalesPerson.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteSalesPerson
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteSalesPerson]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select SlsperId From OdsStaging.SL.SalespersonDelete Where IsOds = 1
		Except
		Select SlsperId From OdsStaging.SL.SalespersonDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.Salesperson	T
		INNER JOIN CTE T2 ON RTRIM(T2.SlsperId) = T.SalesPersonId;

	SELECT @@ROWCOUNT
END;