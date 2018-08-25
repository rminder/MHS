


CREATE VIEW [dbo].[fGLTran]
AS
SELECT
	COALESCE(CASE WHEN Account = '' THEN NULL ELSE Account END, 'n/a')				 AS 'Acct'
   ,COALESCE(CASE WHEN BaseCurrencyId = '' THEN NULL ELSE BaseCurrencyId END, 'n/a') AS 'BaseCuryID'
   ,COALESCE(CASE WHEN [BatchNumber] = '' THEN NULL ELSE [BatchNumber] END, 'n/a')	 AS 'BatNbr'
   ,COALESCE(CASE WHEN [CompanyId] = '' THEN NULL ELSE [CompanyId] END, 'n/a')		 AS 'CpnyID'
   ,CASE 
    WHEN [CreditAmount] IS NULL THEN 0
		ELSE [CreditAmount]
	END																				 AS 'CrAmt'
   ,CASE
		WHEN [CurrencyCreditAmount] IS NULL THEN 0
		ELSE [CurrencyCreditAmount]
	END																				 AS 'CuryCrAmt'
   ,CASE
		WHEN [CurrencyDebitAmount] IS NULL THEN 0
		ELSE [CurrencyDebitAmount]
	END																				 AS 'CuryDrAmt'
   ,COALESCE(CASE WHEN [CurrencyId] = '' THEN NULL ELSE [CurrencyId] END, 'n/a')	 AS 'CuryId'
   ,CASE
		WHEN [CurrencyRate] IS NULL THEN 0
		ELSE [CurrencyRate]
	END																				 AS 'CuryRate'
   ,CASE
		WHEN [DebitAmount] IS NULL THEN 0
		ELSE [DebitAmount]
	END																				 AS 'DrAmt'
   ,COALESCE(CASE WHEN [FiscalYear] = '' THEN NULL ELSE [FiscalYear] END, 'n/a')	 AS 'FiscYr'
   ,COALESCE(CASE WHEN [JournalType] = '' THEN NULL ELSE [JournalType] END, 'n/a')	 AS 'JrnlType'
   ,COALESCE(CASE WHEN [LedgerId] = '' THEN NULL ELSE [LedgerId] END, 'n/a')		 AS 'LedgerID'
   ,CASE
		WHEN [LineNumber] IS NULL THEN 0
		ELSE [LineNumber]
	END																				 AS 'LineNbr'
   ,COALESCE(CASE WHEN [Module] = '' THEN NULL ELSE [Module] END, 'n/a')			 AS 'Module'
   ,COALESCE(CASE WHEN [PeriodToPost] = '' THEN NULL ELSE [PeriodToPost] END, 'n/a') AS 'PerPost'
   ,CASE
		WHEN [PeriodFinancialDate] IS NULL THEN '1900-1-1 00:00:00'
		ELSE [PeriodFinancialDate]
	END																				 AS 'PerFinancialDate'
   ,COALESCE(CASE WHEN [Posted] = '' THEN NULL ELSE [Posted] END, 'n/a')			 AS 'Posted'
   ,COALESCE(CASE WHEN [ProjectId] = '' THEN NULL ELSE [ProjectId] END, 'n/a')		 AS 'ProjectID'
   ,CASE
		WHEN [Released] IS NULL THEN 0
		ELSE [Released]
	END																				 AS 'Rlsed'
   ,COALESCE(CASE WHEN [SubaccountId] = '' THEN NULL ELSE [SubaccountId] END, 'n/a') AS 'Sub'
   ,COALESCE(CASE WHEN [SubSeg1] = '' THEN NULL ELSE [SubSeg1] END, 'n/a')			 AS 'SubSeg1'
   ,COALESCE(CASE WHEN [SubSeg2] = '' THEN NULL ELSE [SubSeg2] END, 'n/a')			 AS 'SubSeg2'
   ,COALESCE(CASE WHEN [TaskId] = '' THEN NULL ELSE [TaskId] END, 'n/a')			 AS 'TaskID'
   ,CASE
		WHEN [TransactionDate] IS NULL THEN '1900-1-1 00:00:00'
		ELSE [TransactionDate]
	END																				 AS 'TranDate'
   ,COALESCE(	CASE
					WHEN [TransactionDesc] = '' THEN NULL
					ELSE [TransactionDesc]
				END
			   ,'n/a'
			)																		 AS 'TranDesc'
   ,COALESCE(	CASE
					WHEN [TransactionType] = '' THEN NULL
					ELSE [TransactionType]
				END
			   ,'n/a'
			)																		 AS 'trantype'
   ,COALESCE(	CASE
					WHEN [TransactionReferenceNumber] = '' THEN NULL
					ELSE [TransactionReferenceNumber]
				END
			   ,'n/a'
			)																		 AS 'RefNbr'
   ,CASE
		WHEN [LastUpdate] IS NULL THEN '1900-1-1 00:00:00'
		ELSE [LastUpdate]
	END																				 AS 'tstamp'
FROM SL.GeneralLedgerTransaction
WHERE   [BalanceType] = 'A' AND [Released] = 1
  AND [CompanyID] IN (SELECT CompanyID FROM SL.Company WHERE IsActive = 1)
  AND [JournalType] <> 'BB'

UNION

SELECT
	a.[Acct]													AS 'Acct'
   ,a.[CuryID]													AS 'BaseCuryID'
   ,''															AS 'BatNbr'
   ,a.[CpnyID]													AS 'CpnyID'
   ,CASE b.AcctType
		WHEN '1A' THEN 0
		ELSE a.[BegBal]
	END															AS 'CrAmt'
   ,CASE b.AcctType
		WHEN '1A' THEN 0
		ELSE a.[BegBal]
	END															AS 'CuryCrAmt'
   ,CASE b.AcctType
		WHEN '1A' THEN a.[BegBal]
		ELSE 0
	END															AS 'CuryDrAmt'
   ,a.[CuryID]
   ,1															AS 'CuryRate'
   ,CASE b.AcctType
		WHEN '1A' THEN a.[BegBal]
		ELSE 0
	END															AS 'DrAmt'
   ,CONVERT(NVARCHAR(100), CONVERT(INT, a.[FiscYr]) - 1)		AS 'FiscYr'
   ,'BB'														AS 'JrnlType'
   ,[LedgerId]													AS 'LedgerID'
   ,0															AS 'LineNbr'
   ,'GL'														AS 'Module'
   ,CONVERT(NVARCHAR(100), CONVERT(INT, a.[FiscYr]) - 1) + '12' AS 'PerPost'
   ,a.[PerFinancialDate]										AS 'PerFinancialDate'
   ,'P'															AS 'Posted'
   ,'n/a'														AS 'ProjectID'
   ,1															AS 'Rlsed'
   ,a.[Sub]
   ,a.[SubSeg1]
   ,a.[SubSeg2]
   ,'n/a'														AS 'TaskID'
   ,a.[PerFinancialDate]										AS 'TranDate'
   ,'Beginning Balance'											AS 'TranDesc'
   ,'GL'														AS 'TranType'
   ,'n/a'														AS 'RefNbr'
   ,'1900-1-1 00:00:00'											AS 'tstamp'
FROM [tStageGLBegBal] a
	INNER JOIN
	(
		SELECT
			COALESCE(CASE WHEN Account  = '' THEN NULL ELSE Account  END, 'n/a')	AS 'Acct'
			,COALESCE(CASE WHEN AccountType = '' THEN NULL ELSE AccountType END, 'n/a')		   AS 'AcctType'
		FROM SL.Account
		UNION
		SELECT DISTINCT
			  COALESCE(CASE WHEN a.Account  = '' THEN NULL ELSE a.Account  END, 'n/a')	AS 'Acct'
			  ,COALESCE(CASE WHEN AccountType = '' THEN NULL ELSE AccountType END, 'n/a')		   AS 'AcctType'
		FROM SL.AccountsPayableTransaction				   a
			LEFT OUTER JOIN SL.Account b ON a.[Account] = b.[Account]
		WHERE b.[Account] IS NULL
		UNION
		SELECT DISTINCT
			  COALESCE(CASE WHEN a.Account  = '' THEN NULL ELSE a.Account  END, 'n/a')	AS 'Acct'
			  ,COALESCE(CASE WHEN AccountType = '' THEN NULL ELSE AccountType END, 'n/a')		   AS 'AcctType'
		FROM SL.AccountsReceivableTransaction				   a
			LEFT OUTER JOIN SL.Account b ON a.[Account] = b.[Account]
		WHERE b.[Account] IS NULL
		UNION
		SELECT DISTINCT
			  COALESCE(CASE WHEN a.Account  = '' THEN NULL ELSE a.Account  END, 'n/a')	AS 'Acct'
			   ,COALESCE(CASE WHEN AccountType = '' THEN NULL ELSE AccountType END, 'n/a')		   AS 'AcctType'
		FROM [SL].[GeneralLedgerTransaction] a
			LEFT OUTER JOIN SL.Account		 b ON a.[Account] = b.[Account]
		WHERE b.[Account] IS NULL
		UNION
		SELECT DISTINCT
				  COALESCE(CASE WHEN a.Acct  = '' THEN NULL ELSE a.Acct  END, 'n/a')	AS 'Acct'
			 ,COALESCE(CASE WHEN AccountType = '' THEN NULL ELSE AccountType END, 'n/a')		   AS 'AcctType' 
		FROM [fGLBudget]			   a
			LEFT OUTER JOIN SL.Account b ON a.[Acct] = b.[Account]
		WHERE b.[Account] IS NULL
	)				  b ON a.Acct = b.Acct;
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fGLTran';


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
         Begin Table = "GeneralLedgerTransaction (SL)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 285
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
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'fGLTran';


GO
GRANT SELECT
    ON OBJECT::[dbo].[fGLTran] TO [OdsUser]
    AS [dbo];

