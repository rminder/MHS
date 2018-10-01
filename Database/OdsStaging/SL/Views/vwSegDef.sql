CREATE VIEW [SL].[vwSegDef]
AS

--
-- This view is intended to read rows from the Ods Staging table and
-- map the columns to match the Ods table. Among other potential uses
-- it's used in the SSIS package that brings data into ODS.
--

SELECT
	Active
   ,RTRIM([Description])	AS Description
   ,RTRIM([FieldClass])		AS FieldClass
   ,RTRIM([FieldClassName]) AS FieldClassName
   ,RTRIM([ID])				AS Id
   ,RTRIM([SegNumber])		AS SegmentNumber
   ,[LUpd_DateTime]			AS LastUpdate
   ,[RowVersion]	        AS [RowVersion]   
   ,GETUTCDATE()			AS ImportDate
FROM [SL].[SegDef];