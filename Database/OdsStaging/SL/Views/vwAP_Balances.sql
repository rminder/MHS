Create View [SL].[vwAP_Balances] AS

SELECT 
	 RTRIM([CpnyID]) as CompanyId
	,[CurrBal] as CurrentBalance
	,[CuryID] as CurrencyId
	,[CYBox00] as CurrentYear1099Box00
	,[CYBox01] as CurrentYear1099Box01
	,[CYBox02] as CurrentYear1099Box02
	,[CYBox03] as CurrentYear1099Box03
	,[CYBox04] as CurrentYear1099Box04
	,[CYBox05] as CurrentYear1099Box05
	,[CYBox06] as CurrentYear1099Box06
	,[CYBox07] as CurrentYear1099Box07
	,[CYBox08] as CurrentYear1099Box08
	,[CYBox09] as CurrentYear1099Box09
	,[CYBox10] as CurrentYear1099Box10
	,[CYBox11] as CurrentYear1099Box11
	,[CYBox12] as CurrentYear1099Box12
	,[CYBox13] as CurrentYear1099Box13
	,[CYBox14] as CurrentYear1099Box14
	,[CYInterest] as CurrentYear1099Interest
	,[FutureBal] as FutureBalance
	,[LastChkDate] as LastCheckDate
	,[LastVODate] as LastVoucherDate
	,RTRIM([NoteID]) as NoteId
	,[NYBox00] as NextYear1099Box00
	,[NYBox01] as NextYear1099Box01
	,[NYBox02] as NextYear1099Box02
	,[NYBox03] as NextYear1099Box03
	,[NYBox04] as NextYear1099Box04
	,[NYBox05] as NextYear1099Box05
	,[NYBox06] as NextYear1099Box06
	,[NYBox07] as NextYear1099Box07
	,[NYBox08] as NextYear1099Box08
	,[NYBox09] as NextYear1099Box09
	,[NYBox10] as NextYear1099Box10
	,[NYBox11] as NextYear1099Box11
	,[NYBox12] as NextYear1099Box12
	,[NYBox13] as NextYear1099Box13
	,[NYBox14] as NextYear1099Box14
	,[NYInterest] as NextYear1099Interest
	,[PerNbr] as PeriodNumber
	,RTRIM([VendID]) as VendorId
	,[LUpd_DateTime] AS LastUpdate
	,GETUTCDATE() AS ImportDate
FROM [SL].[AP_Balances]