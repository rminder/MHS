CREATE View SL.vwAccountHash AS
SELECT  
	T.Account,
    HASHBYTES('SHA1',(
        SELECT  
			 [Account]
			,[AccountType]
			,[AccountCategory]
			,[AccountCategorySpecified]
			,[Active]
			,[ClassId]
			,[ConsolidationAccount]
			,[CurrencyId]
			,[Description]
			,[RatioGroup]
			,[LastUpdate]
			,[IsSummarized]
        FROM OdsStaging.SL.vwAccount as T2
        Where T2.Account = T.Account
        FOR XML RAW
    )) as  RowHash
From OdsStaging.SL.vwAccount as T;