﻿CREATE TABLE [SF].[SVMXC__RMA_Shipment_Order__c] (
    [Id]                                 NVARCHAR (18)   NOT NULL,
    [OwnerId]                            NVARCHAR (18)   NULL,
    [IsDeleted]                          TINYINT         NULL,
    [Name]                               NVARCHAR (80)   NULL,
    [RecordTypeId]                       NVARCHAR (18)   NULL,
    [CreatedDate]                        DATETIME        NULL,
    [CreatedById]                        NVARCHAR (18)   NULL,
    [LastModifiedDate]                   DATETIME        NULL,
    [LastModifiedById]                   NVARCHAR (18)   NULL,
    [SystemModstamp]                     DATETIME        NULL,
    [LastActivityDate]                   DATETIME        NULL,
    [LastViewedDate]                     DATETIME        NULL,
    [LastReferencedDate]                 DATETIME        NULL,
    [SVMXC__Bill_To__c]                  NVARCHAR (255)  NULL,
    [SVMXC__Billing_Type__c]             NVARCHAR (255)  NULL,
    [SVMXC__Canceled_By__c]              NVARCHAR (18)   NULL,
    [SVMXC__Canceled_On__c]              DATETIME        NULL,
    [SVMXC__Case__c]                     NVARCHAR (18)   NULL,
    [SVMXC__Closed_By__c]                NVARCHAR (18)   NULL,
    [SVMXC__Closed_On__c]                DATETIME        NULL,
    [SVMXC__Company__c]                  NVARCHAR (18)   NULL,
    [SVMXC__Contact__c]                  NVARCHAR (18)   NULL,
    [SVMXC__Delivery_Option__c]          NVARCHAR (255)  NULL,
    [SVMXC__Destination_City__c]         NVARCHAR (100)  NULL,
    [SVMXC__Destination_Country__c]      NVARCHAR (255)  NULL,
    [SVMXC__Destination_Location__c]     NVARCHAR (18)   NULL,
    [SVMXC__Destination_State__c]        NVARCHAR (100)  NULL,
    [SVMXC__Destination_Street__c]       NVARCHAR (255)  NULL,
    [SVMXC__Destination_Zip__c]          NVARCHAR (100)  NULL,
    [SVMXC__EndpointURL__c]              NVARCHAR (1300) NULL,
    [SVMXC__Expected_Delivery_Date__c]   DATETIME        NULL,
    [SVMXC__Expected_Receive_Date__c]    DATETIME        NULL,
    [SVMXC__IsPartnerRecord__c]          TINYINT         NULL,
    [SVMXC__IsPartner__c]                NVARCHAR (1300) NULL,
    [SVMXC__Order_Status__c]             NVARCHAR (255)  NULL,
    [SVMXC__Partner_Account__c]          NVARCHAR (18)   NULL,
    [SVMXC__Partner_Contact__c]          NVARCHAR (18)   NULL,
    [SVMXC__Parts_Request__c]            NVARCHAR (18)   NULL,
    [SVMXC__Priority__c]                 NVARCHAR (255)  NULL,
    [SVMXC__RMA_Age_Bucket__c]           NVARCHAR (1300) NULL,
    [SVMXC__Receiving_Courier__c]        NVARCHAR (18)   NULL,
    [SVMXC__SESSION_ID__c]               NVARCHAR (1300) NULL,
    [SVMXC__Sales_Order_Number__c]       NVARCHAR (100)  NULL,
    [SVMXC__Service_Engineer__c]         NVARCHAR (18)   NULL,
    [SVMXC__Service_Order__c]            NVARCHAR (18)   NULL,
    [SVMXC__Shipment_Age_Bucket__c]      NVARCHAR (1300) NULL,
    [SVMXC__Shipment_Reference__c]       NVARCHAR (18)   NULL,
    [SVMXC__Shipping_Courier__c]         NVARCHAR (18)   NULL,
    [SVMXC__Shipping_Receiving_Notes__c] NVARCHAR (MAX)  NULL,
    [SVMXC__Shipping_Terms__c]           NVARCHAR (255)  NULL,
    [SVMXC__Source_City__c]              NVARCHAR (100)  NULL,
    [SVMXC__Source_Country__c]           NVARCHAR (255)  NULL,
    [SVMXC__Source_Location__c]          NVARCHAR (18)   NULL,
    [SVMXC__Source_State__c]             NVARCHAR (100)  NULL,
    [SVMXC__Source_Street__c]            NVARCHAR (255)  NULL,
    [SVMXC__Source_Zip__c]               NVARCHAR (100)  NULL,
    [SVMXC__Tracking_Number__c]          NVARCHAR (100)  NULL,
    [SVMXC__Warehouse__c]                NVARCHAR (100)  NULL,
    [SVMXC__Total_Price2__c]             FLOAT (53)      NULL,
    [SVMXC__Address_Type__c]             NVARCHAR (255)  NULL,
    [SVMXC__Order_Type__c]               NVARCHAR (255)  NULL,
    [SVMXC__Fulfillment_Type__c]         NVARCHAR (255)  NULL,
    [SVMXC__Master_Order__c]             NVARCHAR (18)   NULL,
    [SVMXC__On_Hold__c]                  TINYINT         NULL,
    [SVMXC__RMA_Type__c]                 NVARCHAR (255)  NULL,
    [SVMXC__Supplier__c]                 NVARCHAR (18)   NULL,
    [SVMXC__Number_of_units_returned__c] FLOAT (53)      NULL,
    [Shipping_Provider__c]               NVARCHAR (30)   NULL,
    [Ship_Via__c]                        NVARCHAR (255)  NULL,
    [Terms__c]                           NVARCHAR (255)  NULL,
    [Buyer__c]                           NVARCHAR (18)   NULL,
    [Internal_Bill_To__c]                NVARCHAR (18)   NULL,
    [Purchase_Order_No__c]               NVARCHAR (12)   NULL,
    [Vendor__c]                          NVARCHAR (18)   NULL,
    [Vendor_Contact__c]                  NVARCHAR (18)   NULL,
    [Open_Lines__c]                      FLOAT (53)      NULL,
    [Vendor_ID__c]                       NVARCHAR (10)   NULL,
    [Total_Price__c]                     FLOAT (53)      NULL,
    [MH_Total_Price__c]                  FLOAT (53)      NULL,
    [Total_Vendor_Price__c]              FLOAT (53)      NULL,
    [Total_Standard_Line_Price__c]       FLOAT (53)      NULL,
    [Order_Date1__c]                     DATETIME        NULL,
    [Total_lines__c]                     FLOAT (53)      NULL,
    [Reference_Notes__c]                 NVARCHAR (30)   NULL,
    [Location_Stocking__c]               TINYINT         NULL,
    [Company_Legal_Name__c]              NVARCHAR (100)  NULL,
    [Ship_To_Name__c]                    NVARCHAR (100)  NULL,
    [Change_Ship_To_Info__c]             TINYINT         NULL,
    [PO_Vendor_Phone__c]                 NVARCHAR (40)   NULL,
    [Paid_with_Credit_Card__c]           TINYINT         NULL,
    [Payment_Check_Date__c]              DATETIME        NULL,
    [Payment_Check_Number__c]            NVARCHAR (50)   NULL,
    [Payment_Credit_Card__c]             NVARCHAR (255)  NULL,
    [Payment_Date__c]                    DATETIME        NULL,
    [Vendor_Invoice_Date__c]             DATETIME        NULL,
    [Vendor_Invoice_Number__c]           NVARCHAR (50)   NULL,
    CONSTRAINT [PK_SVMXC__RMA_Shipment_Order__c] PRIMARY KEY CLUSTERED ([Id] ASC)
);
