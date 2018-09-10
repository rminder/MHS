﻿CREATE TABLE [SF].[Account] (
    [Id]                                          NVARCHAR (18)   NOT NULL,
    [IsDeleted]                                   TINYINT         NULL,
    [MasterRecordId]                              NVARCHAR (18)   NULL,
    [Name]                                        NVARCHAR (255)  NULL,
    [Type]                                        NVARCHAR (40)   NULL,
    [RecordTypeId]                                NVARCHAR (18)   NULL,
    [ParentId]                                    NVARCHAR (18)   NULL,
    [BillingStreet]                               NVARCHAR (255)  NULL,
    [BillingCity]                                 NVARCHAR (40)   NULL,
    [BillingState]                                NVARCHAR (80)   NULL,
    [BillingPostalCode]                           NVARCHAR (20)   NULL,
    [BillingCountry]                              NVARCHAR (80)   NULL,
    [BillingStateCode]                            NVARCHAR (10)   NULL,
    [BillingCountryCode]                          NVARCHAR (10)   NULL,
    [BillingLatitude]                             FLOAT (53)      NULL,
    [BillingLongitude]                            FLOAT (53)      NULL,
    [ShippingStreet]                              NVARCHAR (255)  NULL,
    [ShippingCity]                                NVARCHAR (40)   NULL,
    [ShippingState]                               NVARCHAR (80)   NULL,
    [ShippingPostalCode]                          NVARCHAR (20)   NULL,
    [ShippingCountry]                             NVARCHAR (80)   NULL,
    [ShippingStateCode]                           NVARCHAR (10)   NULL,
    [ShippingCountryCode]                         NVARCHAR (10)   NULL,
    [ShippingLatitude]                            FLOAT (53)      NULL,
    [ShippingLongitude]                           FLOAT (53)      NULL,
    [Phone]                                       NVARCHAR (40)   NULL,
    [Fax]                                         NVARCHAR (40)   NULL,
    [Website]                                     NVARCHAR (255)  NULL,
    [Industry]                                    NVARCHAR (40)   NULL,
    [AnnualRevenue]                               FLOAT (53)      NULL,
    [NumberOfEmployees]                           INT             NULL,
    [Description]                                 NVARCHAR (MAX)  NULL,
    [Site]                                        NVARCHAR (80)   NULL,
    [OwnerId]                                     NVARCHAR (18)   NULL,
    [CreatedDate]                                 DATETIME        NULL,
    [CreatedById]                                 NVARCHAR (18)   NULL,
    [LastModifiedDate]                            DATETIME        NULL,
    [LastModifiedById]                            NVARCHAR (18)   NULL,
    [SystemModstamp]                              DATETIME        NULL,
    [LastActivityDate]                            DATETIME        NULL,
    [LastViewedDate]                              DATETIME        NULL,
    [LastReferencedDate]                          DATETIME        NULL,
    [IsCustomerPortal]                            TINYINT         NULL,
    [Jigsaw]                                      NVARCHAR (20)   NULL,
    [JigsawCompanyId]                             NVARCHAR (20)   NULL,
    [AccountSource]                               NVARCHAR (40)   NULL,
    [SicDesc]                                     NVARCHAR (80)   NULL,
    [SVMXC__Access_Hours__c]                      NVARCHAR (18)   NULL,
    [SVMXC__Business_Hours__c]                    NVARCHAR (18)   NULL,
    [SVMXC__Preferred_Technician__c]              NVARCHAR (18)   NULL,
    [SVMXC__Latitude__c]                          FLOAT (53)      NULL,
    [SVMXC__Longitude__c]                         FLOAT (53)      NULL,
    [Account_Status__c]                           NVARCHAR (255)  NULL,
    [Account_Fax__c]                              NVARCHAR (40)   NULL,
    [Account_Email__c]                            NVARCHAR (80)   NULL,
    [Shipping_Phone__c]                           NVARCHAR (40)   NULL,
    [Shipping_Fax__c]                             NVARCHAR (40)   NULL,
    [Shipping_Email__c]                           NVARCHAR (80)   NULL,
    [Primary_Equipment_Asset_Fee__c]              FLOAT (53)      NULL,
    [Ancillary_Equipment_Asset_Fee__c]            FLOAT (53)      NULL,
    [Sales_Territory_ID__c]                       NVARCHAR (15)   NULL,
    [Labor_Rate_Standard__c]                      FLOAT (53)      NULL,
    [AR_Customer_Account__c]                      NVARCHAR (15)   NULL,
    [Salesperson__c]                              NVARCHAR (18)   NULL,
    [Temp_Account__c]                             TINYINT         NULL,
    [Work_Types__c]                               NVARCHAR (MAX)  NULL,
    [Labor_Rate_Premium__c]                       FLOAT (53)      NULL,
    [Number_of_Locations__c]                      FLOAT (53)      NULL,
    [Business_Unit__c]                            NVARCHAR (255)  NULL,
    [Organization__c]                             NVARCHAR (255)  NULL,
    [NTE_Threshold__c]                            FLOAT (53)      NULL,
    [Primary_Contact__c]                          NVARCHAR (50)   NULL,
    [Primary_Contact_Email__c]                    NVARCHAR (80)   NULL,
    [Labor_Rate_Two_Man__c]                       FLOAT (53)      NULL,
    [Account_Cell_Phone__c]                       NVARCHAR (40)   NULL,
    [Vendor_ID__c]                                NVARCHAR (10)   NULL,
    [MH_GL_Account__c]                            NVARCHAR (10)   NULL,
    [Lead_Source_Marketing__c]                    NVARCHAR (255)  NULL,
    [MH_Credit_Limit__c]                          FLOAT (53)      NULL,
    [MH_SL_CustID__c]                             NVARCHAR (15)   NULL,
    [MH_Terms__c]                                 NVARCHAR (2)    NULL,
    [MH_Attention__c]                             NVARCHAR (30)   NULL,
    [CustID_Legacy__c]                            NVARCHAR (50)   NULL,
    [MH_Primary_Contact__c]                       NVARCHAR (18)   NULL,
    [Primary_Contact_Salut__c]                    NVARCHAR (30)   NULL,
    [Average_Days_to_Pay__c]                      FLOAT (53)      NULL,
    [MH_Tax_Schedule__c]                          NVARCHAR (8)    NULL,
    [MH_Billing_Contact__c]                       NVARCHAR (18)   NULL,
    [MH_Credit_Hold__c]                           TINYINT         NULL,
    [MH_Current_Balance__c]                       FLOAT (53)      NULL,
    [MH_Customer_Type__c]                         NVARCHAR (4)    NULL,
    [MH_Email_Statements__c]                      TINYINT         NULL,
    [MH_GL_SubAccount__c]                         NVARCHAR (24)   NULL,
    [TEST_DATA_DO_NOT_USE__c]                     TINYINT         NULL,
    [AP_Account__c]                               NVARCHAR (10)   NULL,
    [APSubaccount__c]                             NVARCHAR (24)   NULL,
    [Labor_PM_Rate_DDM__c]                        FLOAT (53)      NULL,
    [Labor_PM_Rate_MHE__c]                        FLOAT (53)      NULL,
    [Labor_Standard_DDM__c]                       FLOAT (53)      NULL,
    [Labor_Standard_MHE__c]                       FLOAT (53)      NULL,
    [Labor_2_Man_DDM__c]                          FLOAT (53)      NULL,
    [Labor_2_Man_MHE__c]                          FLOAT (53)      NULL,
    [Labor_OTDDM_DDM__c]                          FLOAT (53)      NULL,
    [Labor_OTMHE_MHE__c]                          FLOAT (53)      NULL,
    [Labor_DTMHE_MHE__c]                          FLOAT (53)      NULL,
    [Labor_DTDDM_DDM__c]                          FLOAT (53)      NULL,
    [AR_Division_Number__c]                       NVARCHAR (5)    NULL,
    [Company__c]                                  NVARCHAR (5)    NULL,
    [Remit_Address__c]                            NVARCHAR (255)  NULL,
    [Remit_City__c]                               NVARCHAR (30)   NULL,
    [Remit_State_Province__c]                     NVARCHAR (20)   NULL,
    [Remit_Zip_Code__c]                           NVARCHAR (11)   NULL,
    [Remit_Country__c]                            NVARCHAR (25)   NULL,
    [Customer_Notes__c]                           NVARCHAR (MAX)  NULL,
    [SL_Vendor_ID__c]                             NVARCHAR (15)   NULL,
    [Billing_Attention__c]                        NVARCHAR (30)   NULL,
    [Billing_Name__c]                             NVARCHAR (255)  NULL,
    [Remit_Name__c]                               NVARCHAR (255)  NULL,
    [Remit_Phone__c]                              NVARCHAR (40)   NULL,
    [Available_Credit__c]                         FLOAT (53)      NULL,
    [Credit_Rule__c]                              NVARCHAR (2)    NULL,
    [Miner_Salesperson_c__c]                      NVARCHAR (18)   NULL,
    [Customer_Type_Mktg_Segmets__c]               NVARCHAR (255)  NULL,
    [Tire_Press__c]                               TINYINT         NULL,
    [Salesperson_2__c]                            NVARCHAR (18)   NULL,
    [Delivery_Vehicles__c]                        NVARCHAR (MAX)  NULL,
    [Grade_1__c]                                  NVARCHAR (255)  NULL,
    [Grade_2__c]                                  NVARCHAR (255)  NULL,
    [Affiliate_Grade__c]                          NVARCHAR (1300) NULL,
    [Docks__c]                                    TINYINT         NULL,
    [Doors__c]                                    TINYINT         NULL,
    [Customer_Service_Rep_CSR__c]                 TINYINT         NULL,
    [OEM__c]                                      NVARCHAR (255)  NULL,
    [Scissor_Boom_OEM__c]                         NVARCHAR (255)  NULL,
    [Deleted_Account_ID__c]                       NVARCHAR (18)   NULL,
    [Fax_Iteration__c]                            NVARCHAR (1300) NULL,
    [Phone_Iteration__c]                          NVARCHAR (1300) NULL,
    [Pay_Terms__c]                                NVARCHAR (1300) NULL,
    [Draw_Date__c]                                NVARCHAR (255)  NULL,
    [Retainage__c]                                FLOAT (53)      NULL,
    [OEM_Affiliation__c]                          NVARCHAR (255)  NULL,
    [Vendor_Expense_Type__c]                      NVARCHAR (255)  NULL,
    [Account_Parent_SL_Vendor_ID__c]              NVARCHAR (15)   NULL,
    [Ready_to_Convert__c]                         TINYINT         NULL,
    [Affiliate__c]                                TINYINT         NULL,
    [Parent_Affiliate__c]                         NVARCHAR (18)   NULL,
    [Account_Count__c]                            FLOAT (53)      NULL,
    [DunsNumber]                                  NVARCHAR (9)    NULL,
    [Tradestyle]                                  NVARCHAR (255)  NULL,
    [NaicsCode]                                   NVARCHAR (8)    NULL,
    [NaicsDesc]                                   NVARCHAR (120)  NULL,
    [YearStarted]                                 NVARCHAR (4)    NULL,
    [Residential__c]                              TINYINT         NULL,
    [Opportunity_Trade__c]                        NVARCHAR (MAX)  NULL,
    [Account_Parent_MH_SL_CustID__c]              NVARCHAR (15)   NULL,
    [Account_Approver__c]                         NVARCHAR (18)   NULL,
    [PhotoUrl]                                    NVARCHAR (255)  NULL,
    [User_Owner_UNITY_Agent_ID__c]                NVARCHAR (18)   NULL,
    [IsPartner]                                   TINYINT         NULL,
    [AccountNumber]                               NVARCHAR (40)   NULL,
    [Sic]                                         NVARCHAR (20)   NULL,
    [Ownership]                                   NVARCHAR (40)   NULL,
    [TickerSymbol]                                NVARCHAR (20)   NULL,
    [Rating]                                      NVARCHAR (40)   NULL,
    [All_in_PM_Rate_Electric__c]                  FLOAT (53)      NULL,
    [All_in_PM_Rate_Propane__c]                   FLOAT (53)      NULL,
    [Contract_Paint__c]                           TINYINT         NULL,
    [Delivery_Capability__c]                      TINYINT         NULL,
    [Mobile_Tire_Press__c]                        TINYINT         NULL,
    [Number_of_Service_Vans__c]                   FLOAT (53)      NULL,
    [Number_of_Tech__c]                           FLOAT (53)      NULL,
    [Opportunity_Pending__c]                      TINYINT         NULL,
    [PM_Rate__c]                                  FLOAT (53)      NULL,
    [Paint_Booth__c]                              TINYINT         NULL,
    [Parts_Dept__c]                               TINYINT         NULL,
    [Propane__c]                                  TINYINT         NULL,
    [Refurb__c]                                   TINYINT         NULL,
    [Service_Batteries__c]                        TINYINT         NULL,
    [Service_Rate__c]                             FLOAT (53)      NULL,
    [Tire_Press_3rd_party__c]                     TINYINT         NULL,
    [Trip_Charge__c]                              FLOAT (53)      NULL,
    [Trip_Fee__c]                                 TINYINT         NULL,
    [X24_Hour_Emergency_Repair__c]                TINYINT         NULL,
    [Salesperson_Second__c]                       NVARCHAR (18)   NULL,
    [Certificate__c]                              NVARCHAR (25)   NULL,
    [FSO__Active__c]                              NVARCHAR (255)  NULL,
    [Super_Center__c]                             NVARCHAR (18)   NULL,
    [Tax_ID__c]                                   NVARCHAR (9)    NULL,
    [FSO__CustomerPriority__c]                    NVARCHAR (255)  NULL,
    [FSO__NumberofLocations__c]                   FLOAT (53)      NULL,
    [FSO__SLAExpirationDate__c]                   DATETIME        NULL,
    [FSO__SLASerialNumber__c]                     NVARCHAR (10)   NULL,
    [FSO__SLA__c]                                 NVARCHAR (255)  NULL,
    [FSO__UpsellOpportunity__c]                   NVARCHAR (255)  NULL,
    [Account_Loop__c]                             NVARCHAR (18)   NULL,
    [BU_Unique_Field__c]                          NVARCHAR (255)  NULL,
    [SL_Company_ID__c]                            NVARCHAR (3)    NULL,
    [SSVY_Last_Visited_Date__c]                   DATETIME        NULL,
    [SSVY_Total_Assets__c]                        FLOAT (53)      NULL,
    [SSVY_Total_Site_Surveys_Completed__c]        FLOAT (53)      NULL,
    [Timne_Zone_Offset__c]                        NVARCHAR (255)  NULL,
    [UNITY_Account_External_Id__c]                NVARCHAR (80)   NULL,
    [UNITY_Account_ID__c]                         NVARCHAR (30)   NULL,
    [UNITY_Account_Routing_ID__c]                 NVARCHAR (6)    NULL,
    [UNITY_Agent_Work_Day__c]                     NVARCHAR (MAX)  NULL,
    [UNITY_Agent_Work_Hour_End_Time__c]           NVARCHAR (5)    NULL,
    [UNITY_Agent_Work_Hour_Start_Time__c]         NVARCHAR (5)    NULL,
    [UNITY_Automobile_Liability_Expiry__c]        DATETIME        NULL,
    [UNITY_Automobile_Liability__c]               TINYINT         NULL,
    [UNITY_Bill_To_Account__c]                    NVARCHAR (18)   NULL,
    [UNITY_Bill_to_HQ__c]                         TINYINT         NULL,
    [UNITY_Bundling_Requirements__c]              NVARCHAR (255)  NULL,
    [UNITY_Business_Unit__c]                      NVARCHAR (255)  NULL,
    [UNITY_Company_Code__c]                       NVARCHAR (5)    NULL,
    [UNITY_Customer_Size__c]                      NVARCHAR (255)  NULL,
    [UNITY_Customer_Team__c]                      NVARCHAR (255)  NULL,
    [UNITY_Dispatcher__c]                         NVARCHAR (18)   NULL,
    [UNITY_Do_Not_Use_Flagged_Date__c]            DATETIME        NULL,
    [UNITY_Do_Not_Use_Reason__c]                  NVARCHAR (255)  NULL,
    [UNITY_Do_Not_Use__c]                         TINYINT         NULL,
    [UNITY_Friday_End_Time__c]                    NVARCHAR (5)    NULL,
    [UNITY_Friday_Start_Time__c]                  NVARCHAR (5)    NULL,
    [UNITY_General_Liability_Expiry__c]           DATETIME        NULL,
    [UNITY_General_Liability__c]                  TINYINT         NULL,
    [UNITY_Has_Preferred_Part__c]                 TINYINT         NULL,
    [UNITY_Hours_of_Operation_Summary__c]         NVARCHAR (1300) NULL,
    [UNITY_Hours_of_Operation__c]                 NVARCHAR (MAX)  NULL,
    [UNITY_IRS_Validated__c]                      TINYINT         NULL,
    [UNITY_IVR_Phone_Number__c]                   NVARCHAR (40)   NULL,
    [UNITY_IVR_Pin__c]                            NVARCHAR (8)    NULL,
    [UNITY_Installation_Floater_Liability__c]     TINYINT         NULL,
    [UNITY_Installation_Flt_Liability_Expiry__c]  DATETIME        NULL,
    [UNITY_Is_AR_Account__c]                      TINYINT         NULL,
    [UNITY_LOC__c]                                NVARCHAR (20)   NULL,
    [UNITY_Miner_Regional_Office__c]              TINYINT         NULL,
    [UNITY_Monday_End_Time__c]                    NVARCHAR (5)    NULL,
    [UNITY_Monday_Start_Time__c]                  NVARCHAR (5)    NULL,
    [UNITY_Off_Hour_Queue__c]                     NVARCHAR (60)   NULL,
    [UNITY_Password__c]                           NVARCHAR (174)  NULL,
    [UNITY_Portal_URL__c]                         NVARCHAR (255)  NULL,
    [UNITY_Preferred_Vendor__c]                   TINYINT         NULL,
    [UNITY_Rented_Equipment_Liability_Expiry__c]  DATETIME        NULL,
    [UNITY_Rented_Equipment_Liability__c]         TINYINT         NULL,
    [UNITY_SKill_ID_2__c]                         NVARCHAR (6)    NULL,
    [UNITY_SSN__c]                                NVARCHAR (11)   NULL,
    [UNITY_Saturday_End_Time__c]                  NVARCHAR (5)    NULL,
    [UNITY_Saturday_Start_Time__c]                NVARCHAR (5)    NULL,
    [UNITY_Service_Channel_IVR__c]                TINYINT         NULL,
    [UNITY_Service_Contract__c]                   NVARCHAR (18)   NULL,
    [UNITY_Shipping_Location__Latitude__s]        FLOAT (53)      NULL,
    [UNITY_Shipping_Location__Longitude__s]       FLOAT (53)      NULL,
    [UNITY_Signature_Required__c]                 TINYINT         NULL,
    [UNITY_Skill_ID_1__c]                         NVARCHAR (6)    NULL,
    [UNITY_Subscriber_ID__c]                      NVARCHAR (20)   NULL,
    [UNITY_Sunday_End_Time__c]                    NVARCHAR (5)    NULL,
    [UNITY_Sunday_Start_Time__c]                  NVARCHAR (5)    NULL,
    [UNITY_Support_Email_Address__c]              NVARCHAR (80)   NULL,
    [UNITY_Tax_Exempt__c]                         TINYINT         NULL,
    [UNITY_Tax_ID__c]                             NVARCHAR (10)   NULL,
    [UNITY_Thursday_End_Time__c]                  NVARCHAR (5)    NULL,
    [UNITY_Thursday_Start_Time__c]                NVARCHAR (5)    NULL,
    [UNITY_Tier_Level__c]                         NVARCHAR (255)  NULL,
    [UNITY_TimeZoneSidKey__c]                     NVARCHAR (255)  NULL,
    [UNITY_Tuesday_End_Time__c]                   NVARCHAR (5)    NULL,
    [UNITY_Tuesday_Start_Time__c]                 NVARCHAR (5)    NULL,
    [UNITY_Umbrella_Liability_Expiry__c]          DATETIME        NULL,
    [UNITY_Umbrella_Liability__c]                 TINYINT         NULL,
    [UNITY_Username__c]                           NVARCHAR (255)  NULL,
    [UNITY_Vendor_Score_PM__c]                    FLOAT (53)      NULL,
    [UNITY_Vendor_Score_Project__c]               FLOAT (53)      NULL,
    [UNITY_Vendor_Score_SR__c]                    FLOAT (53)      NULL,
    [UNITY_Vendor_Score_SS__c]                    FLOAT (53)      NULL,
    [UNITY_Vendor_Status__c]                      NVARCHAR (255)  NULL,
    [UNITY_Vendor_Type_PM__c]                     TINYINT         NULL,
    [UNITY_Vendor_Type_Project__c]                TINYINT         NULL,
    [UNITY_Vendor_Type_SR__c]                     TINYINT         NULL,
    [UNITY_Vendor_Type_SS__c]                     TINYINT         NULL,
    [UNITY_W_9__c]                                TINYINT         NULL,
    [UNITY_Wednesday_End_Time__c]                 NVARCHAR (5)    NULL,
    [UNITY_Wednesday_Start_Time__c]               NVARCHAR (5)    NULL,
    [UNITY_Workers_Comp_Liability_Expiry__c]      DATETIME        NULL,
    [UNITY_Workers_Compensation_Liability__c]     TINYINT         NULL,
    [UNITY_MNS_Customer_Team__c]                  NVARCHAR (255)  NULL,
    [Account_Parent_UNITY_Account_External_Id__c] NVARCHAR (80)   NULL,
    [UNITY_Do_Business_As__c]                     NVARCHAR (255)  NULL,
    [UNITY_0_to_30_Past_Due__c]                   FLOAT (53)      NULL,
    [UNITY_31_to_60_Past_Due__c]                  FLOAT (53)      NULL,
    [UNITY_61_to_90_Past_Due__c]                  FLOAT (53)      NULL,
    [UNITY_90_Days_Past_Due__c]                   FLOAT (53)      NULL,
    [UNITY_SL_Current_Balance__c]                 FLOAT (53)      NULL,
    [UNITY_Ultimate_Parent__c]                    NVARCHAR (18)   NULL,
    [UNITY_Template_Configuration__c]             NVARCHAR (18)   NULL,
    [UNITY_Fiscal_Year_Based_On__c]               NVARCHAR (255)  NULL,
    [UNITY_Fiscal_Year_Start_Month__c]            NVARCHAR (255)  NULL,
    [UNITY_Service_Report_Template__c]            NVARCHAR (50)   NULL,
    [UNITY_3rd_Party_Customer__c]                 TINYINT         NULL,
    [BillingGeocodeAccuracy]                      NVARCHAR (40)   NULL,
    [ShippingGeocodeAccuracy]                     NVARCHAR (40)   NULL,
    [UNITY_Company__c]                            NVARCHAR (1300) NULL,
    [SL_Notes_Text__c]                            NVARCHAR (MAX)  NULL,
    [SL_Notes__c]                                 NVARCHAR (MAX)  NULL,
    [SL_Promise_Date__c]                          DATETIME        NULL,
    [MSPFS_BU_Shipping_Address__c]                NVARCHAR (1300) NULL,
    [MSP_Go_Live_Date__c]                         DATETIME        NULL,
    [UNITY_Company_Text__c]                       NVARCHAR (250)  NULL,
    [UNITY_Vendor_ID__c]                          NVARCHAR (20)   NULL,
    [MSPFS_BU_Billing_Address__c]                 NVARCHAR (1300) NULL,
    [MSPFS_Business_Unit_Legal_Name__c]           NVARCHAR (255)  NULL,
    [MSPFS_MSP_Bill_to_Account__c]                NVARCHAR (18)   NULL,
    [UNITY_Vendor_Manager__c]                     NVARCHAR (18)   NULL,
    [UNITY_Has_Community_Member__c]               TINYINT         NULL,
    [UNITY_Record_Type_Name__c]                   NVARCHAR (1300) NULL,
    [UNITYPM_PIN__c]                              NVARCHAR (4)    NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED ([Id] ASC)
);
