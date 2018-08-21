


CREATE VIEW [dbo].[dModules]
AS
SELECT 'AL' AS 'ID', 'Allocator' AS 'Value' 
UNION ALL
SELECT 'AN' AS 'ID', 'Advanced Shipment Management' AS 'Value' 
UNION ALL
SELECT 'AP' AS 'ID', 'Accounts Payable' AS 'Value' 
UNION ALL
SELECT 'AS' AS 'ID', 'Application Server' AS 'Value' 
UNION ALL
SELECT 'BC' AS 'ID', 'Bar Code Printing' AS 'Value' 
UNION ALL
SELECT 'BI' AS 'ID', 'Flexible Billings' AS 'Value' 
UNION ALL
SELECT 'BM' AS 'ID', 'Bill of Material' AS 'Value' 
UNION ALL
SELECT 'BR' AS 'ID', 'Bank Reconciliation' AS 'Value' 
UNION ALL
SELECT 'BU' AS 'ID', 'Project Budgeting' AS 'Value' 
UNION ALL
SELECT 'CA' AS 'ID', 'Cash Manager' AS 'Value' 
UNION ALL
SELECT 'CI' AS 'ID', 'Custom Item Configurator' AS 'Value' 
UNION ALL
SELECT 'CM' AS 'ID', 'Currency Manager' AS 'Value' 
UNION ALL
SELECT 'CN' AS 'ID', 'Contract Management' AS 'Value' 
UNION ALL
SELECT 'CO' AS 'ID', 'Communicator' AS 'Value' 
UNION ALL
SELECT 'CS' AS 'ID', 'Commission and Rebate Management' AS 'Value' 
UNION ALL
SELECT 'DR' AS 'ID', 'Drafts Processing' AS 'Value' 
UNION ALL
SELECT 'EF' AS 'ID', 'Electronic Funds Transfer' AS 'Value' 
UNION ALL
SELECT 'GL' AS 'ID', 'General Ledger' AS 'Value' 
UNION ALL
SELECT 'IQ' AS 'ID', 'Analyzer' AS 'Value' 
UNION ALL
SELECT 'IR' AS 'ID', 'Inventory Replenishment' AS 'Value' 
UNION ALL
SELECT 'IV' AS 'ID', 'Inventory' AS 'Value' 
UNION ALL
SELECT 'KM' AS 'ID', 'Knowledge Management' AS 'Value' 
UNION ALL
SELECT 'LC' AS 'ID', 'Landed Cost' AS 'Value' 
UNION ALL
SELECT 'MC' AS 'ID', 'Multi Company' AS 'Value' 
UNION ALL
SELECT 'MR' AS 'ID', 'Materials Requirements Planning' AS 'Value' 
UNION ALL
SELECT 'OM' AS 'ID', 'Order Management' AS 'Value' 
UNION ALL
SELECT 'OS' AS 'ID', 'Order Management Plus' AS 'Value' 
UNION ALL
SELECT 'OU' AS 'ID', 'Orders to Purchase' AS 'Value' 
UNION ALL
SELECT 'PA' AS 'ID', 'Project Controller' AS 'Value' 
UNION ALL
SELECT 'PM' AS 'ID', 'Project Management' AS 'Value' 
UNION ALL
SELECT 'PO' AS 'ID', 'Purchasing' AS 'Value' 
UNION ALL
SELECT 'PP' AS 'ID', 'Requisitions Management' AS 'Value' 
UNION ALL
SELECT 'PR' AS 'ID', 'Payroll' AS 'Value' 
UNION ALL
SELECT 'RM' AS 'ID', 'Resource Management' AS 'Value' 
UNION ALL
SELECT 'RQ' AS 'ID', 'Requisitions' AS 'Value' 
UNION ALL
SELECT 'SB' AS 'ID', 'Rental Billing and Tracking' AS 'Value' 
UNION ALL
SELECT 'SC' AS 'ID', 'Service Commissions' AS 'Value' 
UNION ALL
SELECT 'SD' AS 'ID', 'Service Dispatch' AS 'Value' 
UNION ALL
SELECT 'SE' AS 'ID', 'Equpment Maintenance' AS 'Value' 
UNION ALL
SELECT 'SF' AS 'ID', 'Shipment Manifesting Plus' AS 'Value' 
UNION ALL
SELECT 'SH' AS 'ID', 'Shipment Manifesting' AS 'Value' 
UNION ALL
SELECT 'SN' AS 'ID', 'Service Contracts' AS 'Value' 
UNION ALL
SELECT 'SP' AS 'ID', 'Flat Rate Pricing' AS 'Value' 
UNION ALL
SELECT 'TL' AS 'ID', 'Time and Billing' AS 'Value' 
UNION ALL
SELECT 'TM' AS 'ID', 'Time and Expense for Projects' AS 'Value' 
UNION ALL
SELECT 'UZ' AS 'ID', 'Employee Utilization' AS 'Value' 
UNION ALL
SELECT 'VP' AS 'ID', 'Advanced Payroll' AS 'Value' 
UNION ALL
SELECT 'WC' AS 'ID', 'Web Order' AS 'Value' 
UNION ALL
SELECT 'WH' AS 'ID', 'Warehouse Management' AS 'Value' 
UNION ALL
SELECT 'WX' AS 'ID', 'Web Commerce' AS 'Value' 
UNION ALL
SELECT 'AR' AS 'ID', 'Accounts Receivable' AS 'Value' 

UNION ALL
SELECT DISTINCT a.[Module] AS 'ID', 'n/a' AS 'Value'

FROM [SL].[GeneralLedgerTransaction] a 
WHERE a.[module] NOT IN (
'AL', 
'AN', 
'AP', 
'AS', 
'BC', 
'BI', 
'BM', 
'BR', 
'BU', 
'CA', 
'CI', 
'CM', 
'CN',
'CO', 
'CS', 
'DR', 
'EF', 
'GL', 
'IQ', 
'IR', 
'IV', 
'KM', 
'LC', 
'MC', 
'MR',
'OM', 
'OS', 
'OU', 
'PA', 
'PM', 
'PO',
'PP', 
'PR', 
'RM', 
'RQ', 
'SB', 
'SC', 
'SD', 
'SE', 
'SF', 
'SH', 
'SN', 
'SP', 
'TL', 
'TM', 
'UZ', 
'VP', 
'WC', 
'WH', 
'WX', 
'AR') AND JournalType <>'BB';
GO



GO


