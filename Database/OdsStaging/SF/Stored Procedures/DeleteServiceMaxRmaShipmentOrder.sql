-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 1-Sept, 2018
-- Description: Delete rows from Ods.SL.ServiceMaxRmaShipmentOrder
--		that are contained in OdsStaging.SL.ServiceMaxRmaShipmentOrder.
--
-- ServiceMaxRmaShipmentOrder: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteServiceMaxRmaShipmentOrder
-- ===============================================================
CREATE PROCEDURE [SF].[DeleteServiceMaxRmaShipmentOrder]
AS

BEGIN
    SET NOCOUNT ON

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Id From Ods.SF.ServiceMaxRmaShipmentOrder
		Except
		Select Id FROM SF.SVMXC__RMA_Shipment_Order__cDelete
	)

	DELETE T
	FROM Ods.SF.ServiceMaxRmaShipmentOrder T
		INNER JOIN CTE T2 ON T2.Id = T.Id

	Select @@ROWCOUNT
END