CREATE VIEW [SF].[vwSuperCenter]
AS
SELECT
	[RowId]
   ,[Id]
   ,[OwnerId]
   ,IIF([IsDeleted] = 255, 1, [IsDeleted]) AS [IsDeleted]
   ,[Name]
   ,[CreatedDate]
   ,[CreatedById]
   ,[LastModifiedDate]
   ,[LastModifiedById]
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,[ProjectedEquipmentRevenueToTarget]
   ,[ProjectedServiceRevenueToTarget]
   ,[ProjectedTotalEquipmentRevenue]
   ,[ProjectedTotalServiceRevenue]
   ,[TotalEquipmentGrossProfitActual]
   ,[TotalEquipmentRevenueActual]
   ,[TotalServiceGrossProfitActual]
   ,[TotalServiceRevenueActual]
   ,[TotalMonthlySalesAverage]
   ,[TotalMonthlySalesAverageTarget]
   ,[AdjustedTotalMSATarget]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SF].[SuperCenter];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwSuperCenter] TO [OdsUser]
    AS [dbo];

