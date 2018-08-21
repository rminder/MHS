CREATE VIEW SF.vwMH_Invoice_Details__c
AS
SELECT
	[Id]
   ,[IsDeleted]
   ,[Name]
   ,[RecordTypeId]
   ,[CreatedDate]
   ,[CreatedById]
   ,[LastModifiedDate]
   ,[LastModifiedById]
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,[LastReferencedDate]
   ,ISNULL([Work_Order__c], '')									 AS WorkOrder
   ,ISNULL([Vendor__c], '')										 AS Vendor
   ,ISNULL([Line_Type__c], '')									 AS LineType
   ,ISNULL([Part__c], '')										 AS Part
   ,[Line_Price_per_Unit__c]									 AS LinePricePerUnit
   ,[Line_Qty__c]												 AS LineQuantity
   ,[Sales_Tax__c]												 AS SalesTax
   ,ISNULL([Invoice__c], '')									 AS Invoice
   ,[Add_to_Invoice__c]											 AS AddToInvoice
   ,[Date_Invoiced__c]											 AS DateInvoiced
   ,ISNULL([Activity_Type__c], '')								 AS ActivityType
   ,[Total_Line_Price__c]										 AS TotalLinePrice
   ,ISNULL([Work_Detail__c], '')								 AS WorkDetail
   ,ISNULL([T_Line_Price_per_Unit__c], '')						 AS TLinePricePerUnit
   ,ISNULL([Invoice_Status__c], '')								 AS InvoiceStatus
   ,ISNULL([Work_Description_idc__c], '')						 AS WorkDescription
   ,ISNULL([Unit_of_Measure_idc__c], '')						 AS UnitOfMeasure
   ,[Hide_Line_c__c]											 AS HideLine
   ,[Total_Line_Price_formula__c]								 AS TotalLinePriceFormula
   ,[Sort_Order__c]												 AS SortOrder
   ,[Detail_Line_Cost__c]										 AS DetailLineCost
   ,ISNULL([Account_Vendor__r_SL_Vendor_ID__c], '')				 AS AccountVendorSlVendorId
   ,[Interface_Processed__c]									 AS InterfaceProcessed
   ,ISNULL([Account_Vendor__r_MH_SL_CustID__c], '')				 AS AccountVendorSlCustomerId
   ,ISNULL([Account_Vendor__r_UNITY_Account_External_Id__c], '') AS AccountVendorUnityAccountExternalId
   ,ISNULL([Product2_Part__r_UNITY_Product_External_Id__c], '')	 AS Product2PartUnityProductExternalId
   ,[LastModifiedDate]											 AS LastUpdate
   ,GETUTCDATE()												 AS ImportDate
FROM [SF].[MH_Invoice_Details__c];