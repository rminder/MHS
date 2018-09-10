﻿CREATE VIEW SF.vwAccount
AS
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
FROM [SF].[Account];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwAccount] TO [OdsUser]
    AS [dbo];
