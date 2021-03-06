﻿-- ===============================================================
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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.CustomerClass					 T
		INNER JOIN OdsStaging.SL.CustClassDelete T2 ON RTRIM(T2.ClassId) = T.ClassId;
END;