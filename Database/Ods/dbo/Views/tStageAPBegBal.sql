

Create VIEW [dbo].[tStageAPBegBal]
AS
WITH tStageAPBegBAL_CTE ([Acct], [BegBal], [CpnyID], [CuryID], [FiscYr], [PerNbr], [PerFinancialDate], [VendId], [Sub], [SubSeg1], [SubSeg2])
AS
(

SELECT
      'n/a' AS 'Acct'
	  ,[BeginBalance] AS 'BegBal'
      ,[CompanyId] AS'CpnyID'
      ,[CurrencyId] AS 'CuryID'
      ,[FiscalYear] AS 'FiscYr'
      ,[PeriodNumber] AS 'PerNbr'
      ,[VendorId] AS'VendId'
	  , Convert(nvarchar, Convert(int, FiscalYear) - 1) + '-12-01' AS 'PerFinancialDate'
	  ,'n/a' AS 'Sub'
	  ,'n/a' AS 'SubSeg1'
	  ,'n/a' AS 'SubSeg2'
  FROM [SL].[AccountsPayableHistory] WITH(NOLOCK)
  WHERE [CompanyId] IN (SELECT [CompanyId] FROM [SL].[Company] WHERE IsActive = 1)

  
)
SELECT [Acct], [BegBal], tStageAPBegBAL_CTE.[CpnyID], [CuryID], [FiscYr], [PerNbr], [PerFinancialDate], [VendId], [Sub], [SubSeg1], [SubSeg2]
FROM
	tStageAPBegBAL_CTE JOIN 
	(select CpnyId,MIN(FiscYr) as MinFiscYear from tStageAPBegBAL_CTE where FiscYr >= '1980' GROUP BY CpnyID) AS FiscalList
	ON	tStageAPBegBAL_CTE.CpnyId = FiscalList.CpnyId and tStageAPBegBAL_CTE.FiscYr = FiscalList.MinFiscYear
	WHERE BegBal <> 0;