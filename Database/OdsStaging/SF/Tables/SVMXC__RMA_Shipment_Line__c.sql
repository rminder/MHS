﻿CREATE TABLE [SF].[SVMXC__RMA_Shipment_Line__c] (
    [Id]                                    NVARCHAR (18)   NOT NULL,
    [IsDeleted]                             TINYINT         NULL,
    [Name]                                  NVARCHAR (80)   NULL,
    [RecordTypeId]                          NVARCHAR (18)   NULL,
    [CreatedDate]                           DATETIME        NULL,
    [CreatedById]                           NVARCHAR (18)   NULL,
    [LastModifiedDate]                      DATETIME        NULL,
    [LastModifiedById]                      NVARCHAR (18)   NULL,
    [SystemModstamp]                        DATETIME        NULL,
    [SVMXC__RMA_Shipment_Order__c]          NVARCHAR (18)   NULL,
    [SVMXC__Actual_Quantity2__c]            FLOAT (53)      NULL,
    [SVMXC__Actual_Receipt_Date__c]         DATETIME        NULL,
    [SVMXC__Actual_Ship_Date__c]            DATETIME        NULL,
    [SVMXC__Canceled_By__c]                 NVARCHAR (18)   NULL,
    [SVMXC__Canceled_On__c]                 DATETIME        NULL,
    [SVMXC__Closed_By__c]                   NVARCHAR (18)   NULL,
    [SVMXC__Closed_On__c]                   DATETIME        NULL,
    [SVMXC__Discount_Percentage__c]         FLOAT (53)      NULL,
    [SVMXC__Disposition_Instructions__c]    NVARCHAR (MAX)  NULL,
    [SVMXC__Disposition__c]                 NVARCHAR (255)  NULL,
    [SVMXC__Expected_Condition__c]          NVARCHAR (255)  NULL,
    [SVMXC__Expected_Quantity2__c]          FLOAT (53)      NULL,
    [SVMXC__Expected_Receipt_Date__c]       DATETIME        NULL,
    [SVMXC__Expected_Ship_Date__c]          DATETIME        NULL,
    [SVMXC__Line_Price2__c]                 FLOAT (53)      NULL,
    [SVMXC__Line_Status__c]                 NVARCHAR (255)  NULL,
    [SVMXC__Line_Type__c]                   NVARCHAR (255)  NULL,
    [SVMXC__Packing_Instructions__c]        NVARCHAR (MAX)  NULL,
    [SVMXC__Parts_Request_Line__c]          NVARCHAR (18)   NULL,
    [SVMXC__Posted_To_Inventory__c]         TINYINT         NULL,
    [SVMXC__Product__c]                     NVARCHAR (18)   NULL,
    [SVMXC__Returned_Condition__c]          NVARCHAR (255)  NULL,
    [SVMXC__Sales_Order_Number__c]          NVARCHAR (100)  NULL,
    [SVMXC__Select__c]                      TINYINT         NULL,
    [SVMXC__Serial_Number__c]               NVARCHAR (18)   NULL,
    [SVMXC__Service_Engineer__c]            NVARCHAR (18)   NULL,
    [SVMXC__Service_Order_Line__c]          NVARCHAR (18)   NULL,
    [SVMXC__Ship_Location__c]               NVARCHAR (18)   NULL,
    [SVMXC__Total_Line_Price2__c]           FLOAT (53)      NULL,
    [SVMXC__Use_Price_From_Pricebook__c]    TINYINT         NULL,
    [SVMXC__Warehouse__c]                   NVARCHAR (100)  NULL,
    [SVMXC__Case_Line__c]                   NVARCHAR (18)   NULL,
    [SVMXC__Delivered_By__c]                NVARCHAR (18)   NULL,
    [SVMXC__Delivered_On__c]                DATETIME        NULL,
    [SVMXC__Delivered__c]                   TINYINT         NULL,
    [SVMXC__Delivery_Location__c]           NVARCHAR (18)   NULL,
    [SVMXC__Master_Order_Line__c]           NVARCHAR (18)   NULL,
    [SVMXC__Picked_By__c]                   NVARCHAR (18)   NULL,
    [SVMXC__Picked_On__c]                   DATETIME        NULL,
    [SVMXC__Picked_Qty__c]                  FLOAT (53)      NULL,
    [SVMXC__Picked__c]                      TINYINT         NULL,
    [SVMXC__Received_By__c]                 NVARCHAR (18)   NULL,
    [SVMXC__Received_On__c]                 DATETIME        NULL,
    [SVMXC__Received__c]                    TINYINT         NULL,
    [SVMXC__Reconciliation_Action__c]       NVARCHAR (255)  NULL,
    [SVMXC__Route_Card__c]                  NVARCHAR (18)   NULL,
    [SVMXC__Route_Stop__c]                  NVARCHAR (18)   NULL,
    [SVMXC__Serial_Number_List__c]          NVARCHAR (MAX)  NULL,
    [SVMXC__Service_Order__c]               NVARCHAR (18)   NULL,
    [SVMXC__Shipped_By__c]                  NVARCHAR (18)   NULL,
    [SVMXC__Shipped_On__c]                  DATETIME        NULL,
    [SVMXC__Shipped__c]                     TINYINT         NULL,
    [SVMXC__Work_Order_Created__c]          TINYINT         NULL,
    [SVMXC__Entitlement_Status__c]          NVARCHAR (255)  NULL,
    [SVMXC__Fulfillment_Qty__c]             FLOAT (53)      NULL,
    [SVMXC__Service_Contract_End_Date__c]   DATETIME        NULL,
    [SVMXC__Service_Contract_Start_Date__c] DATETIME        NULL,
    [SVMXC__Warranty_End_Date__c]           DATETIME        NULL,
    [SVMXC__Warranty_Start_Date__c]         DATETIME        NULL,
    [SVMXC__Entitled_Exchange_Type__c]      NVARCHAR (255)  NULL,
    [Standard_Cost__c]                      FLOAT (53)      NULL,
    [MH_Total_Vendor_Line_Price__c]         FLOAT (53)      NULL,
    [Product_Name__c]                       NVARCHAR (1300) NULL,
    [Vendor_Price__c]                       FLOAT (53)      NULL,
    [Total_Standard_Line_Price__c]          FLOAT (53)      NULL,
    [Part_Number__c]                        NVARCHAR (1300) NULL,
    [Ship_Via_c__c]                         NVARCHAR (255)  NULL,
    [Cross_Reference_Desc__c]               NVARCHAR (1300) NULL,
    [Cross_Reference_Part__c]               NVARCHAR (1300) NULL,
    [Product_Cross_Reference__c]            NVARCHAR (18)   NULL,
    [Order_Type__c]                         NVARCHAR (1300) NULL,
    [To_Location_Supercenter__c]            NVARCHAR (1300) NULL,
    [To_Location_Segment__c]                NVARCHAR (1300) NULL,
    [SL_Vendor_ID__c]                       NVARCHAR (1300) NULL,
    [CompanyID__c]                          NVARCHAR (1300) NULL,
    [Part_Order_Name__c]                    NVARCHAR (1300) NULL,
    [Product_Code_PD__c]                    NVARCHAR (100)  NULL,
    [SVMXC__Transaction_Results__c]         NVARCHAR (MAX)  NULL,
    [Description__c]                        NVARCHAR (1000) NULL,
    CONSTRAINT [PK_SVMXC__RMA_Shipment_Line__c] PRIMARY KEY CLUSTERED ([Id] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_SVMXC__RMA_Shipment_Line__c_Id]
    ON [SF].[SVMXC__RMA_Shipment_Line__c]([Id] ASC);

