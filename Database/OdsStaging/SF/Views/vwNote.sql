
CREATE VIEW [SF].[vwNote]
AS
SELECT
	[Id]
   ,[IsDeleted]
   ,[ParentId]
   ,ISNULL([Title],'') AS Title
   ,[IsPrivate]
   ,ISNULL([Body],'') AS Body
   ,ISNULL([OwnerId],'') AS OwnerId
   ,[CreatedDate]
   ,ISNULL([CreatedById],'') AS CreatedById
   ,[LastModifiedDate]
   ,ISNULL([LastModifiedById],'') AS LastModifiedById
   ,[SystemModstamp]
   ,ISNULL([User_Owner_UNITY_Agent_ID__c],'') AS UnityAgentId
   ,[LastModifiedDate] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SF].[Note];