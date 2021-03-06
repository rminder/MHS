﻿CREATE TABLE [SF].[SVMXC__Service_Order__c] (
    [Id]                                                NVARCHAR (18)   NOT NULL,
    [OwnerId]                                           NVARCHAR (18)   NULL,
    [IsDeleted]                                         TINYINT         NULL,
    [Name]                                              NVARCHAR (80)   NULL,
    [RecordTypeId]                                      NVARCHAR (18)   NULL,
    [CreatedDate]                                       DATETIME        NULL,
    [CreatedById]                                       NVARCHAR (18)   NULL,
    [LastModifiedDate]                                  DATETIME        NULL,
    [LastModifiedById]                                  NVARCHAR (18)   NULL,
    [SystemModstamp]                                    DATETIME        NULL,
    [LastActivityDate]                                  DATETIME        NULL,
    [LastViewedDate]                                    DATETIME        NULL,
    [LastReferencedDate]                                DATETIME        NULL,
    [SVMXC__Age_Bucket__c]                              NVARCHAR (1300) NULL,
    [SVMXC__Age__c]                                     FLOAT (53)      NULL,
    [SVMXC__Billing_Type__c]                            NVARCHAR (255)  NULL,
    [SVMXC__City__c]                                    NVARCHAR (100)  NULL,
    [SVMXC__Company__c]                                 NVARCHAR (18)   NULL,
    [SVMXC__Component__c]                               NVARCHAR (18)   NULL,
    [SVMXC__Configuration_After__c]                     NVARCHAR (MAX)  NULL,
    [SVMXC__Configuration_Before__c]                    NVARCHAR (MAX)  NULL,
    [SVMXC__Contact__c]                                 NVARCHAR (18)   NULL,
    [SVMXC__Country__c]                                 NVARCHAR (255)  NULL,
    [SVMXC__Customer_Down_Status__c]                    NVARCHAR (1300) NULL,
    [SVMXC__Customer_Down__c]                           TINYINT         NULL,
    [SVMXC__Dispatch_Status__c]                         NVARCHAR (1300) NULL,
    [SVMXC__Driving_Time__c]                            FLOAT (53)      NULL,
    [SVMXC__EndpointURL__c]                             NVARCHAR (1300) NULL,
    [SVMXC__First_Queued_DateTime__c]                   DATETIME        NULL,
    [SVMXC__Group_Email__c]                             NVARCHAR (80)   NULL,
    [SVMXC__Group_Member__c]                            NVARCHAR (18)   NULL,
    [SVMXC__IsPartner__c]                               NVARCHAR (1300) NULL,
    [SVMXC__Last_Dispatch_Event__c]                     NVARCHAR (255)  NULL,
    [SVMXC__Member_Email__c]                            NVARCHAR (80)   NULL,
    [SVMXC__NoOfTimesQueued__c]                         FLOAT (53)      NULL,
    [SVMXC__Number_Of_Times_Queued_Bucket__c]           NVARCHAR (1300) NULL,
    [SVMXC__Number_Of_Times_Scheduled_Bucket__c]        NVARCHAR (1300) NULL,
    [SVMXC__OptiMax_Status__c]                          NVARCHAR (255)  NULL,
    [SVMXC__Order_Status__c]                            NVARCHAR (255)  NULL,
    [SVMXC__Order_Type__c]                              NVARCHAR (255)  NULL,
    [SVMXC__Priority__c]                                NVARCHAR (255)  NULL,
    [SVMXC__Problem_Description__c]                     NVARCHAR (MAX)  NULL,
    [SVMXC__Product__c]                                 NVARCHAR (18)   NULL,
    [SVMXC__SESSION_ID__c]                              NVARCHAR (1300) NULL,
    [SVMXC__Scheduled_Date_Time__c]                     DATETIME        NULL,
    [SVMXC__Scheduled_Date__c]                          DATETIME        NULL,
    [SVMXC__TimeBetweenScheduleAndClose__c]             FLOAT (53)      NULL,
    [SVMXC__TimeToAssign__c]                            FLOAT (53)      NULL,
    [SVMXC__TimeToQueue__c]                             FLOAT (53)      NULL,
    [SVMXC__TimeToSchedule__c]                          FLOAT (53)      NULL,
    [SVMXC__Time_Between_Assign_And_Schedule_Bucket__c] NVARCHAR (1300) NULL,
    [SVMXC__Time_Between_Queue_And_Assign_Bucket__c]    NVARCHAR (1300) NULL,
    [SVMXC__Time_Between_Schedule_And_Close_Bucket__c]  NVARCHAR (1300) NULL,
    [SVMXC__Time_to_Assign_Bucket__c]                   NVARCHAR (1300) NULL,
    [SVMXC__Time_to_Queue_Bucket__c]                    NVARCHAR (1300) NULL,
    [SVMXC__Time_to_Schedule_Bucket__c]                 NVARCHAR (1300) NULL,
    [SVMXC__Turnaround_Time__c]                         NVARCHAR (1300) NULL,
    [SVMXC__Work_Performed__c]                          NVARCHAR (MAX)  NULL,
    [SVMXC__Zip__c]                                     NVARCHAR (100)  NULL,
    [SVMXC__Total_Billable_Amount__c]                   FLOAT (53)      NULL,
    [SVMXC__Total_Work_Order_Cost__c]                   FLOAT (53)      NULL,
    [Location__c]                                       NVARCHAR (18)   NULL,
    [SVMXC__Invoice_Created__c]                         TINYINT         NULL,
    [SVMXC__Invoice_Number__c]                          NVARCHAR (255)  NULL,
    [SVMXC__Is_Entitlement_Performed__c]                TINYINT         NULL,
    [SVMXC__Is_Service_Covered__c]                      TINYINT         NULL,
    [SVMXC__Perform_Auto_Entitlement__c]                TINYINT         NULL,
    [SVMXC__Site__c]                                    NVARCHAR (18)   NULL,
    [SVMXC__QTL_Status__c]                              NVARCHAR (255)  NULL,
    [SVMXC__Qualified_Technicians__c]                   NVARCHAR (MAX)  NULL,
    [SVMXC__Skill_Set__c]                               NVARCHAR (MAX)  NULL,
    [SVMXC__Service_Zone_ID__c]                         NVARCHAR (255)  NULL,
    [Estimated_Work_Detail_Total__c]                    FLOAT (53)      NULL,
    [Work_Order_Denied_Reason__c]                       NVARCHAR (255)  NULL,
    [Additional_Service_Recommended__c]                 TINYINT         NULL,
    [Emergency_Service__c]                              TINYINT         NULL,
    [Serial_Number__c]                                  NVARCHAR (100)  NULL,
    [Asset_Tag__c]                                      NVARCHAR (100)  NULL,
    [Customer_P_O__c]                                   NVARCHAR (35)   NULL,
    [Invoice_Total__c]                                  FLOAT (53)      NULL,
    [Recommended_Service__c]                            NVARCHAR (MAX)  NULL,
    [Make__c]                                           NVARCHAR (1300) NULL,
    [TFS_Service_Date__c]                               DATETIME        NULL,
    [NTEThreshold__c]                                   FLOAT (53)      NULL,
    [MHE_Fault_Codes_Tier_I__c]                         NVARCHAR (255)  NULL,
    [MHE_Fault_Codes_Tier_II__c]                        NVARCHAR (255)  NULL,
    [Model1__c]                                         NVARCHAR (1300) NULL,
    [Broad__c]                                          NVARCHAR (1300) NULL,
    [Group__c]                                          NVARCHAR (1300) NULL,
    [Type__c]                                           NVARCHAR (1300) NULL,
    [Broad_Location__c]                                 NVARCHAR (255)  NULL,
    [Broad_Reportable__c]                               NVARCHAR (1300) NULL,
    [Group_Location__c]                                 NVARCHAR (255)  NULL,
    [Type_Location__c]                                  NVARCHAR (255)  NULL,
    [Group_Reportable__c]                               NVARCHAR (1300) NULL,
    [Type_Reportable__c]                                NVARCHAR (1300) NULL,
    [Technician_Arrived__c]                             TINYINT         NULL,
    [Dispatch_Status1__c]                               NVARCHAR (1300) NULL,
    [Work_Order_Rollup__c]                              TINYINT         NULL,
    [Labor_Rate_Standard__c]                            FLOAT (53)      NULL,
    [Meter_Reading__c]                                  FLOAT (53)      NULL,
    [Business_Unit__c]                                  NVARCHAR (255)  NULL,
    [Work_Detail_Count__c]                              FLOAT (53)      NULL,
    [Total_Sales_Tax__c]                                FLOAT (53)      NULL,
    [Field_Office__c]                                   NVARCHAR (18)   NULL,
    [Vendor_Work_Details_Open__c]                       FLOAT (53)      NULL,
    [Total_Cost__c]                                     FLOAT (53)      NULL,
    [Estimated_Work_Total__c]                           FLOAT (53)      NULL,
    [TFS_Invoice_Date__c]                               DATETIME        NULL,
    [TFS_Date_Entered__c]                               DATETIME        NULL,
    [TFS_Vendor_Invoice__c]                             NVARCHAR (18)   NULL,
    [TFS_Vendor_Work_Order__c]                          NVARCHAR (18)   NULL,
    [Work_Order_Total__c]                               FLOAT (53)      NULL,
    [Sales_Tax_Total__c]                                FLOAT (53)      NULL,
    [Super_Center__c]                                   NVARCHAR (1300) NULL,
    [Labor_PM_Rate_DDM__c]                              FLOAT (53)      NULL,
    [Labor_PM_Rate_MHE__c]                              FLOAT (53)      NULL,
    [Labor_Standard_DDM__c]                             FLOAT (53)      NULL,
    [Labor_Standard_MHE__c]                             FLOAT (53)      NULL,
    [Labor_2_Man_DDM__c]                                FLOAT (53)      NULL,
    [Labor_2_Man_MHE__c]                                FLOAT (53)      NULL,
    [Labor_OTDDM_DDM__c]                                FLOAT (53)      NULL,
    [Labor_OTMHE_MHE__c]                                FLOAT (53)      NULL,
    [Labor_DTDDM_DDM__c]                                FLOAT (53)      NULL,
    [Labor_DTMHE_MHE__c]                                FLOAT (53)      NULL,
    [Job_Info_c__c]                                     NVARCHAR (25)   NULL,
    [Dock_Fault__c]                                     NVARCHAR (MAX)  NULL,
    [Door_Fault_I__c]                                   NVARCHAR (MAX)  NULL,
    [Group_Miner__c]                                    NVARCHAR (255)  NULL,
    [Fault_Validation_c__c]                             DATETIME        NULL,
    [Vendor_Name_c__c]                                  NVARCHAR (18)   NULL,
    [Meter_Reading_Required__c]                         TINYINT         NULL,
    [Draw_Date_c__c]                                    DATETIME        NULL,
    [Contract_Install_c__c]                             DATETIME        NULL,
    [Door_Fault_II__c]                                  NVARCHAR (MAX)  NULL,
    [Spec_Waste_Fault__c]                               NVARCHAR (MAX)  NULL,
    [Dock_Solution_I__c]                                NVARCHAR (MAX)  NULL,
    [Invoice_Denied_c__c]                               TINYINT         NULL,
    [MHE_Resolution_Code__c]                            NVARCHAR (255)  NULL,
    [Dock_Solution_II__c]                               NVARCHAR (MAX)  NULL,
    [Door_Solution_I__c]                                NVARCHAR (MAX)  NULL,
    [Door_Solution_II__c]                               NVARCHAR (MAX)  NULL,
    [Door_Solution_III__c]                              NVARCHAR (MAX)  NULL,
    [Spec_Wast_Solution__c]                             NVARCHAR (MAX)  NULL,
    [Email_Service_Report__c]                           NVARCHAR (80)   NULL,
    [Send_Service_Report_to_Customer__c]                TINYINT         NULL,
    [Estimate_Needed_c__c]                              TINYINT         NULL,
    [Contract_Amount__c]                                FLOAT (53)      NULL,
    [Change_Order_Amt__c]                               FLOAT (53)      NULL,
    [Notes__c]                                          NVARCHAR (MAX)  NULL,
    [Retainage_c__c]                                    TINYINT         NULL,
    [Retainage_Percentage_c__c]                         FLOAT (53)      NULL,
    [Parent_Work_Order_c__c]                            NVARCHAR (18)   NULL,
    [Work_Order_Margin__c]                              FLOAT (53)      NULL,
    [Change_Order_Amt_2__c]                             FLOAT (53)      NULL,
    [Change_Order_Amt_3__c]                             FLOAT (53)      NULL,
    [Change_Order_Amt_4__c]                             FLOAT (53)      NULL,
    [Signature_Name__c]                                 NVARCHAR (100)  NULL,
    [Company_code__c]                                   NVARCHAR (1300) NULL,
    [Parts_Needed_c__c]                                 TINYINT         NULL,
    [Estimate_Parts_Notes_c__c]                         NVARCHAR (MAX)  NULL,
    [Work_Order_Margin_c2__c]                           FLOAT (53)      NULL,
    [Contract_Total_c__c]                               FLOAT (53)      NULL,
    [Work_Finished_c__c]                                TINYINT         NULL,
    [Installed_Product_Name_c__c]                       NVARCHAR (150)  NULL,
    [Broad_IP_wo__c]                                    NVARCHAR (1300) NULL,
    [Group_IP_wo__c]                                    NVARCHAR (1300) NULL,
    [Service_Date_I__c]                                 NVARCHAR (8)    NULL,
    [Last_Work_Performed__c]                            NVARCHAR (MAX)  NULL,
    [Job_History__c]                                    NVARCHAR (MAX)  NULL,
    [SVMXC__Finished_Onsite_Date_Time__c]               DATETIME        NULL,
    [SVMXC__Scheduling_Change_Token__c]                 NVARCHAR (255)  NULL,
    [Salesperson_c__c]                                  NVARCHAR (18)   NULL,
    [Invoice_Date_I__c]                                 NVARCHAR (8)    NULL,
    [Locked__c]                                         TINYINT         NULL,
    [Last_Meter_Reading__c]                             FLOAT (53)      NULL,
    [Customer_Queue__c]                                 NVARCHAR (100)  NULL,
    [Salesperson_wo__c]                                 NVARCHAR (18)   NULL,
    [Parts_Cost__c]                                     FLOAT (53)      NULL,
    [Total_Work_Order_w_Tax__c]                         FLOAT (53)      NULL,
    [Rejected_Invoice_Amount__c]                        FLOAT (53)      NULL,
    [Labor_Cost__c]                                     FLOAT (53)      NULL,
    [Work_Performed_tfs__c]                             NVARCHAR (MAX)  NULL,
    [Invoice_Post_to_Period__c]                         NVARCHAR (7)    NULL,
    [Doc_Number__c]                                     NVARCHAR (1300) NULL,
    [Invoice_Document__c]                               NVARCHAR (25)   NULL,
    [Make_IP__c]                                        NVARCHAR (MAX)  NULL,
    [Model_IP__c]                                       NVARCHAR (MAX)  NULL,
    [Total_Invoiced__c]                                 FLOAT (53)      NULL,
    [Vendor_Invoice_Total__c]                           FLOAT (53)      NULL,
    [SL_Invoice_Date__c]                                DATETIME        NULL,
    [Salesperson_2nd_WO__c]                             NVARCHAR (18)   NULL,
    [Location_Name__c]                                  NVARCHAR (100)  NULL,
    [Tax_Exempt_Project__c]                             TINYINT         NULL,
    [Equip_Sales_Info__c]                               NVARCHAR (1300) NULL,
    [Last_Meter_Reading_Date__c]                        DATETIME        NULL,
    [Last_PM_Date__c]                                   DATETIME        NULL,
    [Last_PM_Meter_Reading__c]                          FLOAT (53)      NULL,
    [PM_Date_Diff__c]                                   FLOAT (53)      NULL,
    [PM_Meter_Diff__c]                                  FLOAT (53)      NULL,
    [Certificate__c]                                    NVARCHAR (25)   NULL,
    [Rejection_Override__c]                             TINYINT         NULL,
    [Permanent_Rejection__c]                            TINYINT         NULL,
    [IP_Warranty_End_Date__c]                           DATETIME        NULL,
    [Days_Left_Under_Warranty__c]                       FLOAT (53)      NULL,
    [Meter_Left_Under_Warranty__c]                      FLOAT (53)      NULL,
    [Approval_Requested__c]                             DATETIME        NULL,
    [Approval_Status__c]                                NVARCHAR (255)  NULL,
    [Assigned_Approver__c]                              NVARCHAR (100)  NULL,
    [Static_Doc_Number__c]                              NVARCHAR (25)   NULL,
    [Invoice_Received_Date_I__c]                        NVARCHAR (8)    NULL,
    [Invoice_Received_Date__c]                          DATETIME        NULL,
    [Asset_Mgmt_Fees__c]                                FLOAT (53)      NULL,
    [TFS_AMF_WO__c]                                     TINYINT         NULL,
    [Tax_Cost__c]                                       FLOAT (53)      NULL,
    [IP_Department__c]                                  NVARCHAR (100)  NULL,
    [Conga_Vendor_Name__c]                              NVARCHAR (1300) NULL,
    [Draw_Date_New__c]                                  NVARCHAR (4)    NULL,
    [Doc_Number_Date__c]                                DATETIME        NULL,
    [Service_Report_Finalized__c]                       TINYINT         NULL,
    [Service_Report_Received__c]                        TINYINT         NULL,
    [SuperCenterName__c]                                NVARCHAR (1300) NULL,
    [Super_Center2__c]                                  NVARCHAR (18)   NULL,
    [First_Time_Dispatched__c]                          DATETIME        NULL,
    [Response_Time__c]                                  FLOAT (53)      NULL,
    [Date_Time_Invoice_Completed__c]                    DATETIME        NULL,
    [Date_Time_Job_Work_Complete__c]                    DATETIME        NULL,
    [Time_to_Job_Work_Complete__c]                      FLOAT (53)      NULL,
    [Time_to_Invoice_Completed__c]                      FLOAT (53)      NULL,
    [Segment__c]                                        NVARCHAR (18)   NULL,
    [Canadian_QST_PST__c]                               FLOAT (53)      NULL,
    [Canadian_GST_HST_TPS__c]                           FLOAT (53)      NULL,
    [Canadian_QST_PST_TVQ__c]                           FLOAT (53)      NULL,
    [Invoiced_Lines__c]                                 NVARCHAR (1300) NULL,
    [Time_to_Book_Revenue__c]                           FLOAT (53)      NULL,
    [Edit_Quoted_Values__c]                             TINYINT         NULL,
    [Non_Billable_Item_Approval_Status__c]              NVARCHAR (255)  NULL,
    [Quoted_Total__c]                                   FLOAT (53)      NULL,
    [Work_Order_Type__c]                                NVARCHAR (255)  NULL,
    [Non_Billable_Line_Items__c]                        FLOAT (53)      NULL,
    [Not_Billable_from_iPad__c]                         FLOAT (53)      NULL,
    [Service_Notes__c]                                  NVARCHAR (MAX)  NULL,
    [SVMXC__SM_LJS_Minimum_Schedule_Duration__c]        FLOAT (53)      NULL,
    CONSTRAINT [PK_SVMXC__Service_Order__c] PRIMARY KEY CLUSTERED ([Id] ASC)
);

