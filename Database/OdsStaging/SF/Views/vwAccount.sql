﻿CREATE VIEW [SF].[vwAccount]
AS
SELECT
	[Id]													  AS [Id]
   ,[IsDeleted]												  AS [IsDeleted]
   ,ISNULL([MasterRecordId], '')							  AS [MasterRecordId]
   ,ISNULL([Name], '')										  AS [Name]
   ,ISNULL([Type], '')										  AS [Type]
   ,ISNULL([RecordTypeId], '')								  AS [RecordTypeId]
   ,ISNULL([ParentId], '')									  AS [ParentId]
   ,ISNULL([BillingStreet], '')								  AS [BillingStreet]
   ,ISNULL([BillingCity], '')								  AS [BillingCity]
   ,ISNULL([BillingState], '')								  AS [BillingState]
   ,ISNULL([BillingPostalCode], '')							  AS [BillingPostalCode]
   ,ISNULL([BillingCountry], '')							  AS [BillingCountry]
   ,ISNULL([BillingStateCode], '')							  AS [BillingStateCode]
   ,ISNULL([BillingCountryCode], '')						  AS [BillingCountryCode]
   ,ISNULL([BillingLatitude], '')							  AS [BillingLatitude]
   ,ISNULL([BillingLongitude], '')							  AS [BillingLongitude]
   ,ISNULL([ShippingStreet], '')							  AS [ShippingStreet]
   ,ISNULL([ShippingCity], '')								  AS [ShippingCity]
   ,ISNULL([ShippingState], '')								  AS [ShippingState]
   ,ISNULL([ShippingPostalCode], '')						  AS [ShippingPostalCode]
   ,ISNULL([ShippingCountry], '')							  AS [ShippingCountry]
   ,ISNULL([ShippingStateCode], '')							  AS [ShippingStateCode]
   ,ISNULL([ShippingCountryCode], '')						  AS [ShippingCountryCode]
   ,[ShippingLatitude]										  AS [ShippingLatitude]
   ,[ShippingLongitude]										  AS [ShippingLongitude]
   ,ISNULL([Phone], '')										  AS [Phone]
   ,ISNULL([Fax], '')										  AS [Fax]
   ,ISNULL([Website], '')									  AS [Website]
   ,ISNULL([Industry], '')									  AS [Industry]
   ,[AnnualRevenue]											  AS [AnnualRevenue]
   ,[NumberOfEmployees]										  AS [NumberOfEmployees]
   ,ISNULL([Description], '')								  AS [Description]
   ,ISNULL([Site], '')										  AS [Site]
   ,ISNULL([OwnerId], '')									  AS [OwnerId]
   ,[CreatedDate]											  AS [CreatedDate]
   ,ISNULL([CreatedById], '')								  AS [CreatedById]
   ,[LastModifiedDate]										  AS [LastModifiedDate]
   ,ISNULL([LastModifiedById], '')							  AS [LastModifiedById]
   ,[SystemModstamp]										  AS [SystemModstamp]
   ,[LastActivityDate]										  AS [LastActivityDate]
   ,[LastViewedDate]										  AS [LastViewedDate]
   ,[LastReferencedDate]									  AS [LastReferencedDate]
   ,[IsCustomerPortal]										  AS [IsCustomerPortal]
   ,ISNULL([Jigsaw], '')									  AS [Jigsaw]
   ,ISNULL([JigsawCompanyId], '')							  AS [JigsawCompanyId]
   ,ISNULL([AccountSource], '')								  AS [AccountSource]
   ,ISNULL([SicDesc], '')									  AS [SicDescription]
   ,ISNULL([SVMXC__Access_Hours__c], '')					  AS [ServiceMaxAccess_Hours]
   ,ISNULL([SVMXC__Business_Hours__c], '')					  AS [ServiceMaxBusiness_Hours]
   ,ISNULL([SVMXC__Preferred_Technician__c], '')			  AS [ServiceMaxPreferred_Technician]
   ,[SVMXC__Latitude__c]									  AS [ServiceMaxLatitude]
   ,[SVMXC__Longitude__c]									  AS [ServiceMaxLongitude]
   ,ISNULL([Account_Status__c], '')							  AS [AccountStatus]
   ,ISNULL([Account_Fax__c], '')							  AS [AccountFax]
   ,ISNULL([Account_Email__c], '')							  AS [AccountEmail]
   ,ISNULL([Shipping_Phone__c], '')							  AS [ShippingPhone]
   ,ISNULL([Shipping_Fax__c], '')							  AS [ShippingFax]
   ,ISNULL([Shipping_Email__c], '')							  AS [ShippingEmail]
   ,[Primary_Equipment_Asset_Fee__c]						  AS [PrimaryEquipmentAssetFee]
   ,[Ancillary_Equipment_Asset_Fee__c]						  AS [AncillaryEquipmentAssetFee]
   ,ISNULL([Sales_Territory_ID__c], '')						  AS [SalesTerritoryId]
   ,[Labor_Rate_Standard__c]								  AS [LaborRateStandard]
   ,ISNULL([AR_Customer_Account__c], '')					  AS [AccountsReceivableCustomerAccount]
   ,ISNULL([Salesperson__c], '')							  AS [Salesperson]
   ,[Temp_Account__c]										  AS [TemporaryAccount]
   ,ISNULL([Work_Types__c], '')								  AS [WorkTypes]
   ,[Labor_Rate_Premium__c]									  AS [LaborRatePremium]
   ,[Number_of_Locations__c]								  AS [NumbeOfLocations]
   ,ISNULL([Business_Unit__c], '')							  AS [BusinessUnit]
   ,ISNULL([Organization__c], '')							  AS [Organization]
   ,[NTE_Threshold__c]										  AS [NteThreshold]
   ,ISNULL([Primary_Contact__c], '')						  AS [PrimaryContact]
   ,ISNULL([Primary_Contact_Email__c], '')					  AS [PrimaryContactEmail]
   ,[Labor_Rate_Two_Man__c]									  AS [LaborRateTwoMan]
   ,ISNULL([Account_Cell_Phone__c], '')						  AS [AccountCellPhone]
   ,ISNULL([Vendor_ID__c], '')								  AS [VendorId]
   ,ISNULL([MH_GL_Account__c], '')							  AS [MaterialHandlingGeneralLedgerAccount]
   ,ISNULL([Lead_Source_Marketing__c], '')					  AS [LeadSourceMarketing]
   ,[MH_Credit_Limit__c]									  AS [MaterialHandlingCreditLimit]
   ,ISNULL([MH_SL_CustID__c], '')							  AS [MaterialHandlingSlCustomerId]
   ,ISNULL([MH_Terms__c], '')								  AS [MaterialHandlingTerms]
   ,ISNULL([MH_Attention__c], '')							  AS [MaterialHandlingAttention]
   ,ISNULL([CustID_Legacy__c], '')							  AS [CustomerIdLegacy]
   ,ISNULL([MH_Primary_Contact__c], '')						  AS [MaterialHandlingPrimaryContact]
   ,ISNULL([Primary_Contact_Salut__c], '')					  AS [PrimaryContactSalutation]
   ,[Average_Days_to_Pay__c]								  AS [AverageDaysToPay]
   ,ISNULL([MH_Tax_Schedule__c], '')						  AS [MaterialHandlingTaxSchedule]
   ,ISNULL([MH_Billing_Contact__c], '')						  AS [MaterialHandlingBillingContact]
   ,[MH_Credit_Hold__c]										  AS [MaterialHandlingCreditHold]
   ,[MH_Current_Balance__c]									  AS [MaterialHandlingCurrentBalance]
   ,ISNULL([MH_Customer_Type__c], '')						  AS [MaterialHandlingCustomerType]
   ,[MH_Email_Statements__c]								  AS [MaterialHandlingEmailStatements]
   ,ISNULL([MH_GL_SubAccount__c], '')						  AS [MaterialHandlingGeneralLedgerSubAccountId]
   ,ISNULL([AP_Account__c], '')								  AS [AccountsPayableAccount]
   ,ISNULL([APSubaccount__c], '')							  AS [AccountsPayableSubaccountId]
   ,[Labor_PM_Rate_DDM__c]									  AS [LaborPmRateDdm]
   ,[Labor_PM_Rate_MHE__c]									  AS [LaborPmRateMhe]
   ,[Labor_Standard_DDM__c]									  AS [Labor_StandardDdm]
   ,[Labor_Standard_MHE__c]									  AS [Labor_StandardMhe]
   ,[Labor_2_Man_DDM__c]									  AS [Labor2ManDdm]
   ,[Labor_2_Man_MHE__c]									  AS [Labor2ManMhe]
   ,[Labor_OTDDM_DDM__c]									  AS [LaborOtdDmDdm]
   ,[Labor_OTMHE_MHE__c]									  AS [LaborOtmHeMhe]
   ,[Labor_DTMHE_MHE__c]									  AS [LaborDtmHeMhe]
   ,[Labor_DTDDM_DDM__c]									  AS [LaborDtdDmDdm]
   ,ISNULL([AR_Division_Number__c], '')						  AS [AccountsReceivableDivisionNumber]
   ,ISNULL([Company__c], '')								  AS [Company]
   ,ISNULL([Remit_Address__c], '')							  AS [RemitAddress]
   ,ISNULL([Remit_City__c], '')								  AS [RemitCity]
   ,ISNULL([Remit_State_Province__c], '')					  AS [RemitStateProvince]
   ,ISNULL([Remit_Zip_Code__c], '')							  AS [RemitZipCode]
   ,ISNULL([Remit_Country__c], '')							  AS [RemitCountry]
   ,ISNULL([Customer_Notes__c], '')							  AS [CustomerNotes]
   ,ISNULL([SL_Vendor_ID__c], '')							  AS [SlVendorId]
   ,ISNULL([Billing_Attention__c], '')						  AS [BillingAttention]
   ,ISNULL([Billing_Name__c], '')							  AS [BillingName]
   ,ISNULL([Remit_Name__c], '')								  AS [RemitName]
   ,ISNULL([Remit_Phone__c], '')							  AS [RemitPhone]
   ,[Available_Credit__c]									  AS [AvailableCredit]
   ,ISNULL([Credit_Rule__c], '')							  AS [CreditRule]
   ,ISNULL([Miner_Salesperson_c__c], '')					  AS [MinerSalesperson]
   ,ISNULL([Customer_Type_Mktg_Segmets__c], '')				  AS [CustomerTypeMarketingSegmets]
   ,[Tire_Press__c]											  AS [TirePress]
   ,ISNULL([Salesperson_2__c], '')							  AS [Salesperson2]
   ,ISNULL([Delivery_Vehicles__c], '')						  AS [DeliveryVehicles]
   ,ISNULL([Grade_1__c], '')								  AS [Grade1]
   ,ISNULL([Grade_2__c], '')								  AS [Grade2]
   ,ISNULL([Affiliate_Grade__c], '')						  AS [AffiliateGrade]
   ,[Docks__c]												  AS [Docks]
   ,[Doors__c]												  AS [Doors]
   ,[Customer_Service_Rep_CSR__c]							  AS [CustomerServiceRepresentativeCsr]
   ,ISNULL([OEM__c], '')									  AS [Oem]
   ,ISNULL([Scissor_Boom_OEM__c], '')						  AS [ScissorBoomOem]
   ,ISNULL([Deleted_Account_ID__c], '')						  AS [DeletedAccountId]
   ,ISNULL([Fax_Iteration__c], '')							  AS [FaxIteration]
   ,ISNULL([Phone_Iteration__c], '')						  AS [PhoneIteration]
   ,ISNULL([Pay_Terms__c], '')								  AS [PayTerms]
   ,ISNULL([Draw_Date__c], '')								  AS [DrawDate]
   ,[Retainage__c]											  AS [Retainage]
   ,ISNULL([OEM_Affiliation__c], '')						  AS [OemAffiliation]
   ,ISNULL([Vendor_Expense_Type__c], '')					  AS [VendorExpenseType]
   ,ISNULL([Account_Parent_SL_Vendor_ID__c], '')			  AS [AccountParentSlVendorId]
   ,[Ready_to_Convert__c]									  AS [ReadyToConvert]
   ,[Affiliate__c]											  AS [Affiliate]
   ,ISNULL([Parent_Affiliate__c], '')						  AS [ParentAffiliate]
   ,[Account_Count__c]										  AS [AccountCount]
   ,ISNULL([DunsNumber], '')								  AS [DunsNumber]
   ,ISNULL([Tradestyle], '')								  AS [Tradestyle]
   ,ISNULL([NaicsCode], '')									  AS [NaicsCode]
   ,ISNULL([NaicsDesc], '')									  AS [NaicsDesc]
   ,ISNULL([YearStarted], '')								  AS [YearStarted]
   ,[Residential__c]										  AS [ResIdential]
   ,ISNULL([Opportunity_Trade__c], '')						  AS [OpportunityTrade]
   ,ISNULL([Account_Parent_MH_SL_CustID__c], '')			  AS [AccountParentMaterialHandlingSlCustomerId]
   ,ISNULL([Account_Approver__c], '')						  AS [AccountApprover]
   ,ISNULL([PhotoUrl], '')									  AS [PhotoUrl]
   ,ISNULL([User_Owner_UNITY_Agent_ID__c], '')				  AS [UnityUserOwnerAgentId]
   ,[IsPartner]												  AS [IsPartner]
   ,ISNULL([AccountNumber], '')								  AS [AccountNumber]
   ,ISNULL([Sic], '')										  AS [Sic]
   ,ISNULL([Ownership], '')									  AS [Ownership]
   ,ISNULL([TickerSymbol], '')								  AS [TickerSymbol]
   ,ISNULL([Rating], '')									  AS [Rating]
   ,[All_in_PM_Rate_Electric__c]							  AS [AllInPmRateElectric]
   ,[All_in_PM_Rate_Propane__c]								  AS [AllInPmRatePropane]
   ,[Contract_Paint__c]										  AS [ContractPaint]
   ,[Delivery_Capability__c]								  AS [DeliveryCapability]
   ,[Mobile_Tire_Press__c]									  AS [MobileTirePressure]
   ,[Number_of_Service_Vans__c]								  AS [NumberOfServiceVans]
   ,[Number_of_Tech__c]										  AS [NumberOfTechs]
   ,[Opportunity_Pending__c]								  AS [OpportunityPending]
   ,[PM_Rate__c]											  AS [PmRate]
   ,[Paint_Booth__c]										  AS [PaintBooth]
   ,[Parts_Dept__c]											  AS [PartsDept]
   ,[Propane__c]											  AS [Propane]
   ,[Refurb__c]												  AS [Refurbished]
   ,[Service_Batteries__c]									  AS [ServiceBatteries]
   ,[Service_Rate__c]										  AS [ServiceRate]
   ,[Tire_Press_3rd_party__c]								  AS [TirePressure3rdParty]
   ,[Trip_Charge__c]										  AS [TripCharge]
   ,[Trip_Fee__c]											  AS [TripFee]
   ,[X24_Hour_Emergency_Repair__c]							  AS [X24HourEmergencyRepair]
   ,ISNULL([Salesperson_Second__c], '')						  AS [SalespersonSecond]
   ,ISNULL([Certificate__c], '')							  AS [Certificate]
   ,ISNULL([FSO__Active__c], '')							  AS [FsoActive]
   ,ISNULL([Super_Center__c], '')							  AS [SuperCenter]
   ,ISNULL([Tax_ID__c], '')									  AS [TaxId]
   ,ISNULL([FSO__CustomerPriority__c], '')					  AS [FsoCustomerPriority]
   ,[FSO__NumberofLocations__c]								  AS [FsoNumberofLocations]
   ,[FSO__SLAExpirationDate__c]								  AS [FsoSlaExpirationDate]
   ,ISNULL([FSO__SLASerialNumber__c], '')					  AS [FsoSLaSerialNumber]
   ,ISNULL([FSO__SLA__c], '')								  AS [FsoSLa]
   ,ISNULL([FSO__UpsellOpportunity__c], '')					  AS [FsoUpsellOpportunity]
   ,ISNULL([Account_Loop__c], '')							  AS [AccountLoop]
   ,ISNULL([BU_Unique_Field__c], '')						  AS [BuUniqueField]
   ,ISNULL([SL_Company_ID__c], '')							  AS [SlCompanyId]
   ,[SSVY_Last_Visited_Date__c]								  AS [SsvyLastVisitedDate]
   ,[SSVY_Total_Assets__c]									  AS [SsvyTotalAssets]
   ,[SSVY_Total_Site_Surveys_Completed__c]					  AS [SsvyTotalSiteSurveysCompleted]
   ,ISNULL([Timne_Zone_Offset__c], '')						  AS [TimeZoneOffset]
   ,ISNULL([UNITY_Account_External_Id__c], '')				  AS [UnityAccountExternalId]
   ,ISNULL([UNITY_Account_ID__c], '')						  AS [UnityAccountId]
   ,ISNULL([UNITY_Account_Routing_ID__c], '')				  AS [UnityAccountRoutingId]
   ,ISNULL([UNITY_Agent_Work_Day__c], '')					  AS [UnityAgentWorkDay]
   ,ISNULL([UNITY_Agent_Work_Hour_End_Time__c], '')			  AS [UnityAgentWorkHourEndTime]
   ,ISNULL([UNITY_Agent_Work_Hour_Start_Time__c], '')		  AS [UnityAgentWorkHourStartTime]
   ,[UNITY_Automobile_Liability_Expiry__c]					  AS [UnityAutomobileLiabilityExpiry]
   ,[UNITY_Automobile_Liability__c]							  AS [UnityAutomobileLiability]
   ,ISNULL([UNITY_Bill_To_Account__c], '')					  AS [UnityBillToAccount]
   ,[UNITY_Bill_to_HQ__c]									  AS [UnityBillToHq]
   ,ISNULL([UNITY_Bundling_Requirements__c], '')			  AS [UnityBundling_Requirements]
   ,ISNULL([UNITY_Business_Unit__c], '')					  AS [UnityBusinessUnit]
   ,ISNULL([UNITY_Company_Code__c], '')						  AS [UnityCompanyCode]
   ,ISNULL([UNITY_Customer_Size__c], '')					  AS [UnityCustomerSize]
   ,ISNULL([UNITY_Customer_Team__c], '')					  AS [UnityCustomerTeam]
   ,ISNULL([UNITY_Dispatcher__c], '')						  AS [UnityDispatcher]
   ,[UNITY_Do_Not_Use_Flagged_Date__c]						  AS [UnityDoNotUseFlaggedDate]
   ,ISNULL([UNITY_Do_Not_Use_Reason__c], '')				  AS [UnityDoNotUseReason]
   ,[UNITY_Do_Not_Use__c]									  AS [UnityDoNotUse]
   ,ISNULL([UNITY_Friday_End_Time__c], '')					  AS [UnityFridayEndTime]
   ,ISNULL([UNITY_Friday_Start_Time__c], '')				  AS [UnityFridayStartTime]
   ,[UNITY_General_Liability_Expiry__c]						  AS [UnityGeneralLiabilityExpiry]
   ,[UNITY_General_Liability__c]							  AS [UnityGeneralLiability]
   ,[UNITY_Has_Preferred_Part__c]							  AS [UnityHasPreferredPart]
   ,ISNULL([UNITY_Hours_of_Operation_Summary__c], '')		  AS [UnityHoursOfOperationSummary]
   ,ISNULL([UNITY_Hours_of_Operation__c], '')				  AS [UnityHoursOfOperation]
   ,[UNITY_IRS_Validated__c]								  AS [UnityIRS_ValIdated]
   ,ISNULL([UNITY_IVR_Phone_Number__c], '')					  AS [UnityIvrPhoneNumber]
   ,ISNULL([UNITY_IVR_Pin__c], '')							  AS [UnityIvrPin]
   ,[UNITY_Installation_Floater_Liability__c]				  AS [UnityInstallationFloaterLiability]
   ,[UNITY_Installation_Flt_Liability_Expiry__c]			  AS [UnityInstallationFltLiabilityExpiry]
   ,[UNITY_Is_AR_Account__c]								  AS [UnityIsAccountsReceivable]
   ,ISNULL([UNITY_LOC__c], '')								  AS [UnityLoc]
   ,[UNITY_Miner_Regional_Office__c]						  AS [UnityMinerRegionalOffice]
   ,ISNULL([UNITY_Monday_End_Time__c], '')					  AS [UnityMondayEndTime]
   ,ISNULL([UNITY_Monday_Start_Time__c], '')				  AS [UnityMondayStartTime]
   ,ISNULL([UNITY_Off_Hour_Queue__c], '')					  AS [UnityOffHourQueue]
   ,ISNULL([UNITY_Password__c], '')							  AS [UnityPassword]
   ,ISNULL([UNITY_Portal_URL__c], '')						  AS [UnityPortalURL]
   ,[UNITY_Preferred_Vendor__c]								  AS [UnityPreferred_Vendor]
   ,[UNITY_Rented_Equipment_Liability_Expiry__c]			  AS [UnityRentedEquipmentLiabilityExpiry]
   ,[UNITY_Rented_Equipment_Liability__c]					  AS [UnityRentedEquipmentLiability]
   ,ISNULL([UNITY_SKill_ID_2__c], '')						  AS [UnitySKillId2]
   ,ISNULL([UNITY_SSN__c], '')								  AS [UnitySsn]
   ,ISNULL([UNITY_Saturday_End_Time__c], '')				  AS [UnitySaturdayEndTime]
   ,ISNULL([UNITY_Saturday_Start_Time__c], '')				  AS [UnitySaturdayStartTime]
   ,[UNITY_Service_Channel_IVR__c]							  AS [UnityServiceChannelIvr]
   ,ISNULL([UNITY_Service_Contract__c], '')					  AS [UnityServiceContract]
   ,[UNITY_Shipping_Location__Latitude__s]					  AS [UnityShippingLocationLatitude]
   ,[UNITY_Shipping_Location__Longitude__s]					  AS [UnityShippingLocationLongitude]
   ,[UNITY_Signature_Required__c]							  AS [UnitySignature_Required]
   ,ISNULL([UNITY_Skill_ID_1__c], '')						  AS [UnitySkillId]
   ,ISNULL([UNITY_Subscriber_ID__c], '')					  AS [UnitySubscriberId]
   ,ISNULL([UNITY_Sunday_End_Time__c], '')					  AS [UnitySundayEndTime]
   ,ISNULL([UNITY_Sunday_Start_Time__c], '')				  AS [UnitySundayStartTime]
   ,ISNULL([UNITY_Support_Email_Address__c], '')			  AS [UnitySupportEmailAddress]
   ,[UNITY_Tax_Exempt__c]									  AS [UnityTaxExempt]
   ,ISNULL([UNITY_Tax_ID__c], '')							  AS [UnityTaxId]
   ,ISNULL([UNITY_Thursday_End_Time__c], '')				  AS [UnityThursdayEndTime]
   ,ISNULL([UNITY_Thursday_Start_Time__c], '')				  AS [UnityThursdayStartTime]
   ,ISNULL([UNITY_Tier_Level__c], '')						  AS [UnityTierLevel]
   ,ISNULL([UNITY_TimeZoneSidKey__c], '')					  AS [UnityTimeZoneSidKey]
   ,ISNULL([UNITY_Tuesday_End_Time__c], '')					  AS [UnityTuesdayEndTime]
   ,ISNULL([UNITY_Tuesday_Start_Time__c], '')				  AS [UnityTuesdayStartTime]
   ,[UNITY_Umbrella_Liability_Expiry__c]					  AS [UnityUmbrellaLiabilityExpiry]
   ,[UNITY_Umbrella_Liability__c]							  AS [UnityUmbrellaLiability]
   ,ISNULL([UNITY_Username__c], '')							  AS [UnityUsername]
   ,[UNITY_Vendor_Score_PM__c]								  AS [UnityVendorScorePm]
   ,[UNITY_Vendor_Score_Project__c]							  AS [UnityVendorScoreProject]
   ,[UNITY_Vendor_Score_SR__c]								  AS [UnityVendorScoreSr]
   ,[UNITY_Vendor_Score_SS__c]								  AS [UnityVendorScoreSs]
   ,ISNULL([UNITY_Vendor_Status__c], '')					  AS [UnityVendorStatus]
   ,[UNITY_Vendor_Type_PM__c]								  AS [UnityVendorTypePm]
   ,[UNITY_Vendor_Type_Project__c]							  AS [UnityVendorTypeProject]
   ,[UNITY_Vendor_Type_SR__c]								  AS [UnityVendorTypeSr]
   ,[UNITY_Vendor_Type_SS__c]								  AS [UnityVendorTypeSs]
   ,[UNITY_W_9__c]											  AS [UnityW9]
   ,ISNULL([UNITY_Wednesday_End_Time__c], '')				  AS [UnityWednesdayEndTime]
   ,ISNULL([UNITY_Wednesday_Start_Time__c], '')				  AS [UnityWednesdayStartTime]
   ,[UNITY_Workers_Comp_Liability_Expiry__c]				  AS [UnityWorkersCompenstationLiabilityExpiry]
   ,[UNITY_Workers_Compensation_Liability__c]				  AS [UnityWorkersCompensationLiability]
   ,ISNULL([UNITY_MNS_Customer_Team__c], '')				  AS [UnityMnsCustomerTeam]
   ,ISNULL([Account_Parent_UNITY_Account_External_Id__c], '') AS [AccountParentUnityAccountExternalId]
   ,ISNULL([UNITY_Do_Business_As__c], '')					  AS [UnityDoBusinessAs]
   ,[UNITY_0_to_30_Past_Due__c]								  AS [Unity0To30PastDue]
   ,[UNITY_31_to_60_Past_Due__c]							  AS [Unity31To60PastDue]
   ,[UNITY_61_to_90_Past_Due__c]							  AS [Unity61To90PastDue]
   ,[UNITY_90_Days_Past_Due__c]								  AS [Unity90DaysPastDue]
   ,[UNITY_SL_Current_Balance__c]							  AS [UnitySlCurrentBalance]
   ,ISNULL([UNITY_Ultimate_Parent__c], '')					  AS [UnityUltimateParent]
   ,ISNULL([UNITY_Template_Configuration__c], '')			  AS [UnityTemplateConfiguration]
   ,ISNULL([UNITY_Fiscal_Year_Based_On__c], '')				  AS [UnityFiscalYearBasedOn]
   ,ISNULL([UNITY_Fiscal_Year_Start_Month__c], '')			  AS [UnityFiscalYearStartMonth]
   ,ISNULL([UNITY_Service_Report_Template__c], '')			  AS [UnityServiceReportTemplate]
   ,[UNITY_3rd_Party_Customer__c]							  AS [Unity3rdPartyCustomer]
   ,ISNULL([BillingGeocodeAccuracy], '')					  AS [BillingGeocodeAccuracy]
   ,ISNULL([ShippingGeocodeAccuracy], '')					  AS [ShippingGeocodeAccuracy]
   ,ISNULL([UNITY_Company__c], '')							  AS [UnityCompany]
   ,ISNULL([SL_Notes_Text__c], '')							  AS [SlNotesText]
   ,ISNULL([SL_Notes__c], '')								  AS [SlNotes]
   ,[SL_Promise_Date__c]									  AS [SlPromiseDate]
   ,ISNULL([MSPFS_BU_Shipping_Address__c], '')				  AS [MmpfsBuShippingAddress]
   ,[MSP_Go_Live_Date__c]									  AS [MspGoLiveDate]
   ,ISNULL([UNITY_Company_Text__c], '')						  AS [UnityCompanyText]
   ,ISNULL([UNITY_Vendor_ID__c], '')						  AS [UnityVendorId]
   ,ISNULL([MSPFS_BU_Billing_Address__c], '')				  AS [MspfsBuBillingAddress]
   ,ISNULL([MSPFS_Business_Unit_Legal_Name__c], '')			  AS [MspfsBusinessUnitLegalName]
   ,ISNULL([MSPFS_MSP_Bill_to_Account__c], '')				  AS [MspfsMSPBillToAccount]
   ,ISNULL([UNITY_Vendor_Manager__c], '')					  AS [UnityVendorManager]
   ,[UNITY_Has_Community_Member__c]							  AS [UnityHasCommUnityMember]
   ,ISNULL([UNITY_Record_Type_Name__c], '')					  AS [UnityRecordTypeName]
   ,ISNULL([UNITYPM_PIN__c], '')							  AS [UnityPmPin]
   ,[LastModifiedDate]										  AS LastUpdate
   ,GETUTCDATE()											  AS ImportDate
FROM [SF].[Account];