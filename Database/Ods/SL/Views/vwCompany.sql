CREATE VIEW SL.vwCompany
AS
SELECT
	[RowId]
   ,[CompanyId]
   ,[IsActive]
   ,[Address1]
   ,[Address2]
   ,[BaseCurrencyId]
   ,[City]
   ,[Country]
   ,[CompanyChartOfAccounts]
   ,[CompanySubAccounts]
   ,[CompanyName]
   ,[Fax]
   ,[FederalTaxId]
   ,[Phone]
   ,[State]
   ,[Zip]
FROM [SL].[Company];