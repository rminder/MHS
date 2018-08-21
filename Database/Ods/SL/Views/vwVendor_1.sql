Create View SL.vwVendor AS
SELECT 
	[RowId]
	,[City]
	,[ClassId]
	,[Country]
	,[Name]
	,[State]
	,[Status]
	,[VendorId]
	,[Zip]
	,[LastUpdate]
	,[ImportDate]
	,[ValidFrom]
	,[ValidTo]
  FROM [SL].[Vendor]
GO
GRANT SELECT
    ON OBJECT::[SL].[vwVendor] TO [OdsUser]
    AS [dbo];

