



CREATE VIEW [dbo].[dCustomer]
AS
SELECT
	COALESCE(CASE WHEN CustomerId = '' THEN NULL ELSE CustomerId END, 'n/a')	   AS 'CustID'
   ,COALESCE(CASE WHEN City = '' THEN NULL ELSE City END, 'n/a')				   AS 'City'
   ,COALESCE(CASE WHEN ClassId = '' THEN NULL ELSE ClassId END, 'n/a')			   AS 'ClassID'
   ,COALESCE(CASE WHEN Country = '' THEN NULL ELSE Country END, 'n/a')			   AS 'Country'
   ,COALESCE(CASE WHEN [Name] = '' THEN NULL ELSE [Name] END, 'n/a')			   AS 'Name'
   ,COALESCE(CASE WHEN SalesPersonId = '' THEN NULL ELSE SalesPersonId END, 'n/a') AS 'SlsPerID'
   ,COALESCE(CASE WHEN [State] = '' THEN NULL ELSE [State] END, 'n/a')			   AS 'State'
   ,COALESCE(CASE WHEN [Status] = '' THEN NULL ELSE [Status] END, 'n/a')		   AS 'Status'
   ,COALESCE(CASE WHEN Zip = '' THEN NULL ELSE Zip END, 'n/a')					   AS 'Zip'
   ,CASE
		WHEN CreditLimit IS NULL THEN 0
		ELSE CreditLimit
	END																			   AS 'CrLimit'
   ,CASE
		WHEN LastUpdate IS NULL THEN CAST('1900-01-01 00:00:00' AS DATETIME2(7))
		ELSE LastUpdate
	END																			   AS 'tstamp'
FROM SL.Customer
UNION
SELECT DISTINCT
	   COALESCE(CASE WHEN CustomerId = '' THEN NULL ELSE CustomerId END, 'n/a') AS [CustId]
	  ,'n/a'
	  ,'n/a'
	  ,'n/a'
	  ,'n/a'
	  ,'n/a'
	  ,'n/a'
	  ,'n/a'
	  ,'n/a'
	  ,0
	  ,CAST('1900-01-01 00:00:00' AS DATETIME2(7))
FROM SL.AccountsReceivableTransaction
WHERE CustomerId NOT IN (SELECT CustomerId FROM SL.Customer)


--SELECT DISTINCT
--	   a.[CustId]
--	  ,'n/a'
--	  ,'n/a'
--	  ,'n/a'
--	  ,'n/a'
--	  ,'n/a'
--	  ,'n/a'
--	  ,'n/a'
--	  ,'n/a'
--	  ,0
--	  ,CAST('1900-01-01 00:00:00' AS DATETIME2(7))
--FROM [fARTran]									  a
--	LEFT OUTER JOIN
--	(SELECT DISTINCT CustomerId FROM SL.Customer) b ON a.[CustId] = b.[CustomerId]
--WHERE b.[CustomerId] IS NULL;
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dCustomer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[14] 2[25] 3) )"
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
         Begin Table = "Customer (SL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 11
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'dCustomer';


GO
GRANT SELECT
    ON OBJECT::[dbo].[dCustomer] TO [OdsUser]
    AS [dbo];

