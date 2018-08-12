
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

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.AccountsReceivableDocument	 T
		INNER JOIN OdsStaging.SL.ARDocDelete T2 ON RTRIM(T2.CustId)		 = T.CustomerId
												   AND RTRIM(T2.DocType) = T.DocumentType
												   AND RTRIM(T2.RefNbr)	 = T.TransactionReferenceNumber
												   AND RTRIM(T2.BatNbr)	 = T.BatchNumber
												   AND T2.BatSeq		 = T.BatchSequence;
END;