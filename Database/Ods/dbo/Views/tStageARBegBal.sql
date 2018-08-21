

Create VIEW [dbo].[tStageARBegBal]
AS
WITH tStageARBegBAL_CTE ([Acct], [BegBal], [CpnyID], [CuryID], [CustId], [FiscYr], [PerNbr], [PerFinancialDate], [Sub], [SubSeg1], [SubSeg2])
AS
(

SELECT
      'n/a' AS 'Acct'
	  ,[BeginBalance] AS 'BegBal'
      ,[CompanyId] AS'CpnyID'
      ,[CurrencyId] AS 'CuryID'
      ,[CustomerId] AS 'CustId'
      ,[FiscalYear] AS 'FiscYr'
      ,[PeriodNumber] AS 'PerNbr'
	  , Convert(nvarchar, Convert(int, FiscalYear) - 1) + '-12-01' AS 'PerFinancialDate'
	  ,'n/a' AS 'Sub'
	  ,'n/a' AS 'SubSeg1'
	  ,'n/a' AS 'SubSeg2'
  FROM [SL].[AccountsReceivableHistory] WITH(NOLOCK)
  WHERE [CompanyId] IN (SELECT [CompanyId] FROM [SL].[Company] WHERE IsActive = 1)

  
)
SELECT [Acct], [BegBal], tStageARBegBAL_CTE.[CpnyID], [CuryID], [CustId], [FiscYr], [PerNbr], [PerFinancialDate], [Sub], [SubSeg1], [SubSeg2]
FROM
	tStageARBegBAL_CTE JOIN 
	(select CpnyId,MIN(FiscYr) as MinFiscYear from tStageARBegBAL_CTE where FiscYr >= '1980' GROUP BY CpnyID) AS FiscalList
	ON	tStageARBegBAL_CTE.CpnyId = FiscalList.CpnyId and tStageARBegBAL_CTE.FiscYr = FiscalList.MinFiscYear
	WHERE BegBal <> 0;
GO
GRANT SELECT
    ON OBJECT::[dbo].[tStageARBegBal] TO [OdsUser]
    AS [dbo];

