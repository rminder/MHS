Create View SL.vwVendorClass As

SELECT 
	 [RowId]
	,[ClassId]
	,[Description]
	,[LastUpdate]
	,[ImportDate]
	,[ValidFrom]
	,[ValidTo]
  FROM [SL].[VendorClass]
GO
GRANT SELECT
    ON OBJECT::[SL].[vwVendorClass] TO [OdsUser]
    AS [dbo];

