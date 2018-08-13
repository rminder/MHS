

-- =================================================================
-- Author:		Randy Minder
-- Create date: 13-August, 2018
-- Description:	Get a summary of all history
--
-- Select * From dbo.GetHistorySummary( '8/10/2018', '8/11/2018')
-- =================================================================
CREATE FUNCTION [SL].[GetHistorySummary]
(	
	@StartDate DATETIME2, 
	@EndDate datetime2
)
RETURNS TABLE 
AS
RETURN 
(
SELECT 'Account' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.AccountGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'AccountHistory' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.AccountHistoryGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'AccountsPayableDocument' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.AccountsPayableDocumentGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'AccountsPayableTransaction' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.AccountsPayableTransactionGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'AccountsReceivableDocument' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.AccountsReceivableDocumentGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'AccountsReceivableTransaction' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.AccountsReceivableTransactionGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'Customer' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.CustomerGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'CustomerClass' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.CustomerClassGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'GeneralLedgerSetup' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.GeneralLedgerSetupGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'GeneralLedgerTransaction' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.GeneralLedgerTransactionGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'Ledger' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.LedgerGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'Salesperson' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.SalespersonGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'SegmentDefintion' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.SegmentDefinitionGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'Subaccount' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.SubaccountGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'Vendor' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.VendorGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'VendorClass' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.VendorClassGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

UNION

SELECT 'Budget' AS [Table], __Operation AS [Operation], CONVERT(DATE,__OperationDate) AS [OperationDate], COUNT(*) AS [OperationCount]
FROM SL.BudgetGetHistory(@StartDate,@EndDate)
GROUP BY __Operation, CONVERT(DATE,__OperationDate)

)