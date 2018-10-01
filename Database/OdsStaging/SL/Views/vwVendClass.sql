CREATE VIEW [SL].[vwVendClass] AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	RTRIM([ClassId]) AS ClassId
   ,RTRIM([Descr]) AS Description
   ,[RowVersion]	 AS [RowVersion]   
   ,[LUpd_DateTime] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM SL.VendClass;