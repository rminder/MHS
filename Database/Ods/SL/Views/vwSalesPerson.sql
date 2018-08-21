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
GO
GRANT SELECT
    ON OBJECT::[SL].[vwSalesPerson] TO [OdsUser]
    AS [dbo];

