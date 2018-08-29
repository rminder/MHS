CREATE VIEW SF.vwNote
AS
SELECT
	[RowId]
   ,[Id]
   ,[IsDeleted]
   ,[ParentId]
   ,[Title]
   ,[IsPrivate]
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

