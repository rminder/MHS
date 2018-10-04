
CREATE VIEW [SF].[vwSVMXC__Service_Group__c]
AS
SELECT
	[Id]
   ,ISNULL([OwnerId], '')							  AS OwnerId
   ,[IsDeleted]
   ,ISNULL([Name], '')								  AS Name
   ,ISNULL([RecordTypeId], '')						  AS RecordTypeId
   ,[CreatedDate]
   ,ISNULL([CreatedById], '')						  AS CreatedById
   ,[LastModifiedDate]
   ,ISNULL([LastModifiedById], '')					  AS LastModifiedById
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,[SVMXC__Active__c]								  AS IsActive
   ,ISNULL([SVMXC__City__c], '')					  AS City
   ,ISNULL([SVMXC__Country__c], '')					  AS Country
   ,ISNULL([SVMXC__Description__c], '')				  AS Description
   ,ISNULL([SVMXC__Email__c], '')					  AS Email
   ,ISNULL([SVMXC__Group_Code__c], '')				  AS GroupCode
   ,ISNULL([SVMXC__Group_Type__c], '')				  AS GroupType
   ,[SVMXC__Latitude__c]							  AS Latitude
   ,[SVMXC__Longitude__c]							  AS Longitude
   ,ISNULL([SVMXC__Phone__c], '')					  AS Phone
   ,[SVMXC__Select__c]								  AS [Select]
   ,ISNULL([SVMXC__State__c], '')					  AS State
   ,ISNULL([SVMXC__Street__c], '')					  AS Street
   ,ISNULL([SVMXC__Zip__c], '')						  AS Zip
   ,ISNULL([Super_Center__c], '')					  AS SuperCenter
   ,ISNULL([Segment__c], '')						  AS Segment
   ,ISNULL([Company_Code__c], '')					  AS CompanyCode
   ,ISNULL([Company__c], '')						  AS Company
   ,ISNULL([Company_Legal_Name__c], '')				  AS CompanyLegalName
   ,ISNULL([SVMXC__Optimizer_Connection_Name__c], '') AS OptimizerConnectionName
   ,[LastModifiedDate]								  AS LastUpdate
   ,GETUTCDATE()									  AS ImportDate
FROM [SF].[SVMXC__Service_Group__c];