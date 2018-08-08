﻿
CREATE VIEW [dbo].[fGLStat]
AS
SELECT
	
	m.BusinessUnit
	,m.Region
	, m.[Parent] AS 'P/L Owner'
	, RTRIM(m.[Location]) AS 'Location'
	, p.Descr AS 'Profit Center'
	, p.SegID AS 'PCID'
	, max(m.SortOrder) as SortOrder
	, case when m.BusinessUnit = 'MFS' 
		then 1
	  when m.BusinessUnit = 'MNS' 
		then 2
	  when m.BusinessUnit = 'Miner' 
		then 3 
	  else 99 end as BUSort
	 ,RTRIM(B.Account) + ' - ' +  RTRIM(a.Descr) AS 'Acct-Descr'
	 , B.PeriodToPost AS PerPost
	,d.[MonthName]
    ,d.MonthNumber
    ,d.YearNumber
	,SUM(B.NetAmount) AS 'Net Amount'

	FROM
	(
	SELECT 
		Account
		,PeriodToPost
		,-(DebitAmount - CreditAmount) AS NetAmount
		,SUBSTRING([SubaccountId], 1, 2) AS SubSeg1
		,SUBSTRING([SubaccountId], 3, 4) AS SubSeg2
		,CONVERT(DATE, SUBSTRING(PeriodToPost, 5,2) + '/01/' + SUBSTRING(PeriodToPost, 1,4)) AS PerFinancialDate
	FROM [SL].[GeneralLedgerTransaction]  WHERE LedgerId = 'SLSFCST') AS B 
	LEFT OUTER JOIN dbo.dPeriod d ON B.PerFinancialDate = d.TheDate
	LEFT OUTER JOIN dbo.dGLAccount a ON B.Account = a.Acct
	LEFT OUTER JOIN dbo.dSubAcctSeg2 l ON B.SubSeg2 = l.SegID
	LEFT OUTER JOIN dbo.[dSubAcctSeg1] p ON B.SubSeg1 = p.SegID
		LEFT JOIN dbo.locationMapping m ON RTRIM(l.SegID) = m.SegmentID

	WHERE a.AcctType = '3I' AND B.PeriodToPost = (SELECT MAX(PeriodToPost) FROM [SL].[GeneralLedgerTransaction] Where LedgerId = 'SLSFCST')
	GROUP BY  m.BusinessUnit,  m.Region, m.[Parent], m.Location, p.Descr, p.SegID, RTRIM(B.Account) + ' - ' +  RTRIM(a.Descr), B.PeriodToPost, d.MonthName, d.MonthNumber, d.YearNumber
--	ORDER BY  m.Region, m.[Parent], m.Location, p.SegID, RTRIM(B.Account) + ' - ' +  RTRIM(a.Descr), B.PeriodToPost