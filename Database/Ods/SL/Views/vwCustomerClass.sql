
CREATE VIEW [SL].[vwCustomerClass]
AS
SELECT
	[RowId]
   ,[ClassId]
   ,[Description]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[CustomerClass];