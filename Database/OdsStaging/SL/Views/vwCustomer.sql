CREATE VIEW SL.vwCustomer
AS
SELECT
	RTRIM([CustID]) AS CustomerId
   ,RTRIM([City]) AS City
   ,RTRIM([ClassID]) AS ClassId
   ,RTRIM([Country]) AS Country
   ,RTRIM([Name]) AS [Name]
   ,RTRIM([SlsPerID]) AS SalesPersonId
   ,RTRIM([State]) AS State
   ,RTRIM([Status]) AS Status
   ,RTRIM([Zip]) AS Zip
   ,[CrLmt] AS CreditLimit
   ,[LUpd_DateTime] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SL].[Customer];