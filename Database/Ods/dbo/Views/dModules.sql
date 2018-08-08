
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
SELECT Distinct a.[Module] AS 'ID', 'n/a' AS 'Value'

FROM [fGLTran] a LEFT OUTER JOIN [dModules] b ON a.[Module] = b.[ID]

WHERE b.[ID] IS NULL ;
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dModules';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dModules';

