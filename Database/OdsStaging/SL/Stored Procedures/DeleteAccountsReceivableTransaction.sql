-- ====================================================================
-- Author:      Randy Minder
-- Create Date: 2-Aug, 2018
-- Description: Delete rows from Ods.SL.AccountsReceivableTransaction
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsReceivableTransaction
-- ====================================================================
CREATE PROCEDURE [SL].[DeleteAccountsReceivableTransaction]
AS

BEGIN
    SET NOCOUNT ON

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.AccountsReceivableTransaction T
		INNER JOIN OdsStaging.SL.ARTranDelete T2 ON RTRIM(T2.CustId) = T.CustomerId AND T2.LineNbr = T.LineNumber AND T2.RecordId = T.RecordId AND T2.RefNbr = T.TransactionReferenceNumber AND RTrim(T2.TranType) = T.TransactionType
END