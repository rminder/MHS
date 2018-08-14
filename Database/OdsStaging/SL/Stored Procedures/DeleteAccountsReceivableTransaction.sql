
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

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CustId, LineNbr, RecordId, RefNbr, TranType From OdsStaging.SL.ARTranDelete Where IsOds = 1
		Except
		Select CustId, LineNbr, RecordId, RefNbr, TranType From OdsStaging.SL.ARTranDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsReceivableTransaction T
		INNER JOIN CTE T2 ON RTRIM(T2.CustId) = T.CustomerId AND T2.LineNbr = T.LineNumber AND T2.RecordId = T.RecordId AND T2.RefNbr = T.TransactionReferenceNumber AND RTrim(T2.TranType) = T.TransactionType
END