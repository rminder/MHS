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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.Salesperson						   T
		INNER JOIN OdsStaging.SL.SalespersonDelete T2 ON RTRIM(T2.SlsperId) = T.SalesPersonId;
END;