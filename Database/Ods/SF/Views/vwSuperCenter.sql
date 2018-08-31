CREATE VIEW SF.vwSuperCenter
AS
SELECT
	[RowId]
   ,[Id]
   ,[OwnerId]
   ,[IsDeleted]
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

