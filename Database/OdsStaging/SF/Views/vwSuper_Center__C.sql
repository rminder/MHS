CREATE VIEW SF.vwSuper_Center__C
AS
SELECT
	[Id]
   ,ISNULL([OwnerId],'') AS OwnerId
   ,[IsDeleted]
   ,ISNULL([Name],'') AS [Name]
   ,[CreatedDate]
   ,ISNULL([CreatedById],'') AS CreatedById
   ,[LastModifiedDate]
   ,ISNULL([LastModifiedById],'') AS LastModifiedById
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,[Projected_Equipment_Revenue_to_Target__c] AS ProjectedEquipmentRevenueToTarget
   ,[Projected_Service_Revenue_to_Targe__c] AS ProjectedServiceRevenueToTarget
   ,[Projected_Total_Equipment_Revenue__c] AS ProjectedTotalEquipmentRevenue
   ,[Projected_Total_Service_Revenue__c] AS ProjectedTotalServiceRevenue
   ,[Total_Equipment_Gross_Profit_Actual__c] AS TotalEquipmentGrossProfitActual
   ,[Total_Equipment_Revenue_Actual__c] AS TotalEquipmentRevenueActual
   ,[Total_Service_Gross_Profit_Actual__c] AS TotalServiceGrossProfitActual
   ,[Total_Service_Revenue_Actual__c] AS TotalServiceRevenueActual
   ,[Total_Monthly_Sales_Average__c] AS TotalMonthlySalesAverage
   ,[Total_Monthly_Sales_Average_Target__c] AS TotalMonthlySalesAverageTarget
   ,[Adjusted_Total_MSA_Target__c] AS AdjustedTotalMsaTarget
   ,[LastModifiedDate] AS LastUpdate
   ,GETUTCDATE() AS ImportDate
FROM [SF].[Super_Center__c];