﻿CREATE TABLE [SF].[Product2] (
    [Id]                                   NVARCHAR (18)   NULL,
    [Name]                                 NVARCHAR (255)  NULL,
    [ProductCode]                          NVARCHAR (255)  NULL,
    [Description]                          NVARCHAR (MAX)  NULL,
    [IsActive]                             TINYINT         NULL,
    [CreatedDate]                          DATETIME        NULL,
    [CreatedById]                          NVARCHAR (18)   NULL,
    [LastModifiedDate]                     DATETIME        NULL,
    [LastModifiedById]                     NVARCHAR (18)   NULL,
    [SystemModstamp]                       DATETIME        NULL,
    [Family]                               NVARCHAR (40)   NULL,
    [RecordTypeId]                         NVARCHAR (18)   NULL,
    [ExternalDataSourceId]                 NVARCHAR (18)   NULL,
    [ExternalId]                           NVARCHAR (255)  NULL,
    [DisplayUrl]                           NVARCHAR (1000) NULL,
    [QuantityUnitOfMeasure]                NVARCHAR (40)   NULL,
    [IsDeleted]                            TINYINT         NULL,
    [LastViewedDate]                       DATETIME        NULL,
    [LastReferencedDate]                   DATETIME        NULL,
    [SVMXC__Enable_Serialized_Tracking__c] TINYINT         NULL,
    [SVMXC__Inherit_Parent_Warranty__c]    TINYINT         NULL,
    [SVMXC__Product_Cost__c]               FLOAT (53)      NULL,
    [SVMXC__Product_Line__c]               NVARCHAR (255)  NULL,
    [SVMXC__Select__c]                     TINYINT         NULL,
    [SVMXC__Stockable__c]                  TINYINT         NULL,
    [SVMXC__Tracking__c]                   NVARCHAR (255)  NULL,
    [SVMXC__Unit_Of_Measure__c]            NVARCHAR (255)  NULL,
    [SVMXC__Replacement_Available__c]      TINYINT         NULL,
    [Capacity__c]                          NVARCHAR (255)  NULL,
    [High_Usage_Product__c]                TINYINT         NULL,
    [Broad__c]                             NVARCHAR (255)  NULL,
    [Group__c]                             NVARCHAR (255)  NULL,
    [Type__c]                              NVARCHAR (255)  NULL,
    [Part_Serial_Number__c]                NVARCHAR (18)   NULL,
    [Model__c]                             NVARCHAR (50)   NULL,
    [Make1__c]                             NVARCHAR (255)  NULL,
    [UOM__c]                               NVARCHAR (255)  NULL,
    [TEST_DATA_DO_NOT_USE__c]              TINYINT         NULL,
    [Product_Id__c]                        NVARCHAR (1300) NULL,
    [UNITY_Product_External_Id__c]         NVARCHAR (80)   NULL,
    [SSVY_Optimal_Cost__c]                 FLOAT (53)      NULL,
    [UNITY_Is_Menu_Pricing__c]             TINYINT         NULL,
    [UNITY_Asset_Type__c]                  NVARCHAR (255)  NULL,
    [UNITY_Bumper_Thickness__c]            NVARCHAR (50)   NULL,
    [SVMXC__Product_Type__c]               NVARCHAR (255)  NULL,
    [UNITY_Is_Stockable__c]                TINYINT         NULL
);
