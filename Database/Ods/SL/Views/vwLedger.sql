Create View SL.vwLedger AS

SELECT 
	 [RowId]
	,[LedgerId]
	,[BalanceType]
	,[BalanceRequired]
	,[BaseCurrencyId]
	,[Description]
	,[LastUpdate]
	,[ImportDate]
FROM [SL].[Ledger]