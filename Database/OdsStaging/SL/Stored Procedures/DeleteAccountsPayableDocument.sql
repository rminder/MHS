

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

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select Account, SubaccountId, DocumentType, TransactionReferenceNumber, RecordId From OdsStaging.SL.APDocDelete Where IsOds = 1
		Except
		Select Account, SubaccountId, DocumentType, TransactionReferenceNumber, RecordId From OdsStaging.SL.APDocDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsPayableDocument T
		INNER JOIN CTE T2 ON T2.Account = T.Account And T2.SubaccountId = T.SubaccountId And T2.DocumentType = T.DocumentType And T2.TransactionReferenceNumber = T.TransactionReferenceNumber AND T2.RecordId = T.RecordId
END