
-- ===================================================
-- Author:		Randy Minder
-- Create date: 25-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[AccountIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[AccountIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.Account;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.Account;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-Account', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables. We'll end up with rows in SF that are
        -- not in Ods.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.Account
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwAccount
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Id]
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
		   ,ROUND(T.BillingLatitude, 7)				   AS BillingLatitude
		   ,ROUND(T.BillingLongitude, 7)			   AS BillingLongitude
		   ,T.ShippingStreet
		   ,T.ShippingCity
		   ,T.ShippingState
		   ,T.ShippingPostalCode
		   ,T.ShippingCountry
		   ,T.ShippingStateCode
		   ,T.ShippingCountryCode
		   ,ROUND(T.ShippingLatitude, 7)			   AS ShippingLatitude
		   ,ROUND(T.ShippingLongitude, 7)			   AS ShippingLongitude
		   ,T.Phone
		   ,T.Fax
		   ,T.Website
		   ,T.Industry
		   ,T.AnnualRevenue
		   ,T.NumberOfEmployees
		   ,T.Description
		   ,T.Site
		   ,T.OwnerId
		   --,T.CreatedDate
		   ,T.CreatedById
		   --,T.LastModifiedDate
		   ,T.LastModifiedById
		   --,T.SystemModstamp
		   --,T.LastActivityDate
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
		   ,ROUND(T.ServiceMaxLatitude, 7)			   AS ServiceMaxLatitude
		   ,ROUND(T.ServiceMaxLongitude, 7)			   AS ServiceMaxLongitude
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
		   ,ROUND(T.MaterialHandlingCreditLimit, 3)	   AS MaterialHandlingCreditLimit
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
		   ,ROUND(T.MaterialHandlingCurrentBalance, 3) AS MaterialHandlingCurrentBalance
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
		   ,ROUND(T.UnityShippingLocationLatitude, 7)  AS UnityShippingLocationLatitude
		   ,ROUND(T.UnityShippingLocationLongitude, 7) AS UnityShippingLocationLongitude
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
		   ,ROUND(T.Unity0To30PastDue, 3)			   AS Unity0To30PastDue
		   ,ROUND(T.Unity31To60PastDue, 3)			   AS Unity31To60PastDue
		   ,ROUND(T.Unity61To90PastDue, 3)			   AS Unity61To90PastDue
		   ,ROUND(T.Unity90DaysPastDue, 3)			   AS Unity90DaysPastDue
		   ,ROUND(T.UnitySlCurrentBalance, 3)		   AS UnitySlCurrentBalance
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
		   --,T.LastUpdate
		FROM OdsStaging.SF.vwAccount	  T
			INNER JOIN CommonRows T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			T.[Id]
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
		   ,ROUND(T.BillingLatitude, 7)				   AS BillingLatitude
		   ,ROUND(T.BillingLongitude, 7)			   AS BillingLongitude
		   ,T.ShippingStreet
		   ,T.ShippingCity
		   ,T.ShippingState
		   ,T.ShippingPostalCode
		   ,T.ShippingCountry
		   ,T.ShippingStateCode
		   ,T.ShippingCountryCode
		   ,ROUND(T.ShippingLatitude, 7)			   AS ShippingLatitude
		   ,ROUND(T.ShippingLongitude, 7)			   AS ShippingLongitude
		   ,T.Phone
		   ,T.Fax
		   ,T.Website
		   ,T.Industry
		   ,T.AnnualRevenue
		   ,T.NumberOfEmployees
		   ,T.Description
		   ,T.Site
		   ,T.OwnerId
		   --,T.CreatedDate
		   ,T.CreatedById
		   --,T.LastModifiedDate
		   ,T.LastModifiedById
		   --,T.SystemModstamp
		   --,T.LastActivityDate
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
		   ,ROUND(T.ServiceMaxLatitude, 7)			   AS ServiceMaxLatitude
		   ,ROUND(T.ServiceMaxLongitude, 7)			   AS ServiceMaxLongitude
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
		   ,ROUND(T.MaterialHandlingCreditLimit, 3)	   AS MaterialHandlingCreditLimit
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
		   ,ROUND(T.MaterialHandlingCurrentBalance, 3) AS MaterialHandlingCurrentBalance
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
		   ,T.FsoSLaSerialNumber
		   ,T.FsoSLa
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
		   ,T.UnitySKillId2
		   ,T.UnitySsn
		   ,T.UnitySaturdayEndTime
		   ,T.UnitySaturdayStartTime
		   ,T.UnityServiceChannelIvr
		   ,T.UnityServiceContract
		   ,ROUND(T.UnityShippingLocationLatitude, 7)  AS UnityShippingLocationLatitude
		   ,ROUND(T.UnityShippingLocationLongitude, 7) AS UnityShippingLocationLongitude
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
		   ,ROUND(T.Unity0To30PastDue, 3)			   AS Unity0To30PastDue
		   ,ROUND(T.Unity31To60PastDue, 3)			   AS Unity31To60PastDue
		   ,ROUND(T.Unity61To90PastDue, 3)			   AS Unity61To90PastDue
		   ,ROUND(T.Unity90DaysPastDue, 3)			   AS Unity90DaysPastDue
		   ,ROUND(T.UnitySlCurrentBalance, 3)		   AS UnitySlCurrentBalance
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
		   --,T.LastUpdate
		FROM Ods.SF.vwAccount T
			INNER JOIN CommonRows	 T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Note, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT 
         T.Id
        ,T2.LastModifiedDate AS SfLastModifiedDate
        ,T3.LastModifiedDate AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences T
        INNER JOIN OdsStaging.SF.Account T2 ON T.Id = T2.Id
        INNER JOIN Ods.SF.Account T3 ON T.Id = T3.Id
	WHERE T2.LastModifiedDate <= T3.LastModifiedDate

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-Account', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

    -- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
    -- updated to Ods by the SSIS data integrity package.
    DELETE FROM OdsStaging.SF.Account WHERE Id NOT IN (SELECT Id FROM #TempTable)

END;