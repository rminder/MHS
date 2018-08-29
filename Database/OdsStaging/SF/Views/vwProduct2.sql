CREATE VIEW SF.vwProduct2 AS

SELECT
	[Id]
   ,ISNULL([Name], '')						   AS Name
   ,ISNULL([ProductCode], '')				   AS ProductCode
   ,ISNULL([Description], '')				   AS Description
   ,[IsActive]
   ,[CreatedDate]
   ,ISNULL([CreatedById], '')				   AS CreatedById
   ,[LastModifiedDate]
   ,ISNULL([LastModifiedById], '')			   AS LastModifiedById
   ,[SystemModstamp]
   ,ISNULL([Family], '')					   AS Family
   ,ISNULL([RecordTypeId], '')				   AS RecordTypeId
   ,ISNULL([ExternalDataSourceId], '')		   AS ExternalDataSourceId
   ,ISNULL([ExternalId], '')				   AS ExternalId
   ,ISNULL([DisplayUrl], '')				   AS DisplayUrl
   ,ISNULL([QuantityUnitOfMeasure], '')		   AS QuantityUnitOfMeasure
   ,[IsDeleted]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,[SVMXC__Enable_Serialized_Tracking__c]	   AS ServiceMaxEnableSerializedTracking
   ,[SVMXC__Inherit_Parent_Warranty__c]		   AS ServiceMaxInheritParentWarranty
   ,[SVMXC__Product_Cost__c]				   AS ServiceMaxProductCost
   ,ISNULL([SVMXC__Product_Line__c], '')	   AS ServiceMaxProductLine
   ,[SVMXC__Select__c]						   AS ServiceMaxSelect
   ,[SVMXC__Stockable__c]					   AS ServiceMaxStockable
   ,ISNULL([SVMXC__Tracking__c], '')		   AS ServiceMaxTracking
   ,ISNULL([SVMXC__Unit_Of_Measure__c], '')	   AS ServiceMaxUnitOfMeasure
   ,[SVMXC__Replacement_Available__c]		   AS ServiceMaxReplacementAvailable
   ,ISNULL([Capacity__c], '')				   AS Capacity
   ,[High_Usage_Product__c]					   AS HighUsageProduct
   ,ISNULL([Broad__c], '')					   AS Broad
   ,ISNULL([Group__c], '')					   AS [Group]
   ,ISNULL([Type__c], '')					   AS [Type]
   ,ISNULL([Part_Serial_Number__c], '')		   AS PartSerialNumber
   ,ISNULL([Model__c], '')					   AS Model
   ,ISNULL([Make1__c], '')					   AS Make1
   ,ISNULL([UOM__c], '')					   AS UnitOfMeasure
   ,ISNULL([Product_Id__c], '')				   AS ProductId
   ,ISNULL([UNITY_Product_External_Id__c], '') AS UnityProductExternalId
   ,[SSVY_Optimal_Cost__c]					   AS SsvyOptimalCost
   ,[UNITY_Is_Menu_Pricing__c]				   AS UnityIsMenuPricing
   ,ISNULL([UNITY_Asset_Type__c], '')		   AS UnityAssetType
   ,ISNULL([UNITY_Bumper_Thickness__c], '')	   AS UnityBumperThickness
   ,ISNULL([SVMXC__Product_Type__c], '')	   AS ServiceMaxProductType
   ,[UNITY_Is_Stockable__c]					   AS UnityIsStockable
   ,[LastModifiedDate] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SF].[Product2];