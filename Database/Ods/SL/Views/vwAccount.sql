CREATE VIEW SL.vwAccount
AS
SELECT
	[RowId]
   ,[Account]
   ,[AccountType]
   ,[AccountCategory]
   ,[AccountCategorySpecified]
   ,[Active]
   ,[ClassId]
   ,[ConsolidationAccount]
   ,[CurrencyId]
   ,[Description]
   ,[RatioGroup]
   ,[IsSummarized]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[Account];