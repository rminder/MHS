﻿CREATE TABLE [SF].[SVMXC__Service_Group_Members__c] (
    [Id]                                                                              NVARCHAR (18)  NOT NULL,
    [IsDeleted]                                                                       TINYINT        NULL,
    [Name]                                                                            NVARCHAR (80)  NULL,
    [CreatedDate]                                                                     DATETIME       NULL,
    [CreatedById]                                                                     NVARCHAR (18)  NULL,
    [LastModifiedDate]                                                                DATETIME       NULL,
    [LastModifiedById]                                                                NVARCHAR (18)  NULL,
    [SystemModstamp]                                                                  DATETIME       NULL,
    [LastActivityDate]                                                                DATETIME       NULL,
    [LastViewedDate]                                                                  DATETIME       NULL,
    [LastReferencedDate]                                                              DATETIME       NULL,
    [SVMXC__Service_Group__c]                                                         NVARCHAR (18)  NULL,
    [SVMXC__Active__c]                                                                TINYINT        NULL,
    [SVMXC__Average_Drive_Time__c]                                                    FLOAT (53)     NULL,
    [SVMXC__Average_Speed__c]                                                         FLOAT (53)     NULL,
    [SVMXC__Break_Duration__c]                                                        FLOAT (53)     NULL,
    [SVMXC__Break_Hours__c]                                                           NVARCHAR (18)  NULL,
    [SVMXC__Break_Type__c]                                                            NVARCHAR (255) NULL,
    [SVMXC__City__c]                                                                  NVARCHAR (100) NULL,
    [SVMXC__Country__c]                                                               NVARCHAR (255) NULL,
    [SVMXC__Email__c]                                                                 NVARCHAR (80)  NULL,
    [SVMXC__Enable_Scheduling__c]                                                     TINYINT        NULL,
    [SVMXC__Fixed_Cost__c]                                                            FLOAT (53)     NULL,
    [SVMXC__Inventory_Location__c]                                                    NVARCHAR (18)  NULL,
    [SVMXC__Latitude__c]                                                              FLOAT (53)     NULL,
    [SVMXC__Longitude__c]                                                             FLOAT (53)     NULL,
    [SVMXC__Max_Daily_Hours__c]                                                       FLOAT (53)     NULL,
    [SVMXC__Max_Distance__c]                                                          FLOAT (53)     NULL,
    [SVMXC__Max_Hours__c]                                                             FLOAT (53)     NULL,
    [SVMXC__Member_information__c]                                                    NVARCHAR (MAX) NULL,
    [SVMXC__Overtime_Hours__c]                                                        NVARCHAR (18)  NULL,
    [SVMXC__Per_Hour_Cost__c]                                                         FLOAT (53)     NULL,
    [SVMXC__Per_Mile_Cost__c]                                                         FLOAT (53)     NULL,
    [SVMXC__Phone__c]                                                                 NVARCHAR (40)  NULL,
    [SVMXC__Role__c]                                                                  NVARCHAR (255) NULL,
    [SVMXC__Salesforce_User__c]                                                       NVARCHAR (18)  NULL,
    [SVMXC__Select__c]                                                                TINYINT        NULL,
    [SVMXC__Service_Territory__c]                                                     NVARCHAR (18)  NULL,
    [SVMXC__State__c]                                                                 NVARCHAR (100) NULL,
    [SVMXC__Street__c]                                                                NVARCHAR (255) NULL,
    [SVMXC__Third_Party__c]                                                           TINYINT        NULL,
    [SVMXC__Working_Hours__c]                                                         NVARCHAR (18)  NULL,
    [SVMXC__Zip__c]                                                                   NVARCHAR (100) NULL,
    [SVMXC__Optimizer_External_ID__c]                                                 NVARCHAR (255) NULL,
    [SVMXC__Territory__c_SVMXC__Service_Territory__r_SVMXC__Optimizer_External_ID__c] NVARCHAR (255) NULL,
    [User_SVMXC__Salesforce_User__r_UNITY_Agent_ID__c]                                NVARCHAR (18)  NULL,
    [SVMXC_Manage_Inventory__c]                                                       TINYINT        NULL,
    [SVMXC__Latitude_Home__c]                                                         FLOAT (53)     NULL,
    [SVMXC__Longitude_Home__c]                                                        FLOAT (53)     NULL,
    CONSTRAINT [PK_SVMXC__Service_Group_Members__c] PRIMARY KEY CLUSTERED ([Id] ASC)
);

