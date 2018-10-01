CREATE View [SL].[vwAR_Balances] AS

SELECT 
	 [AgeBal00] as AgeBalance00
	,[AgeBal01] as AgeBalance01
	,[AgeBal02] as AgeBalance02
	,[AgeBal03] as AgeBalance03
	,[AgeBal04] as AgeBalance04
	,[AvgDayToPay] as AverageDaysToPay
	,RTRIM([CpnyID]) as CompanyId
	,[CrLmt] as CreditLimit
	,[CurrBal] as CurrentBalance
	,[CuryID] as CurrencyId
	,[CustID] as CustomerId
	,[FutureBal] as FutureBalance
	,[LastActDate] as LastActivityDate
	,[LastAgeDate] as LastAgingDate
	,[LastFinChrgDate] as LastFinanceChargesDate
	,[LastInvcDate] as LastInvoiceDate
	,[LastStmtBal00] as LastStatementBalance00
	,[LastStmtBal01] as LastStatementBalance01
	,[LastStmtBal02] as LastStatementBalance02
	,[LastStmtBal03] as LastStatementBalance03
	,[LastStmtBal04] as LastStatementBalance04
	,[LastStmtBegBal] as LastStatementBeginBalance
	,[LastStmtDate] as LastStatementDate
	,[NbrInvcPaid] as NumberOfInvoicesPaid
	,[NoteID] as NoteId
	,[PaidInvcDays] as PaidInvoiceDays
	,RTRIM([PerNbr]) as PeriodNumber
	,[TotOpenOrd] as TotalOutstandingOpenOrders
	,[TotPrePay] as TotalPrePaid
	,[TotShipped] as TotalShipped
	,[LUpd_DateTime] AS LastUpdate
    ,[RowVersion]	 AS [RowVersion]    
	,GETUTCDATE() AS ImportDate
  FROM [SL].[AR_Balances]