Create View SL.vwSubaccount AS

SELECT [RowId]
      ,[SubaccountId]
      ,[IsActive]
      ,[Description]
      ,[LastUpdate]
      ,[ImportDate]
      ,[ValidFrom]
      ,[ValidTo]
  FROM [SL].[Subaccount]
GO
GRANT SELECT
    ON OBJECT::[SL].[vwSubaccount] TO [OdsUser]
    AS [dbo];

