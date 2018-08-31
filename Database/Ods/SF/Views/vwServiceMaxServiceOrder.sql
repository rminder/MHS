﻿CREATE VIEW SF.vwServiceMaxServiceOrder
AS
SELECT
	[RowId]
   ,[Id]
   ,[OwnerId]
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
   ,[ServiceMaxAgeBucket]
   ,[ServiceMaxAge]
   ,[ServiceMaxBillingType]
   ,[ServiceMaxCity]
   ,[ServiceMaxCompany]
   ,[ServiceMaxComponent]
   ,[ServiceMaxConfigurationAfter]
   ,[ServiceMaxConfigurationBefore]
   ,[ServiceMaxContact]
   ,[ServiceMaxCountry]
   ,[ServiceMaxCustomerDownStatus]
   ,[ServiceMaxCustomerDown]
   ,[ServiceMaxDispatchStatus]
   ,[ServiceMaxDrivingTime]
   ,[ServiceMaxEndpointURL]
   ,[ServiceMaxFirstQueuedDateTime]
   ,[ServiceMaxGroupEmail]
   ,[ServiceMaxGroupMember]
   ,[ServiceMaxIsPartner]
   ,[ServiceMaxLastDispatchEvent]
   ,[ServiceMaxMemberEmail]
   ,[ServiceMaxNoOfTimesQueued]
   ,[ServiceMaxNumberOfTimesQueuedBucket]
   ,[ServiceMaxNumberOfTimesScheduledBucket]
   ,[ServiceMaxOptiMaxStatus]
   ,[ServiceMaxOrderStatus]
   ,[ServiceMaxOrderType]
   ,[ServiceMaxPriority]
   ,[ServiceMaxProblemDescription]
   ,[ServiceMaxProduct]
   ,[ServiceMaxSessionId]
   ,[ServiceMaxScheduledDateTime]
   ,[ServiceMaxScheduledDate]
   ,[ServiceMaxTimeBetweenScheduleAndClose]
   ,[ServiceMaxTimeToAssign]
   ,[ServiceMaxTimeToQueue]
   ,[ServiceMaxTimeToSchedule]
   ,[ServiceMaxTimeBetweenAssignAndScheduleBucket]
   ,[ServiceMaxTimeBetweenQueueAndAssignBucket]
   ,[ServiceMaxTimeBetweenScheduleAndCloseBucket]
   ,[ServiceMaxTimetoAssignBucket]
   ,[ServiceMaxTimetoQueueBucket]
   ,[ServiceMaxTimetoScheduleBucket]
   ,[ServiceMaxTurnaroundTime]
   ,[ServiceMaxWorkPerformed]
   ,[ServiceMaxZip]
   ,[ServiceMaxTotalBillableAmount]
   ,[ServiceMaxTotalWorkOrderCost]
   ,[Location]
   ,[ServiceMaxInvoiceCreated]
   ,[ServiceMaxInvoiceNumber]
   ,[ServiceMaxIsEntitlementPerformed]
   ,[ServiceMaxIsServiceCovered]
   ,[ServiceMaxPerformAutoEntitlement]
   ,[ServiceMaxSite]
   ,[ServiceMaxQtlStatus]
   ,[ServiceMaxQualifiedTechnicians]
   ,[ServiceMaxSkillSet]
   ,[ServiceMaxServiceZoneId]
   ,[EstimatedWorkDetailTotal]
   ,[WorkOrderDeniedReason]
   ,[AdditionalServiceRecommended]
   ,[EmergencyService]
   ,[SerialNumber]
   ,[AssetTag]
   ,[CustomerPurchaseOrder]
   ,[InvoiceTotal]
   ,[RecommendedService]
   ,[Make]
   ,[TfsServiceDate]
   ,[NteThreshold]
   ,[MheFaultCodesTierI]
   ,[MheFaultCodesTierII]
   ,[Model1]
   ,[Broad]
   ,[Group]
   ,[Type]
   ,[BroadLocation]
   ,[BroadReportable]
   ,[GroupLocation]
   ,[TypeLocation]
   ,[GroupReportable]
   ,[TypeReportable]
   ,[TechnicianArrived]
   ,[DispatchStatus1]
   ,[WorkOrderRollup]
   ,[LaborRateStandard]
   ,[MeterReading]
   ,[BusinessUnit]
   ,[WorkDetailCount]
   ,[TotalSalesTax]
   ,[FieldOffice]
   ,[VendorWorkDetailsOpen]
   ,[TotalCost]
   ,[EstimatedWorkTotal]
   ,[TfsInvoiceDate]
   ,[TfsDateEntered]
   ,[TfsVendorInvoice]
   ,[TfsVendorWorkOrder]
   ,[WorkOrderTotal]
   ,[SalesTaxTotal]
   ,[SuperCenter]
   ,[LaborPMRateDdm]
   ,[LaborPMRateMhe]
   ,[LaborStandardDdm]
   ,[LaborStandardMhe]
   ,[Labor2ManDdm]
   ,[Labor2ManMhe]
   ,[LaborOtddmDdm]
   ,[LaborOtmheMhe]
   ,[LaborDdmDdm]
   ,[LaborDTMheMhe]
   ,[JobInformation]
   ,[DockFault]
   ,[DoorFaultI]
   ,[GroupMiner]
   ,[FaultValidation]
   ,[VendorName]
   ,[MeterReadingRequired]
   ,[DrawDate]
   ,[ContractInstall]
   ,[DoorFaultII]
   ,[SpecWasteFault]
   ,[DockSolutionI]
   ,[InvoiceDenied]
   ,[MheResolutionCode]
   ,[DockSolutionII]
   ,[DoorSolutionI]
   ,[DoorSolutionII]
   ,[DoorSolutionIII]
   ,[SpecWastSolution]
   ,[EmailServiceReport]
   ,[SendServiceReporttoCustomer]
   ,[EstimateNeeded]
   ,[ContractAmount]
   ,[ChangeOrderAmt]
   ,[Notes]
   ,[Retainage]
   ,[RetainagePercentage]
   ,[ParentWorkOrder]
   ,[WorkOrderMargin]
   ,[ChangeOrderAmt2]
   ,[ChangeOrderAmt3]
   ,[ChangeOrderAmt4]
   ,[SignatureName]
   ,[Companycode]
   ,[PartsNeededc]
   ,[EstimatePartsNotes]
   ,[WorkOrderMarginc2]
   ,[ContractTotal]
   ,[WorkFinished]
   ,[InstalledProductName]
   ,[BroadIPwo]
   ,[GroupIPwo]
   ,[ServiceDateI]
   ,[LastWorkPerformed]
   ,[JobHistory]
   ,[ServiceMaxFinishedOnsiteDateTime]
   ,[ServiceMaxSchedulingChangeToken]
   ,[Salesperson]
   ,[InvoiceDateI]
   ,[Locked]
   ,[LastMeterReading]
   ,[CustomerQueue]
   ,[SalespersonWorkOrder]
   ,[PartsCost]
   ,[TotalWorkOrderwTax]
   ,[RejectedInvoiceAmount]
   ,[LaborCost]
   ,[WorkPerformedTfs]
   ,[InvoicePostToPeriod]
   ,[DocumentNumber]
   ,[InvoiceDocument]
   ,[MakeIP]
   ,[ModelIP]
   ,[TotalInvoiced]
   ,[VendorInvoiceTotal]
   ,[SLInvoiceDate]
   ,[Salesperson2ndWorkOrder]
   ,[LocationName]
   ,[TaxExemptProject]
   ,[EquipSalesInfo]
   ,[LastMeterReadingDate]
   ,[LastPmDate]
   ,[LastPmMeterReading]
   ,[PmDateDiff]
   ,[PmMeterDiff]
   ,[Certificate]
   ,[RejectionOverride]
   ,[PermanentRejection]
   ,[IPWarrantyEndDate]
   ,[DaysLeftUnderWarranty]
   ,[MeterLeftUnderWarranty]
   ,[ApprovalRequested]
   ,[ApprovalStatus]
   ,[AssignedApprover]
   ,[StaticDocNumber]
   ,[InvoiceReceivedDateI]
   ,[InvoiceReceivedDate]
   ,[AssetMgmtFees]
   ,[TfsAmfWorkOrder]
   ,[TaxCost]
   ,[IPDepartment]
   ,[CongaVendorName]
   ,[DrawDateNew]
   ,[DocNumberDate]
   ,[ServiceReportFinalized]
   ,[ServiceReportReceived]
   ,[SuperCenterName]
   ,[SuperCenter2]
   ,[FirstTimeDispatched]
   ,[ResponseTime]
   ,[DateTimeInvoiceCompleted]
   ,[DateTimeJobWorkComplete]
   ,[TimeToJobWorkComplete]
   ,[TimeToInvoiceCompleted]
   ,[Segment]
   ,[CanadianQSTPST]
   ,[CanadianGSTHSTTPS]
   ,[CanadianQSTPSTTVQ]
   ,[InvoicedLines]
   ,[TimetoBookRevenue]
   ,[EditQuotedValues]
   ,[NonBillableItemApprovalStatus]
   ,[QuotedTotal]
   ,[WorkOrderType]
   ,[NonBillableLineItems]
   ,[NotBillablefromiPad]
   ,[ServiceNotes]
   ,[ServiceMaxSMLJSMinimumScheduleDuration]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SF].[ServiceMaxServiceOrder];
GO
GRANT SELECT
    ON OBJECT::[SF].[vwServiceMaxServiceOrder] TO [OdsUser]
    AS [dbo];
