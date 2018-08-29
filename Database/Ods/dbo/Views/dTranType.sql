

CREATE VIEW [dbo].[dTranType]
AS
SELECT DISTINCT
	   CASE
		   WHEN TransactionType = '' THEN 'n/a'
		   ELSE TransactionType
	   END AS 'ID'
FROM SL.GeneralLedgerTransaction
  WHERE   [BalanceType] = 'A' AND [Released] = 1
  AND  [CompanyId] IN (SELECT CompanyId FROM SL.Company WHERE IsActive = 1)


UNION

SELECT DISTINCT
	   CASE
		   WHEN TransactionType = '' THEN 'n/a'
		   ELSE TransactionType
	   END AS 'ID'
FROM SL.AccountsPayableTransaction a  WITH(NOLOCK) LEFT JOIN 
[SL].[AccountsPayableDocument] b  WITH(NOLOCK) ON
  a.BatchNumber = b.BatchNumber
 AND a.TransactionReferenceNumber = b.TransactionReferenceNumber
 AND a.VendorId = b.VendorId
 WHERE a.[Released] = 1
  AND ((a.[TransactionType] = 'CK' AND a.DebitOrCredit = 'C') OR
 (a.[TransactionType] = 'HC' AND a.DebitOrCredit = 'C') OR
 (a.[TransactionType] = 'PP' AND a.DebitOrCredit = 'D') OR
 (a.[TransactionType] = 'VC' AND a.DebitOrCredit = 'D') OR
 (a.[TransactionType] = 'AC' AND a.DebitOrCredit = 'D') OR
 (a.[TransactionType] = 'AD' AND a.DebitOrCredit = 'C') OR
 (a.[TransactionType] = 'VO' AND a.DebitOrCredit = 'D') OR
 (a.[TransactionType] = 'DT'))
 AND b.TransactionReferenceNumber IS NOT NULL
 AND a.[CompanyId] IN (SELECT CompanyId FROM SL.Company WHERE IsActive = 1)

UNION

SELECT DISTINCT
	   CASE
		   WHEN TransactionType = '' THEN 'n/a'
		   ELSE TransactionType
	   END AS 'ID'
FROM SL.AccountsReceivableTransaction a  WITH(NOLOCK) LEFT JOIN [SL].[AccountsReceivableDocument] b WITH(NOLOCK) 
  ON a.BatchNumber = b.BatchNumber 
  AND a.TransactionReferenceNumber = b.TransactionReferenceNumber
  AND a.CustomerId = b.CustomerId
  WHERE  a.[Released] = 1
  AND ((a.[TransactionType] = 'CM' AND a.DebitOrCredit = 'D') OR
  (a.[TransactionType] = 'DM' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'IN' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'CS' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'PA' AND a.DebitOrCredit = 'D') OR
  (a.[TransactionType] = 'NS' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'RP' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'SB' AND a.DebitOrCredit = 'D') OR
  (a.[TransactionType] = 'SC' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'FI' AND a.DebitOrCredit = 'C') OR
  (a.[TransactionType] = 'PP' AND a.DebitOrCredit = 'D') OR
  (a.[TransactionType] = 'DA'))
  AND b.BatchNumber IS  NOT NULL
AND  a.[CompanyId] IN (SELECT CompanyId FROM SL.Company WHERE IsActive = 1)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dTranType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[9] 2[34] 3) )"
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
         Begin Table = "fGLTran"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 355
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fARTran"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 136
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fAPTran"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 136
               Right = 645
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dTranType';


GO
GRANT SELECT
    ON OBJECT::[dbo].[dTranType] TO [OdsUser]
    AS [dbo];

