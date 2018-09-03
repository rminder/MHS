CREATE VIEW SF.vwRecordType
AS
SELECT
	[Id]
   ,ISNULL([Name], '')				AS Name
   ,ISNULL([DeveloperName], '')		AS DeveloperName
   ,ISNULL([NamespacePrefix], '')	AS NamespacePrefix
   ,ISNULL([Description], '')		AS Description
   ,ISNULL([BusinessProcessId], '') AS BusinessProcessId
   ,ISNULL([SobjectType], '')		AS SobjectType
   ,[IsActive]
   ,ISNULL([CreatedById], '')		AS CreatedById
   ,[CreatedDate]
   ,ISNULL([LastModifiedById], '')	AS LastModifiedById
   ,[LastModifiedDate]
   ,[SystemModstamp]
   ,[LastModifiedDate] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SF].[RecordType];