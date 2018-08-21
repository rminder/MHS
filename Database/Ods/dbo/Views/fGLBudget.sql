CREATE VIEW dbo.fGLBudget
AS
WITH FGLBudgetStaging_CTE ([Acct]
      ,[BdgtRvsnDate]
      ,[CpnyID]
      ,[CuryID]
      ,[FiscYr]
      ,[LedgerID]
      ,[PtdBal00]
      ,[PtdBal01]
      ,[PtdBal02]
      ,[PtdBal03]
      ,[PtdBal04]
      ,[PtdBal05]
      ,[PtdBal06]
      ,[PtdBal07]
      ,[PtdBal08]
      ,[PtdBal09]
      ,[PtdBal10]
      ,[PtdBal11]
      ,[PtdBal12]
      ,[Sub]
      ,[SubSeg1]
      ,[SubSeg2]
      ,[tstamp]
	  ,[NbrPer])
AS
(
--SELECT EmployeeNumber,
--       Title
--FROM   Employee_CTE

SELECT        
COALESCE(CASE WHEN  b.Account = '' THEN NULL ELSE b.Account	 END, 'n/a') AS 'Acct'
, CASE WHEN  a.BudgetRevisionDate IS NULL THEN '1900-1-1 00:00:00' ELSE  a.BudgetRevisionDate END AS 'BdgtRvsnDate'
, COALESCE(CASE WHEN  [CompanyId] = '' THEN NULL ELSE [CompanyId] END, 'n/a') AS 'CpnyID'
, COALESCE(CASE WHEN a.CurrencyId = '' THEN NULL ELSE a.CurrencyId END, 'n/a') AS 'CuryId'
, COALESCE(CASE WHEN  [FiscalYear] = '' THEN NULL ELSE [FiscalYear] END, 'n/a') AS 'FiscYr'
, COALESCE(CASE WHEN  [LedgerId] = '' THEN NULL ELSE [LedgerId] END, 'n/a') AS 'LedgerID'
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance00] IS NULL THEN 0 ELSE a.[PostedBalance00] END  
						 ELSE 
							CASE WHEN a.[PostedBalance00] IS NULL THEN 0 ELSE a.[PostedBalance00] * - 1 END  
						 END AS PeriodToDateBalance00
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance01] IS NULL THEN 0 ELSE a.[PostedBalance01] END  
						 ELSE 
							CASE WHEN a.[PostedBalance01] IS NULL THEN 0 ELSE a.[PostedBalance01] * - 1 END   
						 END AS PeriodToDateBalance01
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance02] IS NULL THEN 0 ELSE a.[PostedBalance02] END  
						 ELSE 
							CASE WHEN a.[PostedBalance02] IS NULL THEN 0 ELSE a.[PostedBalance02] * - 1 END   
						 END AS PeriodToDateBalance02
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance03] IS NULL THEN 0 ELSE a.[PostedBalance03] END  
						 ELSE 
							CASE WHEN a.[PostedBalance03] IS NULL THEN 0 ELSE a.[PostedBalance03] * - 1 END   
						 END AS PeriodToDateBalance03
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance04] IS NULL THEN 0 ELSE a.[PostedBalance04] END  
						 ELSE 
							CASE WHEN a.[PostedBalance04] IS NULL THEN 0 ELSE a.[PostedBalance04] * - 1 END   
						 END AS PeriodToDateBalance04
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance05] IS NULL THEN 0 ELSE a.[PostedBalance05] END  
						 ELSE 
							CASE WHEN a.[PostedBalance05] IS NULL THEN 0 ELSE a.[PostedBalance05] * - 1 END   
						 END AS PeriodToDateBalance05
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance06] IS NULL THEN 0 ELSE a.[PostedBalance06] END  
						 ELSE 
							CASE WHEN a.[PostedBalance06] IS NULL THEN 0 ELSE a.[PostedBalance06] * - 1 END   
						 END AS PeriodToDateBalance06
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance07] IS NULL THEN 0 ELSE a.[PostedBalance07] END  
						 ELSE 
							CASE WHEN a.[PostedBalance07] IS NULL THEN 0 ELSE a.[PostedBalance07] * - 1 END   
						 END AS PeriodToDateBalance07
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance08] IS NULL THEN 0 ELSE a.[PostedBalance08] END  
						 ELSE 
							CASE WHEN a.[PostedBalance08] IS NULL THEN 0 ELSE a.[PostedBalance08] * - 1 END   
						 END AS PeriodToDateBalance08
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance09] IS NULL THEN 0 ELSE a.[PostedBalance09] END  
						 ELSE 
							CASE WHEN a.[PostedBalance09] IS NULL THEN 0 ELSE a.[PostedBalance09] * - 1 END   
						 END AS PeriodToDateBalance09
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance10] IS NULL THEN 0 ELSE a.[PostedBalance10] END  
						 ELSE 
							CASE WHEN a.[PostedBalance10] IS NULL THEN 0 ELSE a.[PostedBalance10] * - 1 END   
						 END AS PeriodToDateBalance10
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance11] IS NULL THEN 0 ELSE a.[PostedBalance11] END  
						 ELSE 
							CASE WHEN a.[PostedBalance11] IS NULL THEN 0 ELSE a.[PostedBalance11] * - 1 END   
						 END AS PeriodToDateBalance11
, CASE WHEN SubString(b.AccountType, 2, 1) NOT IN ('I', 'L') 
                         THEN 
							CASE WHEN a.[PostedBalance12] IS NULL THEN 0 ELSE a.[PostedBalance12] END  
						 ELSE 
							CASE WHEN a.[PostedBalance12] IS NULL THEN 0 ELSE a.[PostedBalance12] * - 1 END   
						 END AS PeriodToDateBalance12
, COALESCE(CASE WHEN  a.SubaccountId = '' THEN NULL ELSE a.SubaccountId END, 'n/a') AS 'Sub' 
, SUBSTRING(a.SubaccountId, 1, 2) AS 'SubSeg1'
, SUBSTRING(a.SubaccountId, 3, 4) AS 'SubSeg2'
, CASE WHEN a.LastUpdate  IS NULL THEN '1900-1-1 00:00:00' ELSE a.LastUpdate END AS 'tstamp'
, (SELECT NumberOfPeriods FROM SL.vwGeneralLedgerSetup) AS 'NbrPer'


FROM            SL.AccountHistory AS a INNER JOIN
                         SL.Account AS b ON a.Account = b.Account
WHERE        (a.BalanceType = 'B') AND (a.CompanyId IN
                             (SELECT        CompanyId
                               FROM            SL.Company
                               WHERE        (IsActive = 1)))

)
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal01 AS 'BudgetAmt', FiscYr + '01' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '01', 1,4) + '-' + SUBSTRING( FiscYr + '01', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal02 AS 'BudgetAmt', FiscYr + '02' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '02', 1,4) + '-' + SUBSTRING( FiscYr + '02', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal03 AS 'BudgetAmt', FiscYr + '03' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '03', 1,4) + '-' + SUBSTRING( FiscYr + '03', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal04 AS 'BudgetAmt', FiscYr + '04' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '04', 1,4) + '-' + SUBSTRING( FiscYr + '04', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal05 AS 'BudgetAmt', FiscYr + '05' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '05', 1,4) + '-' + SUBSTRING( FiscYr + '05', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal06 AS 'BudgetAmt', FiscYr + '06' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '06', 1,4) + '-' + SUBSTRING( FiscYr + '06', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal07 AS 'BudgetAmt', FiscYr + '07' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '07', 1,4) + '-' + SUBSTRING( FiscYr + '07', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal08 AS 'BudgetAmt', FiscYr + '08' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '08', 1,4) + '-' + SUBSTRING( FiscYr + '08', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal09 AS 'BudgetAmt', FiscYr + '09' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '09', 1,4) + '-' + SUBSTRING( FiscYr + '09', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal10 AS 'BudgetAmt', FiscYr + '10' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '10', 1,4) + '-' + SUBSTRING( FiscYr + '10', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal11 AS 'BudgetAmt', FiscYr + '11' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '11', 1,4) + '-' + SUBSTRING( FiscYr + '11', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
UNION
	 SELECT Acct, BdgtRvsnDate, CpnyID, PtdBal12 AS 'BudgetAmt', FiscYr + '12' AS 'BdgtPer', CONVERT(datetime, SUBSTRING( FiscYr + '12', 1,4) + '-' + SUBSTRING( FiscYr + '12', 5, 2) + '-01') AS 'BdgFinancialDate',
			CuryID, FiscYr, LedgerID,  [Sub],  SubSeg1, SubSeg2, tstamp FROM FGLBudgetStaging_CTE
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fGLBudget';


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
         Begin Table = "AccountHistory (SL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 233
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fGLBudget';


GO
GRANT SELECT
    ON OBJECT::[dbo].[fGLBudget] TO [OdsUser]
    AS [dbo];

