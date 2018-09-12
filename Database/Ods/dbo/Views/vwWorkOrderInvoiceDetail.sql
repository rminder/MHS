CREATE VIEW [dbo].[vwWorkOrderInvoiceDetail]
AS
SELECT
	T4.Id			AS InvoiceId
   ,T2.Id			AS WorkOrderId
   ,T2.Name
   ,T2.CreatedDate
   ,T2.Salesperson2ndWorkOrder
   ,T2.SalespersonWorkOrder
   ,T2.ServiceMaxGroupMember
   ,T2.ServiceMaxOrderStatus
   ,T2.ServiceMaxOrderType
   ,T2.ServiceMaxSite
   ,T2.ServiceMaxCompany
   ,T.Name			AS WorkOrderLineName
   ,T.ActivityType
   ,T.LineType
   ,T.LineStatus
   ,T.BillableQuantity
   ,T.InventoryLineQuantity
   ,T.ActualQuantity2
   ,T.VendorCostPerUnit
   ,T.TotalCost
   ,T.CreatedDate	AS WorkOrderLineCreated
   ,T4.CreatedDate	AS InvoiceCreated
   ,T4.Account
   ,T4.ServiceTeam
   ,T4.Status
   ,T4.Name			AS InvoiceName
   ,T4.Location
   ,T4.Segment
   ,T4.SlInvoiceDate
   ,T4.WorkOrderType
   ,T3.CreatedDate	AS InvoiceDetailCreated
   ,T3.Name			AS InvoiceDetailname
   ,T3.LineType		AS InvoiceDetailLineType
   ,T3.LineQuantity
   ,T3.InvoiceStatus
   ,T3.ActivityType AS InvoiceDetailActivityType
   ,T3.TotalLinePrice
   ,T3.SalesTax
FROM SF.ServiceMaxServiceOrderLine				T
	INNER JOIN SF.ServiceMaxServiceOrder		T2 ON T.ServiceOrder = T2.Id
	INNER JOIN SF.MaterialHandlingInvoiceDetail T3 ON T.Id			 = T3.WorkDetail
	INNER JOIN SF.MaterialHandlingInvoice		T4 ON T3.Invoice	 = T4.Id;
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwWorkOrderInvoiceDetail';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[46] 2[10] 3) )"
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
         Begin Table = "MaterialHandlingInvoiceDetail (SF)"
            Begin Extent = 
               Top = 2
               Left = 388
               Bottom = 422
               Right = 710
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MaterialHandlingInvoice (SF)"
            Begin Extent = 
               Top = 17
               Left = 20
               Bottom = 415
               Right = 300
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ServiceMaxServiceOrder (SF)"
            Begin Extent = 
               Top = 0
               Left = 1146
               Bottom = 406
               Right = 1507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceMaxServiceOrderLine (SF)"
            Begin Extent = 
               Top = 43
               Left = 810
               Bottom = 421
               Right = 1110
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2205
         Alias = 2835
         Table = 3285
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwWorkOrderInvoiceDetail';

