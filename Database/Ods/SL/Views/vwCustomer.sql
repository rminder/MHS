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
GO
GRANT SELECT
    ON OBJECT::[SL].[vwCustomer] TO [OdsUser]
    AS [dbo];

