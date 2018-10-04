




CREATE VIEW [SF].[vwMH_Invoice_c]
AS
SELECT
	[Id]
   ,CAST(ISNULL([OwnerId], '') AS VARCHAR(18))												AS OwnerId
   ,[IsDeleted]
   ,CAST(ISNULL([Name], '') AS VARCHAR(80))													AS Name
   ,CAST(ISNULL([RecordTypeId], '') AS VARCHAR(18))											AS RecordTypeId
   ,[CreatedDate]
   ,CAST(ISNULL([CreatedById], '') AS VARCHAR(18))											AS CreatedById
   ,[LastModifiedDate]
   ,CAST(ISNULL([LastModifiedById], '') AS VARCHAR(18))										AS LastModifiedById
   ,[SystemModstamp]
   ,[LastActivityDate]
   ,[LastViewedDate]
   ,CAST(ISNULL([Account__c], '') AS VARCHAR(18))											AS Account
   ,CAST(ISNULL([Contact__c], '') AS VARCHAR(18))											AS Contact
   ,ISNULL([Customer_P_O__c], '')															AS CustomerPo
   ,[Invoice_Total__c]																		AS InvoiceTotal
   ,CAST(ISNULL([Location__c], '') AS VARCHAR(18))											AS Location
   ,CAST(ISNULL([Work_Order__c], '') AS VARCHAR(18))										AS WorkOrder
   ,CAST(ISNULL([Field_Office__c], '') AS VARCHAR(18))										AS FieldOffice
   ,[Voucher__c]																			AS Voucher
   ,CAST(ISNULL([Activity_Type__c], '') AS VARCHAR(255))									AS ActivityType
   ,[Date_Invoiced__c]																		AS DateInvoiced
   ,CAST(ISNULL([Call_Type__c], '') AS VARCHAR(MAX))										AS CallType
   ,[Invoice_Total_Rollup__c]																AS InvoiceTotalRollup
   ,CAST(ISNULL([Location_Address_c__c], '') AS VARCHAR(100))								AS LocationAddress
   ,CAST(ISNULL([Location_City_c__c], '') AS VARCHAR(50))									AS LocationCity
   ,[Labor_Time__c]																			AS LaborTime
   ,[Invoice_Details_Sub_Total__c]															AS InvoiceDetailsSubTotal
   ,[Sales_Tax__c]																			AS SalesTax
   ,[Start_Date_and_Time__c]																AS StartDateAndTime
   ,[End_Date_and_Time__c]																	AS EndDateAndTime
   ,CAST(ISNULL([Consumed_From_Location__c], '') AS VARCHAR(18))							AS ConsumedFromLocation
   ,CAST(ISNULL([Location_State_c__c], '') AS VARCHAR(25))									AS LocationState
   ,CAST(ISNULL([Location_Zip_c__c], '') AS VARCHAR(15))									AS LocationZip
   ,CAST(ISNULL([Supercenter__c], '') AS VARCHAR(100))										AS Supercenter
   ,CAST(ISNULL([Segment__c], '') AS VARCHAR(100))											AS Segment
   ,CAST(ISNULL([Supercenter_Formula__c], '') AS VARCHAR(MAX))								AS SupercenterFormula
   ,CAST(ISNULL([Segment_Formula__c], '') AS VARCHAR(MAX))									AS SegmentFormula
   ,CAST(ISNULL([Invoice_Terms_c__c], '') AS VARCHAR(25))									AS InvoiceTerms
   ,[Invoice_Sales_Tax_Roll_up__c]															AS InvoiceSalesTaxRollup
   ,[Invoice_Total_Rollup_1__c]																AS InvoiceTotalRollup1
   ,ISNULL([Service_Notes_c__c], '')														AS ServiceNotes
   ,CAST(ISNULL([Service_Team_Address_ic__c], '') AS VARCHAR(255))							AS ServiceTeamAddress
   ,CAST(ISNULL([Service_Team_City_ic__c], '') AS VARCHAR(255))								AS ServiceTeamCity
   ,CAST(ISNULL([Service_Team_State_ic__c], '') AS VARCHAR(255))							AS ServiceTeamState
   ,CAST(ISNULL([Service_Team_Zip_ic__c], '') AS VARCHAR(255))								AS ServiceTeamZip
   ,CAST(ISNULL([Service_Team_ic__c], '') AS VARCHAR(255))									AS ServiceTeam
   ,CAST(ISNULL([SL_Invoice_ID__c], '') AS VARCHAR(30))										AS SlInvoiceId
   ,CAST(ISNULL([Status__c], '') AS VARCHAR(255))											AS Status
   ,CAST(ISNULL([Company__c], '') AS VARCHAR(MAX))											AS Company
   ,CAST(ISNULL([Recommended_Service__c], '') AS VARCHAR(MAX))								AS RecommendedService
   ,ISNULL([SP_Work_Performed_c__c], '')													AS SpWorkPerformed
   ,[Invoice_Total_formula__c]																AS InvoiceTotalFormula
   ,[Sub_Total__c]																			AS SubTotal
   ,[Total_Tax__c]																			AS TotalTax
   ,[Hide_Line_ic__c]																		AS HideLine
   ,CAST(ISNULL([SL_Status__c], '') AS VARCHAR(1))											AS SlStatus
   ,[Tax_Added__c]																			AS TaxAdded
   ,CAST(ISNULL([Service_Team_Legal_Name__c], '') AS VARCHAR(100))							AS ServiceTeamLegalName
   ,CAST(ISNULL([Post_to_Period__c], '') AS VARCHAR(7))										AS PostToPeriod
   ,CAST(ISNULL([Account_Terms__c], '') AS VARCHAR(MAX))									AS AccountTerms
   ,CAST(ISNULL([WO_Doc_Number__c], '') AS VARCHAR(25))										AS WorkOrderDocumentNumber
   ,CAST(ISNULL([WO_Order_Type__c], '') AS VARCHAR(MAX))									AS WorkOrderType
   ,[SL_Invoice_Date_c__c]																	AS SlInvoiceDate
   ,[Invoice_Details_Revenue__c]															AS InvoiceDetailsRevenue
   ,[Invoice_Details_Cost__c]																AS InvoiceDetailsCost
   ,[Invoice_Margin__c]																		AS InvoiceMargin
   ,[WO_Labor_Total__c]																		AS WorkOrderLaborTotal
   ,[WO_Parts_Total__c]																		AS WorkOrderPartsTotal
   ,[WO_TFS_Tax_Total__c]																	AS WorkOrderTfsTaxTotal
   ,[Voucher_Roll_Up_Total__c]																AS VoucherRollupTotal
   ,CAST(ISNULL(Work_Description__c, '') AS VARCHAR(MAX))									AS WorkDescription
   ,CAST(ISNULL([Account_Account__r_SL_Vendor_ID__c], '') AS VARCHAR(15))					AS AccountSlVendorId
   ,CAST(ISNULL([Account_Field_Office__r_SL_Vendor_ID__c], '') AS VARCHAR(15))				AS AccountFieldOfficeSlVendorId
   ,CAST(ISNULL([Account_Account__r_MH_SL_CustID__c], '') AS VARCHAR(15))					AS AccountSlCustomerId
   ,CAST(ISNULL([Account_Field_Office__r_MH_SL_CustID__c], '') AS VARCHAR(15))				AS AccountFieldOfficeSlCustomerId
   ,CAST(ISNULL([Account_Account__r_UNITY_Account_External_Id__c], '') AS VARCHAR(80))		AS AccountUnityExternalId
   ,CAST(ISNULL([Account_Field_Office__r_UNITY_Account_External_Id__c], '') AS VARCHAR(80)) AS AccountFieldOfficeUnityExternalId
   ,CAST(ISNULL([Contact_Contact__r_UNITY_Contact_External_Id__c], '') AS VARCHAR(80))		AS ContactUnityExternalId
   ,CAST(ISNULL([Certificate__c], '') AS VARCHAR(80))										AS [Certificate]
   ,[LastModifiedDate]																		AS LastUpdate
   ,GETUTCDATE()																			AS ImportDate
FROM [SF].[MH_Invoice__c];