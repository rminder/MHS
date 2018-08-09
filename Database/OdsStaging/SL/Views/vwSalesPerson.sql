CREATE VIEW [SL].[vwSalesPerson]
AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM(City)		   AS City
   ,RTRIM([Country])   AS Country
   ,RTRIM([Name])	   AS Name
   ,RTRIM([SlsperId])  AS SalesPersonId
   ,RTRIM([State])	   AS State
   ,RTRIM([Territory]) AS Territory
   ,[LUpd_DateTime]	   AS LastUpdate
   ,GETUTCDATE()	   AS ImportDate
FROM [SL].[Salesperson];