CREATE VIEW [dbo].[fARBalance]
AS
SELECT
	T.CompanyId																						   AS 'CpnyID'
   ,T.CustomerId																					   AS 'CustID'
   ,T.TransactionReferenceNumber																	   AS 'RefNbr'
   ,T.DocumentDate																					   AS 'DocDate'
   ,T.DueDate																						   AS 'DueDate'
   ,T.DocumentType																					   AS 'DocType'
   ,CASE
		WHEN T.DocumentType IN ( 'CM', 'PA', 'PP', 'SB' ) THEN T.CurrencyDocumentBalance * -1
		WHEN T.DocumentType IN ( 'DM', 'IN', 'SC' ) THEN T.CurrencyDocumentBalance * 1
		WHEN T.DocumentType = 'RP' THEN T.CurrencyDocumentBalance * 0
		ELSE T.CurrencyDocumentBalance * 1
	END																								   AS 'DocBal'
   ,CASE
		WHEN T.DocumentType IN ( 'CM', 'PA', 'PP', 'SB' ) THEN T.OriginalDocumentAmount * -1
		WHEN T.DocumentType IN ( 'DM', 'IN', 'SC' ) THEN T.OriginalDocumentAmount * 1
		WHEN T.DocumentType = 'RP' THEN T.OriginalDocumentAmount * 0
		ELSE T.OriginalDocumentAmount * 1
	END																								   AS 'OrigDocAmt'
   ,SUBSTRING(T.SubaccountId, 1, 2)																	   AS 'ProfitCenterID'
   ,SUBSTRING(T.SubaccountId, 3, 4)																	   AS 'LocationID'
   ,T.PeriodToPost																					   AS 'PerPost'
   ,CONVERT(DATETIME, SUBSTRING(T.PeriodToPost, 1, 4) + '-' + SUBSTRING(T.PeriodToPost, 5, 2) + '-01') AS 'PerFinancialDate'
   ,COALESCE(CASE WHEN T.WorkOrder = '' THEN NULL ELSE T.WorkOrder END, 'n/a')						   AS 'WorkOrder'
FROM SL.vwAccountsReceivableDocument AS T
	LEFT OUTER JOIN SL.Company		 AS T2 ON T2.CompanyId = T.CompanyId
WHERE
	(T.Released			= 1)
	AND (T.OpenDocument = 1)
	AND (T2.IsActive =	  1);


--SELECT
--	T.CompanyId																						   AS 'CpnyID'
--   ,T.CustomerId																					   AS 'CustID'
--   ,T.TransactionReferenceNumber																	   AS 'RefNbr'
--   ,T.DocumentDate																					   AS 'DocDate'
--   ,T.DueDate																						   AS 'DueDate'
--   ,T.DocumentType																					   AS 'T.DocumentType'
--   ,T.DocumentBalance																				   AS 'DocBal'
--   ,T.OriginalDocumentAmount																		   AS 'OrigDocAmt'
--   ,T.ProfitCenterId																				   AS 'ProfitCenterID'
--   ,T.LocationId																					   AS 'LocationID'
--   ,T.PeriodToPost																					   AS 'PerPost'
--   ,CONVERT(DATETIME, SUBSTRING(T.PeriodToPost, 1, 4) + '-' + SUBSTRING(T.PeriodToPost, 5, 2) + '-01') AS 'PerFinancialDate'
--   ,COALESCE(CASE WHEN T.WorkOrder = '' THEN NULL ELSE T.WorkOrder END, 'n/a')						   AS 'WorkOrder'
--FROM SL.vwAccountsReceivableBalances AS T
--	LEFT OUTER JOIN SL.Company		 AS T2 ON T2.CompanyId = T.CompanyId
--WHERE
--	(T.Released			= 1)
--	AND (T.OpenDocument = 1)
--	AND (T2.IsActive =	  1);
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fARBalance';


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
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T2"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 136
               Right = 556
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fARBalance';


GO
GRANT SELECT
    ON OBJECT::[dbo].[fARBalance] TO [OdsUser]
    AS [dbo];

