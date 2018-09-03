-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 3-Sept, 2018
-- Description: Delete rows from Ods.SL.ServiceMaxRmaShipmentLine
--		that are contained in OdsStaging.SL.ServiceMaxRmaShipmentLine.
--
-- ServiceMaxRmaShipmentLine: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteServiceMaxRmaShipmentLine
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteServiceMaxRmaShipmentLine]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.ServiceMaxRmaShipmentLine
		Except
		Select Id FROM SF.SVMXC__RMA_Shipment_Line__cDelete
	)

	DELETE T
	FROM Ods.SF.ServiceMaxRmaShipmentLine T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END