CREATE VIEW [dbo].[dLedger]
AS
WITH CTE
AS
(
	SELECT
		COALESCE(CASE WHEN LedgerId = '' THEN NULL ELSE LedgerId END, 'n/a')			 AS LedgerID
	   ,COALESCE(CASE WHEN BalanceType = '' THEN NULL ELSE BalanceType END, 'n/a')		 AS BalanceType
	   ,CASE
			WHEN BalanceRequired IS NULL THEN 0
			ELSE BalanceRequired
		END																				 AS BalRequired
	   ,COALESCE(CASE WHEN BaseCurrencyId = '' THEN NULL ELSE BaseCurrencyId END, 'n/a') AS BaseCuryID
	   ,COALESCE(CASE WHEN Description = '' THEN NULL ELSE Description END, 'n/a')		 AS Descr
	FROM SL.Ledger
)
SELECT
	LedgerID
   ,BalanceType
   ,BalRequired
   ,BaseCuryID
   ,Descr
FROM CTE

UNION

SELECT Distinct LedgerID, 'n/a', 0, 'n/a', 'n/a'
FROM SL.GeneralLedgerTransaction 
WHERE LedgerId NOT IN (SELECT LedgerId FROM CTE)




/*
SELECT Distinct a.[LedgerID], 'n/a', 0, 'n/a', 'n/a'

FROM [fGLTran] a LEFT OUTER JOIN (SELECT DISTINCT LedgerID FROM SL.Ledger) b ON a.[LedgerID] = b.[LedgerID]

WHERE b.[LedgerID] IS NULL

UNION

SELECT Distinct a.[LedgerID], 'n/a', 0, 'n/a', 'n/a'

FROM [fGLBudget] a LEFT OUTER JOIN (SELECT DISTINCT LedgerID FROM SL.Ledger) b ON a.[LedgerID] = b.[LedgerID]

WHERE b.[LedgerID] IS NULL

UNION

SELECT Distinct a.[LedgerID], 'n/a', 0, 'n/a', 'n/a'

FROM SL.vwGeneralLedgerSetup a LEFT OUTER JOIN (SELECT DISTINCT LedgerID FROM SL.Ledger) b ON a.[LedgerID] = b.[LedgerID]

WHERE b.[LedgerID] IS NULL ;
*/
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dLedger';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[35] 2[20] 3) )"
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
         Begin Table = "Ledger (SL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 296
               Right = 215
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dLedger';

