-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 05-September, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[AccountGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[AccountGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [NVARCHAR](18) NOT NULL,
	[IsDeleted] [TINYINT] NULL,
	[MasterRecordId] [NVARCHAR](18) NOT NULL,
	[Name] [NVARCHAR](255) NOT NULL,
	[Type] [NVARCHAR](40) NOT NULL,
	[RecordTypeId] [NVARCHAR](18) NOT NULL,
	[ParentId] [NVARCHAR](18) NOT NULL,
	[BillingStreet] [NVARCHAR](255) NOT NULL,
	[BillingCity] [NVARCHAR](40) NOT NULL,
	[BillingState] [NVARCHAR](80) NOT NULL,
	[BillingPostalCode] [NVARCHAR](20) NOT NULL,
	[BillingCountry] [NVARCHAR](80) NOT NULL,
	[BillingStateCode] [NVARCHAR](10) NOT NULL,
	[BillingCountryCode] [NVARCHAR](10) NOT NULL,
	[BillingLatitude] [DECIMAL](32, 16) NULL,
	[BillingLongitude] [DECIMAL](32, 16) NULL,
	[ShippingStreet] [NVARCHAR](255) NOT NULL,
	[ShippingCity] [NVARCHAR](40) NOT NULL,
	[ShippingState] [NVARCHAR](80) NOT NULL,
	[ShippingPostalCode] [NVARCHAR](20) NOT NULL,
	[ShippingCountry] [NVARCHAR](80) NOT NULL,
	[ShippingStateCode] [NVARCHAR](10) NOT NULL,
	[ShippingCountryCode] [NVARCHAR](10) NOT NULL,
	[ShippingLatitude] [DECIMAL](32, 16) NULL,
	[ShippingLongitude] [DECIMAL](32, 16) NULL,
	[Phone] [NVARCHAR](40) NOT NULL,
	[Fax] [NVARCHAR](40) NOT NULL,
	[Website] [NVARCHAR](255) NOT NULL,
	[Industry] [NVARCHAR](40) NOT NULL,
	[AnnualRevenue] [DECIMAL](32, 16) NULL,
	[NumberOfEmployees] [INT] NULL,
	[Description] [NVARCHAR](MAX) NOT NULL,
	[Site] [NVARCHAR](80) NOT NULL,
	[OwnerId] [NVARCHAR](18) NOT NULL,
	[CreatedDate] [DATETIME2](7) NULL,
	[CreatedById] [NVARCHAR](18) NOT NULL,
	[LastModifiedDate] [DATETIME2](7) NULL,
	[LastModifiedById] [NVARCHAR](18) NOT NULL,
	[SystemModstamp] [DATETIME2](7) NULL,
	[LastActivityDate] [DATETIME2](7) NULL,
	[LastViewedDate] [DATETIME2](7) NULL,
	[LastReferencedDate] [DATETIME2](7) NULL,
	[IsCustomerPortal] [TINYINT] NULL,
	[Jigsaw] [NVARCHAR](20) NOT NULL,
	[JigsawCompanyId] [NVARCHAR](20) NOT NULL,
	[AccountSource] [NVARCHAR](40) NOT NULL,
	[SicDescription] [NVARCHAR](80) NOT NULL,
	[ServiceMaxAccess_Hours] [NVARCHAR](18) NOT NULL,
	[ServiceMaxBusiness_Hours] [NVARCHAR](18) NOT NULL,
	[ServiceMaxPreferred_Technician] [NVARCHAR](18) NOT NULL,
	[ServiceMaxLatitude] [DECIMAL](32, 16) NULL,
	[ServiceMaxLongitude] [DECIMAL](32, 16) NULL,
	[AccountStatus] [NVARCHAR](255) NOT NULL,
	[AccountFax] [NVARCHAR](40) NOT NULL,
	[AccountEmail] [NVARCHAR](80) NOT NULL,
	[ShippingPhone] [NVARCHAR](40) NOT NULL,
	[ShippingFax] [NVARCHAR](40) NOT NULL,
	[ShippingEmail] [NVARCHAR](80) NOT NULL,
	[PrimaryEquipmentAssetFee] [DECIMAL](32, 16) NULL,
	[AncillaryEquipmentAssetFee] [DECIMAL](32, 16) NULL,
	[SalesTerritoryId] [NVARCHAR](15) NOT NULL,
	[LaborRateStandard] [DECIMAL](32, 16) NULL,
	[AccountsReceivableCustomerAccount] [NVARCHAR](15) NOT NULL,
	[Salesperson] [NVARCHAR](18) NOT NULL,
	[TemporaryAccount] [TINYINT] NULL,
	[WorkTypes] [NVARCHAR](MAX) NOT NULL,
	[LaborRatePremium] [DECIMAL](32, 16) NULL,
	[NumbeOfLocations] [DECIMAL](32, 16) NULL,
	[BusinessUnit] [NVARCHAR](255) NOT NULL,
	[Organization] [NVARCHAR](255) NOT NULL,
	[NteThreshold] [DECIMAL](32, 16) NULL,
	[PrimaryContact] [NVARCHAR](50) NOT NULL,
	[PrimaryContactEmail] [NVARCHAR](80) NOT NULL,
	[LaborRateTwoMan] [DECIMAL](32, 16) NULL,
	[AccountCellPhone] [NVARCHAR](40) NOT NULL,
	[VendorId] [NVARCHAR](10) NOT NULL,
	[MaterialHandlingGeneralLedgerAccount] [NVARCHAR](10) NOT NULL,
	[LeadSourceMarketing] [NVARCHAR](255) NOT NULL,
	[MaterialHandlingCreditLimit] [DECIMAL](32, 16) NULL,
	[MaterialHandlingSlCustomerId] [NVARCHAR](15) NOT NULL,
	[MaterialHandlingTerms] [NVARCHAR](2) NOT NULL,
	[MaterialHandlingAttention] [NVARCHAR](30) NOT NULL,
	[CustomerIdLegacy] [NVARCHAR](50) NOT NULL,
	[MaterialHandlingPrimaryContact] [NVARCHAR](18) NOT NULL,
	[PrimaryContactSalutation] [NVARCHAR](30) NOT NULL,
	[AverageDaysToPay] [DECIMAL](32, 16) NULL,
	[MaterialHandlingTaxSchedule] [NVARCHAR](8) NOT NULL,
	[MaterialHandlingBillingContact] [NVARCHAR](18) NOT NULL,
	[MaterialHandlingCreditHold] [TINYINT] NULL,
	[MaterialHandlingCurrentBalance] [DECIMAL](32, 16) NULL,
	[MaterialHandlingCustomerType] [NVARCHAR](4) NOT NULL,
	[MaterialHandlingEmailStatements] [TINYINT] NULL,
	[MaterialHandlingGeneralLedgerSubAccountId] [NVARCHAR](24) NULL,
	[AccountsPayableAccount] [NVARCHAR](10) NOT NULL,
	[AccountsPayableSubaccountId] [NVARCHAR](24) NULL,
	[LaborPmRateDdm] [DECIMAL](32, 16) NULL,
	[LaborPmRateMhe] [DECIMAL](32, 16) NULL,
	[Labor_StandardDdm] [DECIMAL](32, 16) NULL,
	[Labor_StandardMhe] [DECIMAL](32, 16) NULL,
	[Labor2ManDdm] [DECIMAL](32, 16) NULL,
	[Labor2ManMhe] [DECIMAL](32, 16) NULL,
	[LaborOtdDmDdm] [DECIMAL](32, 16) NULL,
	[LaborOtmHeMhe] [DECIMAL](32, 16) NULL,
	[LaborDtmHeMhe] [DECIMAL](32, 16) NULL,
	[LaborDtdDmDdm] [DECIMAL](32, 16) NULL,
	[AccountsReceivableDivisionNumber] [NVARCHAR](5) NOT NULL,
	[Company] [NVARCHAR](5) NOT NULL,
	[RemitAddress] [NVARCHAR](255) NOT NULL,
	[RemitCity] [NVARCHAR](30) NOT NULL,
	[RemitStateProvince] [NVARCHAR](20) NOT NULL,
	[RemitZipCode] [NVARCHAR](11) NOT NULL,
	[RemitCountry] [NVARCHAR](25) NOT NULL,
	[CustomerNotes] [NVARCHAR](MAX) NOT NULL,
	[SlVendorId] [NVARCHAR](15) NOT NULL,
	[BillingAttention] [NVARCHAR](30) NOT NULL,
	[BillingName] [NVARCHAR](255) NOT NULL,
	[RemitName] [NVARCHAR](255) NOT NULL,
	[RemitPhone] [NVARCHAR](40) NOT NULL,
	[AvailableCredit] [DECIMAL](32, 16) NULL,
	[CreditRule] [NVARCHAR](2) NOT NULL,
	[MinerSalesperson] [NVARCHAR](18) NOT NULL,
	[CustomerTypeMarketingSegmets] [NVARCHAR](255) NOT NULL,
	[TirePress] [TINYINT] NULL,
	[Salesperson2] [NVARCHAR](18) NOT NULL,
	[DeliveryVehicles] [NVARCHAR](MAX) NOT NULL,
	[Grade1] [NVARCHAR](255) NOT NULL,
	[Grade2] [NVARCHAR](255) NOT NULL,
	[AffiliateGrade] [NVARCHAR](MAX) NOT NULL,
	[Docks] [TINYINT] NULL,
	[Doors] [TINYINT] NULL,
	[CustomerServiceRepresentativeCsr] [TINYINT] NULL,
	[Oem] [NVARCHAR](255) NOT NULL,
	[ScissorBoomOem] [NVARCHAR](255) NOT NULL,
	[DeletedAccountId] [NVARCHAR](18) NOT NULL,
	[FaxIteration] [NVARCHAR](MAX) NOT NULL,
	[PhoneIteration] [NVARCHAR](MAX) NOT NULL,
	[PayTerms] [NVARCHAR](MAX) NOT NULL,
	[DrawDate] [NVARCHAR](255) NOT NULL,
	[Retainage] [DECIMAL](32, 16) NULL,
	[OemAffiliation] [NVARCHAR](255) NOT NULL,
	[VendorExpenseType] [NVARCHAR](255) NOT NULL,
	[AccountParentSlVendorId] [NVARCHAR](15) NOT NULL,
	[ReadyToConvert] [TINYINT] NULL,
	[Affiliate] [TINYINT] NULL,
	[ParentAffiliate] [NVARCHAR](18) NOT NULL,
	[AccountCount] [DECIMAL](32, 16) NULL,
	[DunsNumber] [NVARCHAR](9) NOT NULL,
	[Tradestyle] [NVARCHAR](255) NOT NULL,
	[NaicsCode] [NVARCHAR](8) NOT NULL,
	[NaicsDesc] [NVARCHAR](120) NOT NULL,
	[YearStarted] [NVARCHAR](4) NOT NULL,
	[ResIdential] [TINYINT] NULL,
	[OpportunityTrade] [NVARCHAR](MAX) NOT NULL,
	[AccountParentMaterialHandlingSlCustomerId] [NVARCHAR](15) NOT NULL,
	[AccountApprover] [NVARCHAR](18) NOT NULL,
	[PhotoUrl] [NVARCHAR](255) NOT NULL,
	[UnityUserOwnerAgentId] [NVARCHAR](18) NOT NULL,
	[IsPartner] [TINYINT] NULL,
	[AccountNumber] [NVARCHAR](40) NOT NULL,
	[Sic] [NVARCHAR](20) NOT NULL,
	[Ownership] [NVARCHAR](40) NOT NULL,
	[TickerSymbol] [NVARCHAR](20) NOT NULL,
	[Rating] [NVARCHAR](40) NOT NULL,
	[AllInPmRateElectric] [DECIMAL](32, 16) NULL,
	[AllInPmRatePropane] [DECIMAL](32, 16) NULL,
	[ContractPaint] [TINYINT] NULL,
	[DeliveryCapability] [TINYINT] NULL,
	[MobileTirePressure] [TINYINT] NULL,
	[NumberOfServiceVans] [DECIMAL](32, 16) NULL,
	[NumberOfTechs] [DECIMAL](32, 16) NULL,
	[OpportunityPending] [TINYINT] NULL,
	[PmRate] [DECIMAL](32, 16) NULL,
	[PaintBooth] [TINYINT] NULL,
	[PartsDept] [TINYINT] NULL,
	[Propane] [TINYINT] NULL,
	[Refurbished] [TINYINT] NULL,
	[ServiceBatteries] [TINYINT] NULL,
	[ServiceRate] [DECIMAL](32, 16) NULL,
	[TirePressure3rdParty] [TINYINT] NULL,
	[TripCharge] [DECIMAL](32, 16) NULL,
	[TripFee] [TINYINT] NULL,
	[X24HourEmergencyRepair] [TINYINT] NULL,
	[SalespersonSecond] [NVARCHAR](18) NOT NULL,
	[Certificate] [NVARCHAR](25) NOT NULL,
	[FsoActive] [NVARCHAR](255) NOT NULL,
	[SuperCenter] [NVARCHAR](18) NOT NULL,
	[TaxId] [NVARCHAR](9) NOT NULL,
	[FsoCustomerPriority] [NVARCHAR](255) NOT NULL,
	[FsoNumberofLocations] [DECIMAL](32, 16) NULL,
	[FsoSlaExpirationDate] [DATETIME2](7) NULL,
	[FsoSlaSerialNumber] [NVARCHAR](10) NOT NULL,
	[FsoSla] [NVARCHAR](255) NOT NULL,
	[FsoUpsellOpportunity] [NVARCHAR](255) NOT NULL,
	[AccountLoop] [NVARCHAR](18) NOT NULL,
	[BuUniqueField] [NVARCHAR](255) NOT NULL,
	[SlCompanyId] [NVARCHAR](3) NOT NULL,
	[SsvyLastVisitedDate] [DATETIME2](7) NULL,
	[SsvyTotalAssets] [DECIMAL](32, 16) NULL,
	[SsvyTotalSiteSurveysCompleted] [DECIMAL](32, 16) NULL,
	[TimeZoneOffset] [NVARCHAR](255) NOT NULL,
	[UnityAccountExternalId] [NVARCHAR](80) NOT NULL,
	[UnityAccountId] [NVARCHAR](30) NOT NULL,
	[UnityAccountRoutingId] [NVARCHAR](6) NOT NULL,
	[UnityAgentWorkDay] [NVARCHAR](MAX) NOT NULL,
	[UnityAgentWorkHourEndTime] [NVARCHAR](5) NOT NULL,
	[UnityAgentWorkHourStartTime] [NVARCHAR](5) NOT NULL,
	[UnityAutomobileLiabilityExpiry] [DATETIME2](7) NULL,
	[UnityAutomobileLiability] [TINYINT] NULL,
	[UnityBillToAccount] [NVARCHAR](18) NOT NULL,
	[UnityBillToHq] [TINYINT] NULL,
	[UnityBundling_Requirements] [NVARCHAR](255) NOT NULL,
	[UnityBusinessUnit] [NVARCHAR](255) NOT NULL,
	[UnityCompanyCode] [NVARCHAR](5) NOT NULL,
	[UnityCustomerSize] [NVARCHAR](255) NOT NULL,
	[UnityCustomerTeam] [NVARCHAR](255) NOT NULL,
	[UnityDispatcher] [NVARCHAR](18) NOT NULL,
	[UnityDoNotUseFlaggedDate] [DATETIME2](7) NULL,
	[UnityDoNotUseReason] [NVARCHAR](255) NOT NULL,
	[UnityDoNotUse] [TINYINT] NULL,
	[UnityFridayEndTime] [NVARCHAR](5) NOT NULL,
	[UnityFridayStartTime] [NVARCHAR](5) NOT NULL,
	[UnityGeneralLiabilityExpiry] [DATETIME2](7) NULL,
	[UnityGeneralLiability] [TINYINT] NULL,
	[UnityHasPreferredPart] [TINYINT] NULL,
	[UnityHoursOfOperationSummary] [NVARCHAR](MAX) NOT NULL,
	[UnityHoursOfOperation] [NVARCHAR](MAX) NOT NULL,
	[UnityIRS_ValIdated] [TINYINT] NULL,
	[UnityIvrPhoneNumber] [NVARCHAR](40) NOT NULL,
	[UnityIvrPin] [NVARCHAR](8) NOT NULL,
	[UnityInstallationFloaterLiability] [TINYINT] NULL,
	[UnityInstallationFltLiabilityExpiry] [DATETIME2](7) NULL,
	[UnityIsAccountsReceivable] [TINYINT] NULL,
	[UnityLoc] [NVARCHAR](20) NOT NULL,
	[UnityMinerRegionalOffice] [TINYINT] NULL,
	[UnityMondayEndTime] [NVARCHAR](5) NOT NULL,
	[UnityMondayStartTime] [NVARCHAR](5) NOT NULL,
	[UnityOffHourQueue] [NVARCHAR](60) NOT NULL,
	[UnityPassword] [NVARCHAR](174) NOT NULL,
	[UnityPortalURL] [NVARCHAR](255) NOT NULL,
	[UnityPreferred_Vendor] [TINYINT] NULL,
	[UnityRentedEquipmentLiabilityExpiry] [DATETIME2](7) NULL,
	[UnityRentedEquipmentLiability] [TINYINT] NULL,
	[UnitySkillId2] [NVARCHAR](6) NOT NULL,
	[UnitySsn] [NVARCHAR](11) NOT NULL,
	[UnitySaturdayEndTime] [NVARCHAR](5) NOT NULL,
	[UnitySaturdayStartTime] [NVARCHAR](5) NOT NULL,
	[UnityServiceChannelIvr] [TINYINT] NULL,
	[UnityServiceContract] [NVARCHAR](18) NOT NULL,
	[UnityShippingLocationLatitude] [DECIMAL](32, 16) NULL,
	[UnityShippingLocationLongitude] [DECIMAL](32, 16) NULL,
	[UnitySignature_Required] [TINYINT] NULL,
	[UnitySkillId] [NVARCHAR](6) NOT NULL,
	[UnitySubscriberId] [NVARCHAR](20) NOT NULL,
	[UnitySundayEndTime] [NVARCHAR](5) NOT NULL,
	[UnitySundayStartTime] [NVARCHAR](5) NOT NULL,
	[UnitySupportEmailAddress] [NVARCHAR](80) NOT NULL,
	[UnityTaxExempt] [TINYINT] NULL,
	[UnityTaxId] [NVARCHAR](10) NOT NULL,
	[UnityThursdayEndTime] [NVARCHAR](5) NOT NULL,
	[UnityThursdayStartTime] [NVARCHAR](5) NOT NULL,
	[UnityTierLevel] [NVARCHAR](255) NOT NULL,
	[UnityTimeZoneSidKey] [NVARCHAR](255) NOT NULL,
	[UnityTuesdayEndTime] [NVARCHAR](5) NOT NULL,
	[UnityTuesdayStartTime] [NVARCHAR](5) NOT NULL,
	[UnityUmbrellaLiabilityExpiry] [DATETIME2](7) NULL,
	[UnityUmbrellaLiability] [TINYINT] NULL,
	[UnityUsername] [NVARCHAR](255) NOT NULL,
	[UnityVendorScorePm] [DECIMAL](32, 16) NULL,
	[UnityVendorScoreProject] [DECIMAL](32, 16) NULL,
	[UnityVendorScoreSr] [DECIMAL](32, 16) NULL,
	[UnityVendorScoreSs] [DECIMAL](32, 16) NULL,
	[UnityVendorStatus] [NVARCHAR](255) NOT NULL,
	[UnityVendorTypePm] [TINYINT] NULL,
	[UnityVendorTypeProject] [TINYINT] NULL,
	[UnityVendorTypeSr] [TINYINT] NULL,
	[UnityVendorTypeSs] [TINYINT] NULL,
	[UnityW9] [TINYINT] NULL,
	[UnityWednesdayEndTime] [NVARCHAR](5) NOT NULL,
	[UnityWednesdayStartTime] [NVARCHAR](5) NOT NULL,
	[UnityWorkersCompenstationLiabilityExpiry] [DATETIME2](7) NULL,
	[UnityWorkersCompensationLiability] [TINYINT] NULL,
	[UnityMnsCustomerTeam] [NVARCHAR](255) NOT NULL,
	[AccountParentUnityAccountExternalId] [NVARCHAR](80) NOT NULL,
	[UnityDoBusinessAs] [NVARCHAR](255) NOT NULL,
	[Unity0To30PastDue] [DECIMAL](32, 16) NULL,
	[Unity31To60PastDue] [DECIMAL](32, 16) NULL,
	[Unity61To90PastDue] [DECIMAL](32, 16) NULL,
	[Unity90DaysPastDue] [DECIMAL](32, 16) NULL,
	[UnitySlCurrentBalance] [DECIMAL](32, 16) NULL,
	[UnityUltimateParent] [NVARCHAR](18) NOT NULL,
	[UnityTemplateConfiguration] [NVARCHAR](18) NOT NULL,
	[UnityFiscalYearBasedOn] [NVARCHAR](255) NOT NULL,
	[UnityFiscalYearStartMonth] [NVARCHAR](255) NOT NULL,
	[UnityServiceReportTemplate] [NVARCHAR](50) NOT NULL,
	[Unity3rdPartyCustomer] [TINYINT] NULL,
	[BillingGeocodeAccuracy] [NVARCHAR](40) NOT NULL,
	[ShippingGeocodeAccuracy] [NVARCHAR](40) NOT NULL,
	[UnityCompany] [NVARCHAR](MAX) NOT NULL,
	[SlNotesText] [NVARCHAR](MAX) NOT NULL,
	[SlNotes] [NVARCHAR](MAX) NOT NULL,
	[SlPromiseDate] [DATETIME2](7) NULL,
	[MmpfsBuShippingAddress] [NVARCHAR](MAX) NOT NULL,
	[MspGoLiveDate] [DATETIME2](7) NULL,
	[UnityCompanyText] [NVARCHAR](250) NULL,
	[UnityVendorId] [NVARCHAR](20) NOT NULL,
	[MspfsBuBillingAddress] [NVARCHAR](MAX) NOT NULL,
	[MspfsBusinessUnitLegalName] [NVARCHAR](255) NOT NULL,
	[MspfsMSPBillToAccount] [NVARCHAR](18) NOT NULL,
	[UnityVendorManager] [NVARCHAR](18) NOT NULL,
	[UnityHasCommUnityMember] [TINYINT] NULL,
	[UnityRecordTypeName] [NVARCHAR](MAX) NOT NULL,
	[UnityPmPin] [NVARCHAR](4) NOT NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL,
	[__Operation] CHAR(1) NOT NULL,
	[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	DECLARE @DistinctPKValue TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)
	)
	DECLARE @ActivityTable TABLE 
	(
		RowId BIGINT NOT NULL,
		ValidFrom DATETIME2	 NOT NULL,
		ValidTo DATETIME2 NOT NULL,
		RowNumber INT NOT NULL,
		MaxRowNumber INT NOT NULL,
		UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	)
	DECLARE @EndDateTableState TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)	
	)
	DECLARE @InsertUpdateDeleteTable TABLE 
	(
		RowId BIGINT NOT NULL,
		Operation CHAR(1) NOT NULL,
		OperationDate DATETIME2 NOT NULL,
		UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	)

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT RowId
	FROM SF.Account FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.Account
		FOR SYSTEM_TIME AS OF @EndDateUtc T
	INNER JOIN @EndDateTableState T2 ON T2.RowId = T.RowId

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		 T.RowId
		,ValidFrom
		,ValidTo
		,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
		,SUM(1) OVER (PARTITION BY T.RowId) AS MaxRowNumber
	FROM SF.Account FOR SYSTEM_TIME ALL T 
	INNER JOIN @DistinctPKValue T2 ON T2.RowId = T.RowId

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT Into @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
		,'I' AS Operation
		,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE RowNumber = 1 AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc

	-- Store all the deletes. A delete can be identified by a row in @ActivityTable where RowNumber = MaxRowNumber and the row
	-- doesn't exist in @EndDateStateTable
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
	   ,'D'		AS Operation
	   ,ValidTo AS OperationDate
	FROM @ActivityTable				 T
		LEFT JOIN @EndDateTableState T2 ON T2.RowId = T.RowId
	WHERE
		T.RowNumber = T.MaxRowNumber
		AND T2.RowId IS NULL;

	-- Store all updates. An update can be identified by a row whose RowNumber > 1. If a row is inserted and then deleted (with no updates)
	-- there will only be a single row in history. Each time a row is updated, an entry is added to history. Therefore, the total number of
	-- updates for a row will be maximum row number - 1.
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
		,'U' AS Operation
		,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;WITH BaseTableActivity AS
	(
		SELECT 
			 [RowId]
			,[Id]
			,[IsDeleted]
			,[MasterRecordId]
			,[Name]
			,[Type]
			,[RecordTypeId]
			,[ParentId]
			,[BillingStreet]
			,[BillingCity]
			,[BillingState]
			,[BillingPostalCode]
			,[BillingCountry]
			,[BillingStateCode]
			,[BillingCountryCode]
			,[BillingLatitude]
			,[BillingLongitude]
			,[ShippingStreet]
			,[ShippingCity]
			,[ShippingState]
			,[ShippingPostalCode]
			,[ShippingCountry]
			,[ShippingStateCode]
			,[ShippingCountryCode]
			,[ShippingLatitude]
			,[ShippingLongitude]
			,[Phone]
			,[Fax]
			,[Website]
			,[Industry]
			,[AnnualRevenue]
			,[NumberOfEmployees]
			,[Description]
			,[Site]
			,[OwnerId]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[IsCustomerPortal]
			,[Jigsaw]
			,[JigsawCompanyId]
			,[AccountSource]
			,[SicDescription]
			,[ServiceMaxAccess_Hours]
			,[ServiceMaxBusiness_Hours]
			,[ServiceMaxPreferred_Technician]
			,[ServiceMaxLatitude]
			,[ServiceMaxLongitude]
			,[AccountStatus]
			,[AccountFax]
			,[AccountEmail]
			,[ShippingPhone]
			,[ShippingFax]
			,[ShippingEmail]
			,[PrimaryEquipmentAssetFee]
			,[AncillaryEquipmentAssetFee]
			,[SalesTerritoryId]
			,[LaborRateStandard]
			,[AccountsReceivableCustomerAccount]
			,[Salesperson]
			,[TemporaryAccount]
			,[WorkTypes]
			,[LaborRatePremium]
			,[NumbeOfLocations]
			,[BusinessUnit]
			,[Organization]
			,[NteThreshold]
			,[PrimaryContact]
			,[PrimaryContactEmail]
			,[LaborRateTwoMan]
			,[AccountCellPhone]
			,[VendorId]
			,[MaterialHandlingGeneralLedgerAccount]
			,[LeadSourceMarketing]
			,[MaterialHandlingCreditLimit]
			,[MaterialHandlingSlCustomerId]
			,[MaterialHandlingTerms]
			,[MaterialHandlingAttention]
			,[CustomerIdLegacy]
			,[MaterialHandlingPrimaryContact]
			,[PrimaryContactSalutation]
			,[AverageDaysToPay]
			,[MaterialHandlingTaxSchedule]
			,[MaterialHandlingBillingContact]
			,[MaterialHandlingCreditHold]
			,[MaterialHandlingCurrentBalance]
			,[MaterialHandlingCustomerType]
			,[MaterialHandlingEmailStatements]
			,[MaterialHandlingGeneralLedgerSubAccountId]
			,[AccountsPayableAccount]
			,[AccountsPayableSubaccountId]
			,[LaborPmRateDdm]
			,[LaborPmRateMhe]
			,[Labor_StandardDdm]
			,[Labor_StandardMhe]
			,[Labor2ManDdm]
			,[Labor2ManMhe]
			,[LaborOtdDmDdm]
			,[LaborOtmHeMhe]
			,[LaborDtmHeMhe]
			,[LaborDtdDmDdm]
			,[AccountsReceivableDivisionNumber]
			,[Company]
			,[RemitAddress]
			,[RemitCity]
			,[RemitStateProvince]
			,[RemitZipCode]
			,[RemitCountry]
			,[CustomerNotes]
			,[SlVendorId]
			,[BillingAttention]
			,[BillingName]
			,[RemitName]
			,[RemitPhone]
			,[AvailableCredit]
			,[CreditRule]
			,[MinerSalesperson]
			,[CustomerTypeMarketingSegmets]
			,[TirePress]
			,[Salesperson2]
			,[DeliveryVehicles]
			,[Grade1]
			,[Grade2]
			,[AffiliateGrade]
			,[Docks]
			,[Doors]
			,[CustomerServiceRepresentativeCsr]
			,[Oem]
			,[ScissorBoomOem]
			,[DeletedAccountId]
			,[FaxIteration]
			,[PhoneIteration]
			,[PayTerms]
			,[DrawDate]
			,[Retainage]
			,[OemAffiliation]
			,[VendorExpenseType]
			,[AccountParentSlVendorId]
			,[ReadyToConvert]
			,[Affiliate]
			,[ParentAffiliate]
			,[AccountCount]
			,[DunsNumber]
			,[Tradestyle]
			,[NaicsCode]
			,[NaicsDesc]
			,[YearStarted]
			,[ResIdential]
			,[OpportunityTrade]
			,[AccountParentMaterialHandlingSlCustomerId]
			,[AccountApprover]
			,[PhotoUrl]
			,[UnityUserOwnerAgentId]
			,[IsPartner]
			,[AccountNumber]
			,[Sic]
			,[Ownership]
			,[TickerSymbol]
			,[Rating]
			,[AllInPmRateElectric]
			,[AllInPmRatePropane]
			,[ContractPaint]
			,[DeliveryCapability]
			,[MobileTirePressure]
			,[NumberOfServiceVans]
			,[NumberOfTechs]
			,[OpportunityPending]
			,[PmRate]
			,[PaintBooth]
			,[PartsDept]
			,[Propane]
			,[Refurbished]
			,[ServiceBatteries]
			,[ServiceRate]
			,[TirePressure3rdParty]
			,[TripCharge]
			,[TripFee]
			,[X24HourEmergencyRepair]
			,[SalespersonSecond]
			,[Certificate]
			,[FsoActive]
			,[SuperCenter]
			,[TaxId]
			,[FsoCustomerPriority]
			,[FsoNumberofLocations]
			,[FsoSlaExpirationDate]
			,[FsoSlaSerialNumber]
			,[FsoSla]
			,[FsoUpsellOpportunity]
			,[AccountLoop]
			,[BuUniqueField]
			,[SlCompanyId]
			,[SsvyLastVisitedDate]
			,[SsvyTotalAssets]
			,[SsvyTotalSiteSurveysCompleted]
			,[TimeZoneOffset]
			,[UnityAccountExternalId]
			,[UnityAccountId]
			,[UnityAccountRoutingId]
			,[UnityAgentWorkDay]
			,[UnityAgentWorkHourEndTime]
			,[UnityAgentWorkHourStartTime]
			,[UnityAutomobileLiabilityExpiry]
			,[UnityAutomobileLiability]
			,[UnityBillToAccount]
			,[UnityBillToHq]
			,[UnityBundling_Requirements]
			,[UnityBusinessUnit]
			,[UnityCompanyCode]
			,[UnityCustomerSize]
			,[UnityCustomerTeam]
			,[UnityDispatcher]
			,[UnityDoNotUseFlaggedDate]
			,[UnityDoNotUseReason]
			,[UnityDoNotUse]
			,[UnityFridayEndTime]
			,[UnityFridayStartTime]
			,[UnityGeneralLiabilityExpiry]
			,[UnityGeneralLiability]
			,[UnityHasPreferredPart]
			,[UnityHoursOfOperationSummary]
			,[UnityHoursOfOperation]
			,[UnityIRS_ValIdated]
			,[UnityIvrPhoneNumber]
			,[UnityIvrPin]
			,[UnityInstallationFloaterLiability]
			,[UnityInstallationFltLiabilityExpiry]
			,[UnityIsAccountsReceivable]
			,[UnityLoc]
			,[UnityMinerRegionalOffice]
			,[UnityMondayEndTime]
			,[UnityMondayStartTime]
			,[UnityOffHourQueue]
			,[UnityPassword]
			,[UnityPortalURL]
			,[UnityPreferred_Vendor]
			,[UnityRentedEquipmentLiabilityExpiry]
			,[UnityRentedEquipmentLiability]
			,[UnitySkillId2]
			,[UnitySsn]
			,[UnitySaturdayEndTime]
			,[UnitySaturdayStartTime]
			,[UnityServiceChannelIvr]
			,[UnityServiceContract]
			,[UnityShippingLocationLatitude]
			,[UnityShippingLocationLongitude]
			,[UnitySignature_Required]
			,[UnitySkillId]
			,[UnitySubscriberId]
			,[UnitySundayEndTime]
			,[UnitySundayStartTime]
			,[UnitySupportEmailAddress]
			,[UnityTaxExempt]
			,[UnityTaxId]
			,[UnityThursdayEndTime]
			,[UnityThursdayStartTime]
			,[UnityTierLevel]
			,[UnityTimeZoneSidKey]
			,[UnityTuesdayEndTime]
			,[UnityTuesdayStartTime]
			,[UnityUmbrellaLiabilityExpiry]
			,[UnityUmbrellaLiability]
			,[UnityUsername]
			,[UnityVendorScorePm]
			,[UnityVendorScoreProject]
			,[UnityVendorScoreSr]
			,[UnityVendorScoreSs]
			,[UnityVendorStatus]
			,[UnityVendorTypePm]
			,[UnityVendorTypeProject]
			,[UnityVendorTypeSr]
			,[UnityVendorTypeSs]
			,[UnityW9]
			,[UnityWednesdayEndTime]
			,[UnityWednesdayStartTime]
			,[UnityWorkersCompenstationLiabilityExpiry]
			,[UnityWorkersCompensationLiability]
			,[UnityMnsCustomerTeam]
			,[AccountParentUnityAccountExternalId]
			,[UnityDoBusinessAs]
			,[Unity0To30PastDue]
			,[Unity31To60PastDue]
			,[Unity61To90PastDue]
			,[Unity90DaysPastDue]
			,[UnitySlCurrentBalance]
			,[UnityUltimateParent]
			,[UnityTemplateConfiguration]
			,[UnityFiscalYearBasedOn]
			,[UnityFiscalYearStartMonth]
			,[UnityServiceReportTemplate]
			,[Unity3rdPartyCustomer]
			,[BillingGeocodeAccuracy]
			,[ShippingGeocodeAccuracy]
			,[UnityCompany]
			,[SlNotesText]
			,[SlNotes]
			,[SlPromiseDate]
			,[MmpfsBuShippingAddress]
			,[MspGoLiveDate]
			,[UnityCompanyText]
			,[UnityVendorId]
			,[MspfsBuBillingAddress]
			,[MspfsBusinessUnitLegalName]
			,[MspfsMSPBillToAccount]
			,[UnityVendorManager]
			,[UnityHasCommUnityMember]
			,[UnityRecordTypeName]
			,[UnityPmPin]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.Account
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Id]
			,[IsDeleted]
			,[MasterRecordId]
			,[Name]
			,[Type]
			,[RecordTypeId]
			,[ParentId]
			,[BillingStreet]
			,[BillingCity]
			,[BillingState]
			,[BillingPostalCode]
			,[BillingCountry]
			,[BillingStateCode]
			,[BillingCountryCode]
			,[BillingLatitude]
			,[BillingLongitude]
			,[ShippingStreet]
			,[ShippingCity]
			,[ShippingState]
			,[ShippingPostalCode]
			,[ShippingCountry]
			,[ShippingStateCode]
			,[ShippingCountryCode]
			,[ShippingLatitude]
			,[ShippingLongitude]
			,[Phone]
			,[Fax]
			,[Website]
			,[Industry]
			,[AnnualRevenue]
			,[NumberOfEmployees]
			,[Description]
			,[Site]
			,[OwnerId]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[IsCustomerPortal]
			,[Jigsaw]
			,[JigsawCompanyId]
			,[AccountSource]
			,[SicDescription]
			,[ServiceMaxAccess_Hours]
			,[ServiceMaxBusiness_Hours]
			,[ServiceMaxPreferred_Technician]
			,[ServiceMaxLatitude]
			,[ServiceMaxLongitude]
			,[AccountStatus]
			,[AccountFax]
			,[AccountEmail]
			,[ShippingPhone]
			,[ShippingFax]
			,[ShippingEmail]
			,[PrimaryEquipmentAssetFee]
			,[AncillaryEquipmentAssetFee]
			,[SalesTerritoryId]
			,[LaborRateStandard]
			,[AccountsReceivableCustomerAccount]
			,[Salesperson]
			,[TemporaryAccount]
			,[WorkTypes]
			,[LaborRatePremium]
			,[NumbeOfLocations]
			,[BusinessUnit]
			,[Organization]
			,[NteThreshold]
			,[PrimaryContact]
			,[PrimaryContactEmail]
			,[LaborRateTwoMan]
			,[AccountCellPhone]
			,[VendorId]
			,[MaterialHandlingGeneralLedgerAccount]
			,[LeadSourceMarketing]
			,[MaterialHandlingCreditLimit]
			,[MaterialHandlingSlCustomerId]
			,[MaterialHandlingTerms]
			,[MaterialHandlingAttention]
			,[CustomerIdLegacy]
			,[MaterialHandlingPrimaryContact]
			,[PrimaryContactSalutation]
			,[AverageDaysToPay]
			,[MaterialHandlingTaxSchedule]
			,[MaterialHandlingBillingContact]
			,[MaterialHandlingCreditHold]
			,[MaterialHandlingCurrentBalance]
			,[MaterialHandlingCustomerType]
			,[MaterialHandlingEmailStatements]
			,[MaterialHandlingGeneralLedgerSubAccountId]
			,[AccountsPayableAccount]
			,[AccountsPayableSubaccountId]
			,[LaborPmRateDdm]
			,[LaborPmRateMhe]
			,[Labor_StandardDdm]
			,[Labor_StandardMhe]
			,[Labor2ManDdm]
			,[Labor2ManMhe]
			,[LaborOtdDmDdm]
			,[LaborOtmHeMhe]
			,[LaborDtmHeMhe]
			,[LaborDtdDmDdm]
			,[AccountsReceivableDivisionNumber]
			,[Company]
			,[RemitAddress]
			,[RemitCity]
			,[RemitStateProvince]
			,[RemitZipCode]
			,[RemitCountry]
			,[CustomerNotes]
			,[SlVendorId]
			,[BillingAttention]
			,[BillingName]
			,[RemitName]
			,[RemitPhone]
			,[AvailableCredit]
			,[CreditRule]
			,[MinerSalesperson]
			,[CustomerTypeMarketingSegmets]
			,[TirePress]
			,[Salesperson2]
			,[DeliveryVehicles]
			,[Grade1]
			,[Grade2]
			,[AffiliateGrade]
			,[Docks]
			,[Doors]
			,[CustomerServiceRepresentativeCsr]
			,[Oem]
			,[ScissorBoomOem]
			,[DeletedAccountId]
			,[FaxIteration]
			,[PhoneIteration]
			,[PayTerms]
			,[DrawDate]
			,[Retainage]
			,[OemAffiliation]
			,[VendorExpenseType]
			,[AccountParentSlVendorId]
			,[ReadyToConvert]
			,[Affiliate]
			,[ParentAffiliate]
			,[AccountCount]
			,[DunsNumber]
			,[Tradestyle]
			,[NaicsCode]
			,[NaicsDesc]
			,[YearStarted]
			,[ResIdential]
			,[OpportunityTrade]
			,[AccountParentMaterialHandlingSlCustomerId]
			,[AccountApprover]
			,[PhotoUrl]
			,[UnityUserOwnerAgentId]
			,[IsPartner]
			,[AccountNumber]
			,[Sic]
			,[Ownership]
			,[TickerSymbol]
			,[Rating]
			,[AllInPmRateElectric]
			,[AllInPmRatePropane]
			,[ContractPaint]
			,[DeliveryCapability]
			,[MobileTirePressure]
			,[NumberOfServiceVans]
			,[NumberOfTechs]
			,[OpportunityPending]
			,[PmRate]
			,[PaintBooth]
			,[PartsDept]
			,[Propane]
			,[Refurbished]
			,[ServiceBatteries]
			,[ServiceRate]
			,[TirePressure3rdParty]
			,[TripCharge]
			,[TripFee]
			,[X24HourEmergencyRepair]
			,[SalespersonSecond]
			,[Certificate]
			,[FsoActive]
			,[SuperCenter]
			,[TaxId]
			,[FsoCustomerPriority]
			,[FsoNumberofLocations]
			,[FsoSlaExpirationDate]
			,[FsoSlaSerialNumber]
			,[FsoSla]
			,[FsoUpsellOpportunity]
			,[AccountLoop]
			,[BuUniqueField]
			,[SlCompanyId]
			,[SsvyLastVisitedDate]
			,[SsvyTotalAssets]
			,[SsvyTotalSiteSurveysCompleted]
			,[TimeZoneOffset]
			,[UnityAccountExternalId]
			,[UnityAccountId]
			,[UnityAccountRoutingId]
			,[UnityAgentWorkDay]
			,[UnityAgentWorkHourEndTime]
			,[UnityAgentWorkHourStartTime]
			,[UnityAutomobileLiabilityExpiry]
			,[UnityAutomobileLiability]
			,[UnityBillToAccount]
			,[UnityBillToHq]
			,[UnityBundling_Requirements]
			,[UnityBusinessUnit]
			,[UnityCompanyCode]
			,[UnityCustomerSize]
			,[UnityCustomerTeam]
			,[UnityDispatcher]
			,[UnityDoNotUseFlaggedDate]
			,[UnityDoNotUseReason]
			,[UnityDoNotUse]
			,[UnityFridayEndTime]
			,[UnityFridayStartTime]
			,[UnityGeneralLiabilityExpiry]
			,[UnityGeneralLiability]
			,[UnityHasPreferredPart]
			,[UnityHoursOfOperationSummary]
			,[UnityHoursOfOperation]
			,[UnityIRS_ValIdated]
			,[UnityIvrPhoneNumber]
			,[UnityIvrPin]
			,[UnityInstallationFloaterLiability]
			,[UnityInstallationFltLiabilityExpiry]
			,[UnityIsAccountsReceivable]
			,[UnityLoc]
			,[UnityMinerRegionalOffice]
			,[UnityMondayEndTime]
			,[UnityMondayStartTime]
			,[UnityOffHourQueue]
			,[UnityPassword]
			,[UnityPortalURL]
			,[UnityPreferred_Vendor]
			,[UnityRentedEquipmentLiabilityExpiry]
			,[UnityRentedEquipmentLiability]
			,[UnitySkillId2]
			,[UnitySsn]
			,[UnitySaturdayEndTime]
			,[UnitySaturdayStartTime]
			,[UnityServiceChannelIvr]
			,[UnityServiceContract]
			,[UnityShippingLocationLatitude]
			,[UnityShippingLocationLongitude]
			,[UnitySignature_Required]
			,[UnitySkillId]
			,[UnitySubscriberId]
			,[UnitySundayEndTime]
			,[UnitySundayStartTime]
			,[UnitySupportEmailAddress]
			,[UnityTaxExempt]
			,[UnityTaxId]
			,[UnityThursdayEndTime]
			,[UnityThursdayStartTime]
			,[UnityTierLevel]
			,[UnityTimeZoneSidKey]
			,[UnityTuesdayEndTime]
			,[UnityTuesdayStartTime]
			,[UnityUmbrellaLiabilityExpiry]
			,[UnityUmbrellaLiability]
			,[UnityUsername]
			,[UnityVendorScorePm]
			,[UnityVendorScoreProject]
			,[UnityVendorScoreSr]
			,[UnityVendorScoreSs]
			,[UnityVendorStatus]
			,[UnityVendorTypePm]
			,[UnityVendorTypeProject]
			,[UnityVendorTypeSr]
			,[UnityVendorTypeSs]
			,[UnityW9]
			,[UnityWednesdayEndTime]
			,[UnityWednesdayStartTime]
			,[UnityWorkersCompenstationLiabilityExpiry]
			,[UnityWorkersCompensationLiability]
			,[UnityMnsCustomerTeam]
			,[AccountParentUnityAccountExternalId]
			,[UnityDoBusinessAs]
			,[Unity0To30PastDue]
			,[Unity31To60PastDue]
			,[Unity61To90PastDue]
			,[Unity90DaysPastDue]
			,[UnitySlCurrentBalance]
			,[UnityUltimateParent]
			,[UnityTemplateConfiguration]
			,[UnityFiscalYearBasedOn]
			,[UnityFiscalYearStartMonth]
			,[UnityServiceReportTemplate]
			,[Unity3rdPartyCustomer]
			,[BillingGeocodeAccuracy]
			,[ShippingGeocodeAccuracy]
			,[UnityCompany]
			,[SlNotesText]
			,[SlNotes]
			,[SlPromiseDate]
			,[MmpfsBuShippingAddress]
			,[MspGoLiveDate]
			,[UnityCompanyText]
			,[UnityVendorId]
			,[MspfsBuBillingAddress]
			,[MspfsBusinessUnitLegalName]
			,[MspfsMSPBillToAccount]
			,[UnityVendorManager]
			,[UnityHasCommUnityMember]
			,[UnityRecordTypeName]
			,[UnityPmPin]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
			,__Operation
			,__OperationDate
		)
	SELECT DISTINCT
		 T.RowId
		,T.Id
		,T.IsDeleted
		,T.MasterRecordId
		,T.Name
		,T.Type
		,T.RecordTypeId
		,T.ParentId
		,T.BillingStreet
		,T.BillingCity
		,T.BillingState
		,T.BillingPostalCode
		,T.BillingCountry
		,T.BillingStateCode
		,T.BillingCountryCode
		,T.BillingLatitude
		,T.BillingLongitude
		,T.ShippingStreet
		,T.ShippingCity
		,T.ShippingState
		,T.ShippingPostalCode
		,T.ShippingCountry
		,T.ShippingStateCode
		,T.ShippingCountryCode
		,T.ShippingLatitude
		,T.ShippingLongitude
		,T.Phone
		,T.Fax
		,T.Website
		,T.Industry
		,T.AnnualRevenue
		,T.NumberOfEmployees
		,T.Description
		,T.Site
		,T.OwnerId
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,T.LastActivityDate
		,T.LastViewedDate
		,T.LastReferencedDate
		,T.IsCustomerPortal
		,T.Jigsaw
		,T.JigsawCompanyId
		,T.AccountSource
		,T.SicDescription
		,T.ServiceMaxAccess_Hours
		,T.ServiceMaxBusiness_Hours
		,T.ServiceMaxPreferred_Technician
		,T.ServiceMaxLatitude
		,T.ServiceMaxLongitude
		,T.AccountStatus
		,T.AccountFax
		,T.AccountEmail
		,T.ShippingPhone
		,T.ShippingFax
		,T.ShippingEmail
		,T.PrimaryEquipmentAssetFee
		,T.AncillaryEquipmentAssetFee
		,T.SalesTerritoryId
		,T.LaborRateStandard
		,T.AccountsReceivableCustomerAccount
		,T.Salesperson
		,T.TemporaryAccount
		,T.WorkTypes
		,T.LaborRatePremium
		,T.NumbeOfLocations
		,T.BusinessUnit
		,T.Organization
		,T.NteThreshold
		,T.PrimaryContact
		,T.PrimaryContactEmail
		,T.LaborRateTwoMan
		,T.AccountCellPhone
		,T.VendorId
		,T.MaterialHandlingGeneralLedgerAccount
		,T.LeadSourceMarketing
		,T.MaterialHandlingCreditLimit
		,T.MaterialHandlingSlCustomerId
		,T.MaterialHandlingTerms
		,T.MaterialHandlingAttention
		,T.CustomerIdLegacy
		,T.MaterialHandlingPrimaryContact
		,T.PrimaryContactSalutation
		,T.AverageDaysToPay
		,T.MaterialHandlingTaxSchedule
		,T.MaterialHandlingBillingContact
		,T.MaterialHandlingCreditHold
		,T.MaterialHandlingCurrentBalance
		,T.MaterialHandlingCustomerType
		,T.MaterialHandlingEmailStatements
		,T.MaterialHandlingGeneralLedgerSubAccountId
		,T.AccountsPayableAccount
		,T.AccountsPayableSubaccountId
		,T.LaborPmRateDdm
		,T.LaborPmRateMhe
		,T.Labor_StandardDdm
		,T.Labor_StandardMhe
		,T.Labor2ManDdm
		,T.Labor2ManMhe
		,T.LaborOtdDmDdm
		,T.LaborOtmHeMhe
		,T.LaborDtmHeMhe
		,T.LaborDtdDmDdm
		,T.AccountsReceivableDivisionNumber
		,T.Company
		,T.RemitAddress
		,T.RemitCity
		,T.RemitStateProvince
		,T.RemitZipCode
		,T.RemitCountry
		,T.CustomerNotes
		,T.SlVendorId
		,T.BillingAttention
		,T.BillingName
		,T.RemitName
		,T.RemitPhone
		,T.AvailableCredit
		,T.CreditRule
		,T.MinerSalesperson
		,T.CustomerTypeMarketingSegmets
		,T.TirePress
		,T.Salesperson2
		,T.DeliveryVehicles
		,T.Grade1
		,T.Grade2
		,T.AffiliateGrade
		,T.Docks
		,T.Doors
		,T.CustomerServiceRepresentativeCsr
		,T.Oem
		,T.ScissorBoomOem
		,T.DeletedAccountId
		,T.FaxIteration
		,T.PhoneIteration
		,T.PayTerms
		,T.DrawDate
		,T.Retainage
		,T.OemAffiliation
		,T.VendorExpenseType
		,T.AccountParentSlVendorId
		,T.ReadyToConvert
		,T.Affiliate
		,T.ParentAffiliate
		,T.AccountCount
		,T.DunsNumber
		,T.Tradestyle
		,T.NaicsCode
		,T.NaicsDesc
		,T.YearStarted
		,T.ResIdential
		,T.OpportunityTrade
		,T.AccountParentMaterialHandlingSlCustomerId
		,T.AccountApprover
		,T.PhotoUrl
		,T.UnityUserOwnerAgentId
		,T.IsPartner
		,T.AccountNumber
		,T.Sic
		,T.Ownership
		,T.TickerSymbol
		,T.Rating
		,T.AllInPmRateElectric
		,T.AllInPmRatePropane
		,T.ContractPaint
		,T.DeliveryCapability
		,T.MobileTirePressure
		,T.NumberOfServiceVans
		,T.NumberOfTechs
		,T.OpportunityPending
		,T.PmRate
		,T.PaintBooth
		,T.PartsDept
		,T.Propane
		,T.Refurbished
		,T.ServiceBatteries
		,T.ServiceRate
		,T.TirePressure3rdParty
		,T.TripCharge
		,T.TripFee
		,T.X24HourEmergencyRepair
		,T.SalespersonSecond
		,T.Certificate
		,T.FsoActive
		,T.SuperCenter
		,T.TaxId
		,T.FsoCustomerPriority
		,T.FsoNumberofLocations
		,T.FsoSlaExpirationDate
		,T.FsoSlaSerialNumber
		,T.FsoSla
		,T.FsoUpsellOpportunity
		,T.AccountLoop
		,T.BuUniqueField
		,T.SlCompanyId
		,T.SsvyLastVisitedDate
		,T.SsvyTotalAssets
		,T.SsvyTotalSiteSurveysCompleted
		,T.TimeZoneOffset
		,T.UnityAccountExternalId
		,T.UnityAccountId
		,T.UnityAccountRoutingId
		,T.UnityAgentWorkDay
		,T.UnityAgentWorkHourEndTime
		,T.UnityAgentWorkHourStartTime
		,T.UnityAutomobileLiabilityExpiry
		,T.UnityAutomobileLiability
		,T.UnityBillToAccount
		,T.UnityBillToHq
		,T.UnityBundling_Requirements
		,T.UnityBusinessUnit
		,T.UnityCompanyCode
		,T.UnityCustomerSize
		,T.UnityCustomerTeam
		,T.UnityDispatcher
		,T.UnityDoNotUseFlaggedDate
		,T.UnityDoNotUseReason
		,T.UnityDoNotUse
		,T.UnityFridayEndTime
		,T.UnityFridayStartTime
		,T.UnityGeneralLiabilityExpiry
		,T.UnityGeneralLiability
		,T.UnityHasPreferredPart
		,T.UnityHoursOfOperationSummary
		,T.UnityHoursOfOperation
		,T.UnityIRS_ValIdated
		,T.UnityIvrPhoneNumber
		,T.UnityIvrPin
		,T.UnityInstallationFloaterLiability
		,T.UnityInstallationFltLiabilityExpiry
		,T.UnityIsAccountsReceivable
		,T.UnityLoc
		,T.UnityMinerRegionalOffice
		,T.UnityMondayEndTime
		,T.UnityMondayStartTime
		,T.UnityOffHourQueue
		,T.UnityPassword
		,T.UnityPortalURL
		,T.UnityPreferred_Vendor
		,T.UnityRentedEquipmentLiabilityExpiry
		,T.UnityRentedEquipmentLiability
		,T.UnitySkillId2
		,T.UnitySsn
		,T.UnitySaturdayEndTime
		,T.UnitySaturdayStartTime
		,T.UnityServiceChannelIvr
		,T.UnityServiceContract
		,T.UnityShippingLocationLatitude
		,T.UnityShippingLocationLongitude
		,T.UnitySignature_Required
		,T.UnitySkillId
		,T.UnitySubscriberId
		,T.UnitySundayEndTime
		,T.UnitySundayStartTime
		,T.UnitySupportEmailAddress
		,T.UnityTaxExempt
		,T.UnityTaxId
		,T.UnityThursdayEndTime
		,T.UnityThursdayStartTime
		,T.UnityTierLevel
		,T.UnityTimeZoneSidKey
		,T.UnityTuesdayEndTime
		,T.UnityTuesdayStartTime
		,T.UnityUmbrellaLiabilityExpiry
		,T.UnityUmbrellaLiability
		,T.UnityUsername
		,T.UnityVendorScorePm
		,T.UnityVendorScoreProject
		,T.UnityVendorScoreSr
		,T.UnityVendorScoreSs
		,T.UnityVendorStatus
		,T.UnityVendorTypePm
		,T.UnityVendorTypeProject
		,T.UnityVendorTypeSr
		,T.UnityVendorTypeSs
		,T.UnityW9
		,T.UnityWednesdayEndTime
		,T.UnityWednesdayStartTime
		,T.UnityWorkersCompenstationLiabilityExpiry
		,T.UnityWorkersCompensationLiability
		,T.UnityMnsCustomerTeam
		,T.AccountParentUnityAccountExternalId
		,T.UnityDoBusinessAs
		,T.Unity0To30PastDue
		,T.Unity31To60PastDue
		,T.Unity61To90PastDue
		,T.Unity90DaysPastDue
		,T.UnitySlCurrentBalance
		,T.UnityUltimateParent
		,T.UnityTemplateConfiguration
		,T.UnityFiscalYearBasedOn
		,T.UnityFiscalYearStartMonth
		,T.UnityServiceReportTemplate
		,T.Unity3rdPartyCustomer
		,T.BillingGeocodeAccuracy
		,T.ShippingGeocodeAccuracy
		,T.UnityCompany
		,T.SlNotesText
		,T.SlNotes
		,T.SlPromiseDate
		,T.MmpfsBuShippingAddress
		,T.MspGoLiveDate
		,T.UnityCompanyText
		,T.UnityVendorId
		,T.MspfsBuBillingAddress
		,T.MspfsBusinessUnitLegalName
		,T.MspfsMSPBillToAccount
		,T.UnityVendorManager
		,T.UnityHasCommUnityMember
		,T.UnityRecordTypeName
		,T.UnityPmPin
		,T.LastUpdate
		,T.ImportDate
		,T.ValidFrom
		,T.ValidTo
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END