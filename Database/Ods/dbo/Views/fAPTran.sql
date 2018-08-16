

CREATE VIEW [dbo].[fAPTran]
AS
SELECT 

COALESCE(CASE WHEN  Account = '' THEN NULL ELSE Account	 END, 'n/a') AS 'Acct',

COALESCE(CASE WHEN  [BatchNumber] = '' THEN NULL ELSE [BatchNumber] END, 'n/a') AS 'BatNbr',

COALESCE(CASE WHEN  [CompanyId] = '' THEN NULL ELSE [CompanyId] END, 'n/a') AS 'CpnyID',

COALESCE(CASE WHEN [CurrencyId] = '' THEN NULL ELSE [CurrencyId] END, 'n/a') AS 'CuryId',

CASE WHEN [CurrencyRate] IS NULL THEN 0 ELSE [CurrencyRate] END AS 'CuryRate',

CASE WHEN [CurrencyTransactionAmount] IS NULL THEN 0 ELSE [CurrencyTransactionAmount] END AS 'CuryTranAmt',

COALESCE(CASE WHEN  [DebitOrCredit] = '' THEN NULL ELSE [DebitOrCredit] END, 'n/a') AS 'DrCr',

COALESCE(CASE WHEN  [EmployeeId] = '' THEN NULL ELSE [EmployeeID] END, 'n/a') AS 'EmployeeID',

COALESCE(CASE WHEN  [FiscalYear] = '' THEN NULL ELSE [FiscalYear] END, 'n/a') AS 'FiscYr',

COALESCE(CASE WHEN  [InventoryId] = '' THEN NULL ELSE [InventoryId] END, 'n/a') AS 'InvtID',

COALESCE(CASE WHEN  [JournalType] = '' THEN NULL ELSE [JournalType] END, 'n/a') AS 'JrnlType',

CASE WHEN  [PeriodFinancialDate] IS NULL THEN '1900-1-1 00:00:00' ELSE  [PeriodFinancialDate] END AS 'PerFinancialDate',

COALESCE(CASE WHEN  [PeriodToPost] = '' THEN NULL ELSE [PeriodToPost] END, 'n/a') AS 'PerPost',

COALESCE(CASE WHEN  [ProjectId] = '' THEN NULL ELSE [ProjectId] END, 'n/a') AS 'ProjectID',

CASE WHEN [RecordId] IS NULL THEN 0 ELSE [RecordId] END AS 'RecordID',

COALESCE(CASE WHEN  [TransactionReferenceNumber] = '' THEN NULL ELSE [TransactionReferenceNumber] END, 'n/a') AS 'RefNbr',

CASE WHEN [Released] IS NULL THEN 0 ELSE [Released] END AS 'Rlsed',

COALESCE(CASE WHEN  [SiteId] = '' THEN NULL ELSE [SiteId] END, 'n/a') AS 'SiteId',

COALESCE(CASE WHEN  [SubaccountId] = '' THEN NULL ELSE [SubaccountId] END, 'n/a') AS 'Sub',

COALESCE(CASE WHEN  [SubSeg1] = '' THEN NULL ELSE [SubSeg1] END, 'n/a') AS 'SubSeg1',

COALESCE(CASE WHEN  [SubSeg2] = '' THEN NULL ELSE [SubSeg2] END, 'n/a') AS 'SubSeg2',

COALESCE(CASE WHEN  [TaskId] = '' THEN NULL ELSE [TaskId] END, 'n/a') AS 'TaskID',

CASE WHEN [TransactionAmount] IS NULL THEN 0 ELSE 
	CASE WHEN [DebitOrCredit] = 'C' THEN [TransactionAmount] *-1 ELSE [TransactionAmount] END  END AS 'TranAmt',

CASE WHEN  [TransactionDate] IS NULL THEN '1900-1-1 00:00:00' ELSE  [TransactionDate] END AS 'TranDate',

COALESCE(CASE WHEN  [TransactionType] = '' THEN NULL ELSE [TransactionType] END, 'n/a') AS 'trantype',

COALESCE(CASE WHEN  [VendorId] = '' THEN NULL ELSE [VendorId] END, 'n/a') AS 'VendId',

CASE WHEN [LastUpdate] IS NULL THEN '1900-1-1 00:00:00' ELSE [LastUpdate] END AS 'tstamp',

COALESCE(CASE WHEN  [TransactionDescription] = '' THEN NULL ELSE [TransactionDescription] END, 'n/a') AS 'TranDesc'

FROM SL.AccountsPayableTransaction
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fAPTran';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[9] 2[43] 3) )"
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
         Begin Table = "AccountsPayableTransaction (SL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 336
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 17
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fAPTran';

