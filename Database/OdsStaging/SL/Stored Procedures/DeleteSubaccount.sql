-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 11-Aug, 2018
-- Description: Delete rows from Ods.SL.Subaccount
--		that are contained in OdsStaging.SL.Subaccount.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteGeneralLedgerTransaction
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteSubaccount]
AS

BEGIN
    SET NOCOUNT ON

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.Subaccount T
		INNER JOIN OdsStaging.SL.SubAcctDelete T2 ON RTRIM(T2.Sub) = T.SubaccountId
END