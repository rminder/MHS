CREATE VIEW [SF].[vwNote]
AS
SELECT
	[RowId]
   ,[Id]
   ,IIF([IsDeleted] = 255, 1, [IsDeleted]) AS [IsDeleted]
   ,[ParentId]
   ,[Title]
   ,IIF([IsPrivate] = 255, 1, [IsPrivate]) AS [IsPrivate]
   ,[Body]
   ,[OwnerId]
   ,[CreatedDate]
   ,[CreatedById]
   ,[LastModifiedDate]
   ,[LastModifiedById]
   ,[SystemModstamp]
   ,[UnityAgentId]
   ,[LastUpdate]
   ,[ImportDate]
FROM [SF].[Note];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwNote] TO [OdsUser]
    AS [dbo];

