﻿CREATE TABLE [SF].[MH_Invoice__c] (
    [Id]                                                   NVARCHAR (18)   NOT NULL,
    [OwnerId]                                              NVARCHAR (18)   NULL,
    [IsDeleted]                                            TINYINT         NULL,
    [Name]                                                 NVARCHAR (80)   NULL,
    [RecordTypeId]                                         NVARCHAR (18)   NULL,
    [CreatedDate]                                          DATETIME        NULL,
    [CreatedById]                                          NVARCHAR (18)   NULL,
    [LastModifiedDate]                                     DATETIME        NULL,
    [LastModifiedById]                                     NVARCHAR (18)   NULL,
    [SystemModstamp]                                       DATETIME        NULL,
    [LastActivityDate]                                     DATETIME        NULL,
    [LastViewedDate]                                       DATETIME        NULL,
    [LastReferencedDate]                                   DATETIME        NULL,
    [Account__c]                                           NVARCHAR (18)   NULL,
    [Contact__c]                                           NVARCHAR (18)   NULL,
    [Customer_P_O__c]                                      NVARCHAR (35)   NULL,
    [Invoice_Total__c]                                     FLOAT (53)      NULL,
    [Location__c]                                          NVARCHAR (18)   NULL,
    [Work_Order__c]                                        NVARCHAR (18)   NULL,
    [Field_Office__c]                                      NVARCHAR (18)   NULL,
    [Voucher__c]                                           TINYINT         NULL,
    [Activity_Type__c]                                     NVARCHAR (255)  NULL,
    [Date_Invoiced__c]                                     DATETIME        NULL,
    [Call_Type__c]                                         NVARCHAR (1300) NULL,
    [Invoice_Total_Rollup__c]                              FLOAT (53)      NULL,
    [Location_Address_c__c]                                NVARCHAR (100)  NULL,
    [Location_City_c__c]                                   NVARCHAR (50)   NULL,
    [Labor_Time__c]                                        FLOAT (53)      NULL,
    [Invoice_Details_Sub_Total__c]                         FLOAT (53)      NULL,
    [Sales_Tax__c]                                         FLOAT (53)      NULL,
    [Work_Description__c]                                  NVARCHAR (MAX)  NULL,
    [Start_Date_and_Time__c]                               DATETIME        NULL,
    [End_Date_and_Time__c]                                 DATETIME        NULL,
    [Consumed_From_Location__c]                            NVARCHAR (18)   NULL,
    [Location_State_c__c]                                  NVARCHAR (25)   NULL,
    [Location_Zip_c__c]                                    NVARCHAR (15)   NULL,
    [Supercenter__c]                                       NVARCHAR (100)  NULL,
    [Segment__c]                                           NVARCHAR (100)  NULL,
    [Supercenter_Formula__c]                               NVARCHAR (1300) NULL,
    [Segment_Formula__c]                                   NVARCHAR (1300) NULL,
    [Invoice_Terms_c__c]                                   NVARCHAR (25)   NULL,
    [Invoice_Sales_Tax_Roll_up__c]                         FLOAT (53)      NULL,
    [Invoice_Total_Rollup_1__c]                            FLOAT (53)      NULL,
    [Service_Notes_c__c]                                   NVARCHAR (MAX)  NULL,
    [Service_Team_Address_ic__c]                           NVARCHAR (255)  NULL,
    [Service_Team_City_ic__c]                              NVARCHAR (255)  NULL,
    [Service_Team_State_ic__c]                             NVARCHAR (255)  NULL,
    [Service_Team_Zip_ic__c]                               NVARCHAR (255)  NULL,
    [Service_Team_ic__c]                                   NVARCHAR (255)  NULL,
    [SL_Invoice_ID__c]                                     NVARCHAR (30)   NULL,
    [Status__c]                                            NVARCHAR (255)  NULL,
    [Company__c]                                           NVARCHAR (1300) NULL,
    [Recommended_Service__c]                               NVARCHAR (MAX)  NULL,
    [SP_Work_Performed_c__c]                               NVARCHAR (MAX)  NULL,
    [Invoice_Total_formula__c]                             FLOAT (53)      NULL,
    [Sub_Total__c]                                         FLOAT (53)      NULL,
    [Total_Tax__c]                                         FLOAT (53)      NULL,
    [Hide_Line_ic__c]                                      TINYINT         NULL,
    [SL_Status__c]                                         NVARCHAR (1)    NULL,
    [Tax_Added__c]                                         FLOAT (53)      NULL,
    [Service_Team_Legal_Name__c]                           NVARCHAR (100)  NULL,
    [Post_to_Period__c]                                    NVARCHAR (7)    NULL,
    [Account_Terms__c]                                     NVARCHAR (1300) NULL,
    [WO_Doc_Number__c]                                     NVARCHAR (25)   NULL,
    [WO_Order_Type__c]                                     NVARCHAR (1300) NULL,
    [SL_Invoice_Date_c__c]                                 DATETIME        NULL,
    [Invoice_Details_Revenue__c]                           FLOAT (53)      NULL,
    [Invoice_Details_Cost__c]                              FLOAT (53)      NULL,
    [Invoice_Margin__c]                                    FLOAT (53)      NULL,
    [WO_Labor_Total__c]                                    FLOAT (53)      NULL,
    [WO_Parts_Total__c]                                    FLOAT (53)      NULL,
    [WO_TFS_Tax_Total__c]                                  FLOAT (53)      NULL,
    [Voucher_Roll_Up_Total__c]                             FLOAT (53)      NULL,
    [Account_Account__r_SL_Vendor_ID__c]                   NVARCHAR (15)   NULL,
    [Account_Field_Office__r_SL_Vendor_ID__c]              NVARCHAR (15)   NULL,
    [Account_Account__r_MH_SL_CustID__c]                   NVARCHAR (15)   NULL,
    [Account_Field_Office__r_MH_SL_CustID__c]              NVARCHAR (15)   NULL,
    [Account_Account__r_UNITY_Account_External_Id__c]      NVARCHAR (80)   NULL,
    [Account_Field_Office__r_UNITY_Account_External_Id__c] NVARCHAR (80)   NULL,
    [Contact_Contact__r_UNITY_Contact_External_Id__c]      NVARCHAR (80)   NULL,
    [Certificate__c]                                       NVARCHAR (80)   NULL,
    CONSTRAINT [PK_MH_Invoice__c] PRIMARY KEY CLUSTERED ([Id] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_MH_Invoice__c_Id]
    ON [SF].[MH_Invoice__c]([Id] ASC);

