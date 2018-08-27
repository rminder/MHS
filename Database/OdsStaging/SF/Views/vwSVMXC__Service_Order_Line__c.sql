﻿CREATE VIEW SF.vwSVMXC__Service_Order_Line__c
AS
SELECT
	[Id]												 AS [Id]
   ,[IsDeleted]											 AS [IsDeleted]
   ,ISNULL([Name], '')									 AS [Name]
   ,ISNULL([RecordTypeId], '')							 AS [RecordTypeId]
   ,[CreatedDate]										 AS [CreatedDate]
   ,ISNULL([CreatedById], '')							 AS [CreatedById]
   ,[LastModifiedDate]									 AS [LastModifiedDate]
   ,ISNULL([LastModifiedById], '')						 AS [LastModifiedById]
   ,[SystemModstamp]									 AS [SystemModstamp]
   ,[LastViewedDate]									 AS [LastViewedDate]
   ,[LastReferencedDate]								 AS [LastReferencedDate]
   ,ISNULL([SVMXC__Service_Order__c], '')				 AS [ServiceOrder]
   ,ISNULL([SVMXC__Activity_Type__c], '')				 AS [ActivityType]
   ,[SVMXC__Actual_Price2__c]							 AS [ActualPrice2]
   ,[SVMXC__Actual_Quantity2__c]						 AS [ActualQuantity2]
   ,ISNULL([SVMXC__Canceled_By__c], '')					 AS [CanceledBy]
   ,[SVMXC__Canceled_On__c]								 AS [CanceledOn]
   ,ISNULL([SVMXC__Closed_By__c], '')					 AS [ClosedBy]
   ,[SVMXC__Closed_On__c]								 AS [ClosedOn]
   ,ISNULL([SVMXC__Consumed_From_Location__c], '')		 AS [ConsumedFromLocation]
   ,ISNULL([SVMXC__Cost_Category__c], '')				 AS [CostCategory]
   ,[SVMXC__Date_Received__c]							 AS [DateReceived]
   ,[SVMXC__Date_Requested__c]							 AS [DateRequested]
   ,[SVMXC__Discount__c]								 AS [Discount]
   ,[SVMXC__End_Date_and_Time__c]						 AS [EndDateAndTime]
   ,[SVMXC__Estimated_Price2__c]						 AS [EstimatedPrice2]
   ,[SVMXC__Estimated_Quantity2__c]						 AS [EstimatedQuantity2]
   ,ISNULL([SVMXC__Expense_Type__c], '')				 AS [ExpenseType]
   ,ISNULL([SVMXC__From_Location__c], '')				 AS [FromLocation]
   ,ISNULL([SVMXC__Group_Member__c], '')				 AS [GroupMember]
   ,[SVMXC__Include_in_Quote__c]						 AS [IncludeInQuote]
   ,[SVMXC__Is_Billable__c]								 AS [IsBillable]
   ,ISNULL([SVMXC__Line_Status__c], '')					 AS [LineStatus]
   ,ISNULL([SVMXC__Line_Type__c], '')					 AS [LineType]
   ,ISNULL([SVMXC__Log_Against__c], '')					 AS [LogAgainst]
   ,[SVMXC__Posted_To_Inventory__c]						 AS [PostedToInventory]
   ,ISNULL([SVMXC__Product__c], '')						 AS [Product]
   ,[SVMXC__Quantity_Shipment_Initiated2__c]			 AS [QuantityShipmentInitiated2]
   ,[SVMXC__Quantity_Shipped2__c]						 AS [QuantityShipped2]
   ,ISNULL([SVMXC__Received_City__c], '')				 AS [ReceivedCity]
   ,ISNULL([SVMXC__Received_Country__c], '')			 AS [ReceivedCountry]
   ,ISNULL([SVMXC__Received_Location__c], '')			 AS [ReceivedLocation]
   ,[SVMXC__Received_Quantity2__c]						 AS [ReceivedQuantity2]
   ,ISNULL([SVMXC__Received_State__c], '')				 AS [ReceivedState]
   ,ISNULL([SVMXC__Received_Street__c], '')				 AS [ReceivedStreet]
   ,ISNULL([SVMXC__Received_Zip__c], '')				 AS [ReceivedZip]
   ,ISNULL([SVMXC__Reference_Information__c], '')		 AS [ReferenceInformation]
   ,ISNULL([SVMXC__Requested_City__c], '')				 AS [RequestedCity]
   ,ISNULL([SVMXC__Requested_Country__c], '')			 AS [RequestedCountry]
   ,ISNULL([SVMXC__Requested_Location__c], '')			 AS [RequestedLocation]
   ,[SVMXC__Requested_Quantity2__c]						 AS [RequestedQuantity2]
   ,ISNULL([SVMXC__Requested_State__c], '')				 AS [RequestedState]
   ,ISNULL([SVMXC__Requested_Street__c], '')			 AS [RequestedStreet]
   ,ISNULL([SVMXC__Requested_Zip__c], '')				 AS [RequestedZip]
   ,[SVMXC__Select__c]									 AS [Select]
   ,ISNULL([SVMXC__Serial_Number__c], '')				 AS [SerialNumber]
   ,ISNULL([SVMXC__Service_Group__c], '')				 AS [ServiceGroup]
   ,[SVMXC__Start_Date_and_Time__c]						 AS [StartDateAndTime]
   ,[SVMXC__Total_Estimated_Price__c]					 AS [TotalEstimatedPrice]
   ,[SVMXC__Total_Line_Price__c]						 AS [TotalLinePrice]
   ,[SVMXC__Use_Price_From_Pricebook__c]				 AS [UsePriceFromPricebook]
   ,ISNULL([SVMXC__Work_Description__c], '')			 AS [WorkDescription]
   ,[Estimate_or_Actual_Price__c]						 AS [EstimateOrActualPrice]
   ,ISNULL([SVMXC__Applied_Rate_Type__c], '')			 AS [AppliedRateType]
   ,[SVMXC__Covered__c]									 AS [Covered]
   ,[SVMXC__Billable_Line_Price__c]						 AS [BillableLinePrice]
   ,[SVMXC__Billable_Quantity__c]						 AS [BillableQuantity]
   ,ISNULL([SVMXC__Billing_Information__c], '')			 AS [BillingInformation]
   ,ISNULL([SVMXC__Product_Warranty__c], '')			 AS [ProductWarranty]
   ,ISNULL([SVMXC__Work_Detail__c], '')					 AS [WorkDetail]
   ,ISNULL([Vendor__c], '')								 AS [Vendor]
   ,ISNULL([Labor_Type__c], '')							 AS [LaborType]
   ,[Labor_Price_Per_Unit__c]							 AS [LaborPricePerUnit]
   ,[Add_to_Invoice__c]									 AS [AddtoInvoice]
   ,[Total_Line_PriceMH__c]								 AS [ExtendedPrice]
   ,ISNULL([Part_Serial_Number__c], '')					 AS [PartSerialNumber]
   ,[Labor_Time__c]										 AS [LaborTime]
   ,ISNULL([Vendor_Status__c], '')						 AS [VendorStatus]
   ,[Sales_Tax__c]										 AS [SalesTax]
   ,[Invoiced__c]										 AS [Invoiced]
   ,[Date_Invoiced__c]									 AS [DateInvoiced]
   ,[Work_Complete__c]									 AS [WorkComplete]
   ,[Deliver_Date__c]									 AS [DeliverDate]
   ,ISNULL([Invoice_Detail__c], '')						 AS [InvoiceDetail]
   ,[Total_Line_Price_w_Tax__c]							 AS [TotalLinePriceWithTax]
   ,ISNULL([Parts_Order_Line__c], '')					 AS [PartsOrderLine]
   ,[Vendor_Cost_Per_Unit__c]							 AS [VendorCostPerUnit]
   ,ISNULL([Vendor_Order__c], '')						 AS [VendorOrder]
   ,ISNULL([Segment__c], '')							 AS [Segment]
   ,ISNULL([Supercenter__c], '')						 AS [Supercenter]
   ,ISNULL([Day_Comments__c], '')						 AS [DayComments]
   ,ISNULL([Installed_Product_c__c], '')				 AS [InstalledProduct]
   ,ISNULL([Unit_of_Measure__c], '')					 AS [UnitofMeasure]
   ,[Total_Cost__c]										 AS [TotalCost]
   ,[Inv_Line_Qty_c__c]									 AS [InventoryLineQuantity]
   ,[Actual_Time_c__c]									 AS [ActualTime]
   ,ISNULL([TechID__c], '')								 AS [TechId]
   ,[Hide_Line__c]										 AS [HideLine]
   ,[Voucher__c]										 AS [Voucher]
   ,ISNULL([Technician_c__c], '')						 AS [Technician]
   ,[Sort_Order__c]										 AS [SortOrder]
   ,[Non_Inventory_Part__c]								 AS [NonInventoryPart]
   ,[WD_Created_Date__c]								 AS [WdCreatedDate]
   ,ISNULL([Service_Report_Line__c], '')				 AS [ServiceReportLine]
   ,[Integrated_IN06__c]								 AS [IntegratedIn06]
   ,[Consumed_Qty__c]									 AS [ConsumedQuantity]
   ,[Consumption_Qty__c]								 AS [ConsumptionQuantity]
   ,[Consumed_Parts__c]									 AS [ConsumedParts]
   ,[Used_Qty__c]										 AS [UsedQuantity]
   ,[Reconciled_Qty__c]									 AS [ReconciledQuantity]
   ,ISNULL([TechnicianWD_2__c], '')						 AS [TechnicianWd2]
   ,ISNULL([Conga_Vendor_Name__c], '')					 AS [CongaVendorName]
   ,ISNULL([SVMXC__Serial_Number_List__c], '')			 AS [SerialNumberList]
   ,ISNULL([SVMXC__Transaction_Results__c], '')			 AS [TransactionResults]
   ,ISNULL([Service_Report__c], '')						 AS [ServiceReport]
   ,[Interface_Processed__c]							 AS [InterfaceProcessed]
   ,ISNULL([Tax_Code__c], '')							 AS [TaxCode]
   ,[Line_from_iPad__c]									 AS [LineFromiPad]
   ,[Quoted_Margin_Percent__c]							 AS [QuotedMarginPercent]
   ,[Quoted_Margin__c]									 AS [QuotedMargin]
   ,[Quoted_Quantity__c]								 AS [QuotedQuantity]
   ,[Quoted_Unit_Cost__c]								 AS [QuotedUnitCost]
   ,[Quoted_Unit_Price__c]								 AS [QuotedUnitPrice]
   ,[Quoted__c]											 AS [Quoted]
   ,[Total_Quoted_Cost__c]								 AS [TotalQuotedCost]
   ,[Total_Quoted_Price__c]								 AS [TotalQuotedPrice]
   ,[Update_Quoted_with_Actuals__c]						 AS [UpdateQuotedWithActuals]
   ,ISNULL([Completed_By__c], '')						 AS [CompletedBy]
   ,[Completed_Date__c]									 AS [CompletedDate]
   ,[SVMXC__Dead_Time__c]								 AS [DeadTime]
   ,ISNULL([SVMXC__Entitlement_Notes__c], '')			 AS [EntitlementNotes]
   ,[SVMXC__Is_Entitlement_Performed__c]				 AS [IsEntitlementPerformed]
   ,ISNULL([SVMXC__Service_Maintenance_Contract__c], '') AS [ServiceMaintenanceContract]
   ,[SL_Inventory_Issued__c]							 AS [SlInventoryIssued]
   ,[LastModifiedDate]									 AS LastUpdate
   ,GETUTCDATE()										 AS ImportDate
FROM [SF].[SVMXC__Service_Order_Line__c];