
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
GO
GRANT SELECT
    ON OBJECT::[SL].[vwCustomerClass] TO [OdsUser]
    AS [dbo];

