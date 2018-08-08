CREATE VIEW SL.vwCustomer
AS
SELECT
	[RowId]
   ,[CustomerId]
   ,[City]
   ,[ClassId]
   ,[Country]
   ,[Name]
   ,[SalesPersonId]
   ,[State]
   ,[Status]
   ,[Zip]
   ,[CreditLimit]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[Customer];