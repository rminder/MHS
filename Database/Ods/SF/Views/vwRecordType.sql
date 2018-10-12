CREATE VIEW [SF].[vwRecordType]
AS
SELECT
	[RowId]
   ,[Id]
   ,[Name]
   ,[DeveloperName]
   ,[NamespacePrefix]
   ,[Description]
   ,[BusinessProcessId]
   ,[SobjectType]
   ,IIF([IsActive] = 255, 1, [IsActive]) AS [IsActive]
   ,[CreatedById]
   ,[CreatedDate]
   ,[LastModifiedById]
   ,[LastModifiedDate]
   ,[SystemModstamp]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SF].[RecordType]
GO
GRANT SELECT
    ON OBJECT::[SF].[vwRecordType] TO [OdsUser]
    AS [dbo];

