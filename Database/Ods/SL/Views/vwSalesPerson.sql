CREATE VIEW SL.vwSalesPerson
AS
SELECT
	[RowId]
   ,[City]
   ,[Country]
   ,[Name]
   ,[SalesPersonId]
   ,[State]
   ,[Territory]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[Salesperson];