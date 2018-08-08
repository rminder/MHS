

-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 24-July, 2018
-- Description: Delete rows from Ods.SL.AccountHistory
--		that are contained in OdsStaging.SL.AccountHistory.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteAccountHistory
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteAccountHistory]
AS

BEGIN
    SET NOCOUNT ON

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
DELETE T
FROM Ods.SL.AccountHistory					T
	INNER JOIN OdsStaging.SL.AcctHistDelete T2 ON RTRIM(T2.CpnyID)		 = T.CompanyId
												  AND RTRIM(T2.Acct)	 = T.Account
												  AND RTRIM(T2.Sub)		 = T.SubaccountId
												  AND RTRIM(T2.LedgerID) = T.LedgerId
												  AND RTRIM(T2.FiscYr)	 = T.FiscalYear;
END
