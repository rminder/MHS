CREATE VIEW [SL].[vwVendor]
AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM(City)		  AS City
   ,RTRIM(ClassID)	  AS ClassId
   ,RTRIM([Country])  AS Country
   ,RTRIM([Name])	  AS Name
   ,RTRIM([VendId]) AS VendorId
   ,RTRIM([State])	  AS State
   ,RTRIM([Zip])	  AS Zip
   ,[Status]		  AS [Status]
   ,[LUpd_DateTime]	  AS LastUpdate
   ,[RowVersion]	 AS [RowVersion]
   ,GETUTCDATE()	  AS ImportDate
FROM [SL].[Vendor];