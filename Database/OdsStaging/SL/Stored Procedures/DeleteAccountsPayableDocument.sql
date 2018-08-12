
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
		INNER JOIN OdsStaging.SL.APDocDelete T2 ON T2.Account = T.Account And T2.SubaccountId = T.SubaccountId And T2.DocumentType = T.DocumentType And T2.TransactionReferenceNumber = T.TransactionReferenceNumber AND T2.RecordId = T.RecordId
END