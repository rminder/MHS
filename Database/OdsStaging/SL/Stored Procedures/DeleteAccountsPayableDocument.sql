-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 5-Aug, 2018
-- Description: Delete rows from Ods.SL.AccountsPayableDocument
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsPayableDocument
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountsPayableDocument]
AS

BEGIN
    SET NOCOUNT ON

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.AccountsPayableDocument T
		INNER JOIN OdsStaging.SL.APDocDelete T2 ON RTRIM(T2.DocType) = T.DocumentType AND RTRIM(T2.Acct) = T.Account AND RTRIM(T2.Sub) = T.SubaccountId AND RTRIM(T2.RefNbr) = T.TransactionReferenceNumber AND T2.RecordId = T.RecordId
END