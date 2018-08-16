
CREATE View [SL].[vwBudget_Dist_Type] As

SELECT 
	 RTRIM([Descr]) as Description
	,RTRIM([DistType]) as DistributionType
	,[NoteId]
	,[Pct00] as BudgetPercent00
	,[Pct01] as BudgetPercent01
	,[Pct02] as BudgetPercent02
	,[Pct03] as BudgetPercent03
	,[Pct04] as BudgetPercent04
	,[Pct05] as BudgetPercent05
	,[Pct06] as BudgetPercent06
	,[Pct07] as BudgetPercent07
	,[Pct08] as BudgetPercent08
	,[Pct09] as BudgetPercent09
	,[Pct10] as BudgetPercent10
	,[Pct11] as BudgetPercent11
	,[PctTot] as BudgetPercentTotal
    ,[LUpd_DateTime] AS LastUpdate
    ,GETUTCDATE() AS ImportDate
FROM [SL].[Budget_Dist_Type]