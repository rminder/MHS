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