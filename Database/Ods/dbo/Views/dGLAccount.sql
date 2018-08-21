




CREATE VIEW [dbo].[dGLAccount]
AS
SELECT
	COALESCE(CASE WHEN Account = '' THEN NULL ELSE Account END,'n/a')	AS 'Acct'
   ,COALESCE(CASE WHEN AccountType = '' THEN NULL ELSE AccountType END,'n/a') AS 'AcctType'
   ,COALESCE(CASE WHEN AccountCategory = '' THEN NULL ELSE AccountCategory END,'n/a') AS 'Acct_Cat'
   ,COALESCE(CASE WHEN AccountCategorySpecified = '' THEN NULL ELSE AccountCategorySpecified END,'n/a')  AS 'Acct_Cat_SW'
   , CASE WHEN Active IS NULL THEN 0 ELSE Active END AS 'Active'
   ,COALESCE(CASE WHEN ClassId = '' THEN NULL ELSE ClassId END,'n/a') AS 'ClassID'
   ,COALESCE(CASE WHEN ConsolidationAccount = '' THEN NULL ELSE ConsolidationAccount END,'n/a') AS 'ConsolAcct'
   ,COALESCE(CASE WHEN CurrencyId = '' THEN NULL ELSE CurrencyId END,'n/a') AS 'CuryId'
   ,COALESCE(CASE WHEN [Description] = '' THEN NULL ELSE [Description] END,'n/a') AS 'Descr'
   ,COALESCE(CASE WHEN RatioGroup = '' THEN NULL ELSE RatioGroup END,'n/a') AS 'RatioGrp'
   ,COALESCE(CASE WHEN IsSummarized = '' THEN NULL ELSE IsSummarized END,'n/a') AS 'SummPost'
FROM SL.Account

UNION


SELECT Distinct a.[Account], 'n/a', 'n/a', 'n/a', 0, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a'

FROM [SL].[AccountsPayableTransaction] a LEFT OUTER JOIN SL.Account b ON a.[Account] = b.[Account]

WHERE b.[Account] IS NULL

UNION

SELECT Distinct a.[Account], 'n/a', 'n/a', 'n/a', 0, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a'

FROM [SL].[AccountsReceivableTransaction] a LEFT OUTER JOIN SL.Account b ON a.[Account] = b.[Account]

WHERE b.[Account] IS NULL

UNION

SELECT Distinct a.[Account], 'n/a', 'n/a', 'n/a', 0, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a'

FROM [SL].[GeneralLedgerTransaction] a LEFT OUTER JOIN SL.Account b ON a.[Account] = b.[Account]

WHERE b.[Account] IS NULL

UNION

SELECT Distinct a.[Account], 'n/a', 'n/a', 'n/a', 0, 'n/a', 'n/a', 'n/a', 'n/a', 'n/a', 'n/a'
	FROM            SL.AccountHistory AS a INNER JOIN
                         SL.Account AS b ON a.Account = b.Account
	WHERE        (a.BalanceType = 'B') AND (a.CompanyId IN
                             (SELECT        CompanyId
                               FROM            SL.Company
                               WHERE        (IsActive = 1)))
	AND b.[Account] IS NULL ;
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dGLAccount';


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
         Begin Table = "Account (SL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 350
               Right = 268
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dGLAccount';

