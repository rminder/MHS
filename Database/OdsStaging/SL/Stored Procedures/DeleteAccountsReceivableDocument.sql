-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 9-Aug, 2018
-- Description: Delete rows from Ods.SL.AccountsReceivableDocument
--		that are contained in OdsStaging.SL.GlTranDelete.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountsReceivableDocument
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountsReceivableDocument]
AS
BEGIN
	SET NOCOUNT ON;

	-- Find rows coming from ODS that don't exist in the non-Ods source and remove them from Ods.
	;WITH CTE AS
	(
		Select CustId, DocType, RefNbr, BatNbr, BatSeq From OdsStaging.SL.ARDocDelete Where IsOds = 1
		Except
		Select CustId, DocType, RefNbr, BatNbr, BatSeq From OdsStaging.SL.ARDocDelete Where IsOds = 0
	)

	DELETE T
	FROM Ods.SL.AccountsReceivableDocument	    T
		INNER JOIN CTE T2 ON RTRIM(T2.CustId) = T.CustomerId
												AND RTRIM(T2.DocType) = T.DocumentType
												AND RTRIM(T2.RefNbr)  = T.TransactionReferenceNumber
												AND RTRIM(T2.BatNbr)  = T.BatchNumber
												AND T2.BatSeq		  = T.BatchSequence;

	SELECT @@ROWCOUNT
END;