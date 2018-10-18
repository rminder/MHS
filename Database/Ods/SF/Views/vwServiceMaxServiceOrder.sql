
CREATE VIEW [SF].[vwServiceMaxServiceOrder]
AS
SELECT
	T.[RowId]
   ,T.[Id]
   ,T.[OwnerId]
   ,IIF(T.[IsDeleted] = 255, 1, T.[IsDeleted])											 AS [IsDeleted]
   ,T.[Name]
   ,T.[RecordTypeId]
   ,T.[CreatedDate]
   ,T.[CreatedById]
   ,T.[LastModifiedDate]
   ,T.[LastModifiedById]
   ,T.[SystemModstamp]
   ,T.[LastActivityDate]
   ,T.[LastViewedDate]
   ,T.[LastReferencedDate]
   ,T.ServiceMaxAgeBucket
   ,T.ServiceMaxAge
   ,T.ServiceMaxBillingType
   ,T.ServiceMaxCity
   ,T.ServiceMaxCompany
   ,T.ServiceMaxComponent
   ,T.ServiceMaxConfigurationAfter
   ,T.ServiceMaxConfigurationBefore
   ,T.ServiceMaxContact
   ,T.ServiceMaxCountry
   ,T.ServiceMaxCustomerDownStatus
   ,IIF(T.ServiceMaxCustomerDown = 255, 1, T.ServiceMaxCustomerDown)					 AS [ServiceMaxCustomerDown]
   ,T.ServiceMaxDispatchStatus
   ,T.ServiceMaxDrivingTime
   ,T.ServiceMaxEndpointURL
   ,T.ServiceMaxFirstQueuedDateTime
   ,T.ServiceMaxGroupEmail
   ,T.ServiceMaxGroupMember
   ,T.ServiceMaxIsPartner
   ,T.ServiceMaxLastDispatchEvent
   ,T.ServiceMaxMemberEmail
   ,T.ServiceMaxNoOfTimesQueued
   ,T.ServiceMaxNumberOfTimesQueuedBucket
   ,T.ServiceMaxNumberOfTimesScheduledBucket
   ,T.ServiceMaxOptiMaxStatus
   ,T.ServiceMaxOrderStatus
   ,T.ServiceMaxOrderType
   ,T.ServiceMaxPriority
   ,T.ServiceMaxProblemDescription
   ,T.ServiceMaxProduct
   ,T.ServiceMaxSessionId
   ,T.ServiceMaxScheduledDateTime
   ,T.ServiceMaxScheduledDate
   ,T.ServiceMaxTimeBetweenScheduleAndClose
   ,T.ServiceMaxTimeToAssign
   ,T.ServiceMaxTimeToQueue
   ,T.ServiceMaxTimeToSchedule
   ,T.ServiceMaxTimeBetweenAssignAndScheduleBucket
   ,T.ServiceMaxTimeBetweenQueueAndAssignBucket
   ,T.ServiceMaxTimeBetweenScheduleAndCloseBucket
   ,T.ServiceMaxTimetoAssignBucket
   ,T.ServiceMaxTimetoQueueBucket
   ,T.ServiceMaxTimetoScheduleBucket
   ,T.ServiceMaxTurnaroundTime
   ,T.ServiceMaxWorkPerformed
   ,T.ServiceMaxZip
   ,T.ServiceMaxTotalBillableAmount
   ,T.ServiceMaxTotalWorkOrderCost
   ,T.Location
   ,IIF(T.ServiceMaxInvoiceCreated = 255, 1, T.ServiceMaxInvoiceCreated)				 AS [ServiceMaxInvoiceCreated]
   ,T.ServiceMaxInvoiceNumber
   ,IIF(T.ServiceMaxIsEntitlementPerformed = 255, 1, T.ServiceMaxIsEntitlementPerformed) AS [ServiceMaxIsEntitlementPerformed]
   ,IIF(T.ServiceMaxIsServiceCovered = 255, 1, T.ServiceMaxIsServiceCovered)			 AS [ServiceMaxIsServiceCovered]
   ,IIF(T.ServiceMaxPerformAutoEntitlement = 255, 1, T.ServiceMaxPerformAutoEntitlement) AS [ServiceMaxPerformAutoEntitlement]
   ,T.ServiceMaxSite
   ,T.ServiceMaxQtlStatus
   ,T.ServiceMaxQualifiedTechnicians
   ,T.ServiceMaxSkillSet
   ,T.ServiceMaxServiceZoneId
   ,T.EstimatedWorkDetailTotal
   ,T.WorkOrderDeniedReason
   ,IIF(T.AdditionalServiceRecommended = 255, 1, T.AdditionalServiceRecommended)		 AS [AdditionalServiceRecommended]
   ,IIF(T.EmergencyService = 255, 1, T.EmergencyService)								 AS [EmergencyService]
   ,T.SerialNumber
   ,T.AssetTag
   ,T.CustomerPurchaseOrder
   ,T.InvoiceTotal
   ,T.RecommendedService
   ,T.Make
   ,T.TfsServiceDate
   ,T.NteThreshold
   ,T.MheFaultCodesTierI
   ,T.MheFaultCodesTierII
   ,T.Model1
   ,T.Broad
   ,T.[Group]
   ,T.Type
   ,T.BroadLocation
   ,T.BroadReportable
   ,T.GroupLocation
   ,T.TypeLocation
   ,T.GroupReportable
   ,T.TypeReportable
   ,IIF(T.TechnicianArrived = 255, 1, T.TechnicianArrived)								 AS [TechnicianArrived]
   ,T.DispatchStatus1
   ,IIF(T.WorkOrderRollup = 255, 1, T.WorkOrderRollup)									 AS [WorkOrderRollup]
   ,T.LaborRateStandard
   ,T.MeterReading
   ,T.BusinessUnit
   ,T.WorkDetailCount
   ,T.TotalSalesTax
   ,T.FieldOffice
   ,T.VendorWorkDetailsOpen
   ,T.TotalCost
   ,T.EstimatedWorkTotal
   ,T.TfsInvoiceDate
   ,T.TfsDateEntered
   ,T.TfsVendorInvoice
   ,T.TfsVendorWorkOrder
   ,T.WorkOrderTotal
   ,T.SalesTaxTotal
   ,T.[SuperCenter]
   ,T.LaborPMRateDdm
   ,T.LaborPMRateMhe
   ,T.LaborStandardDdm
   ,T.LaborStandardMhe
   ,T.Labor2ManDdm
   ,T.Labor2ManMhe
   ,T.LaborOtddmDdm
   ,T.LaborOtmheMhe
   ,T.LaborDdmDdm
   ,T.LaborDTMheMhe
   ,T.JobInformation
   ,T.DockFault
   ,T.DoorFaultI
   ,T.GroupMiner
   ,T.FaultValidation
   ,T.VendorName
   ,IIF(T.MeterReadingRequired = 255, 1, T.MeterReadingRequired)						 AS [MeterReadingRequired]
   ,T.DrawDate
   ,T.ContractInstall
   ,T.DoorFaultII
   ,T.SpecWasteFault
   ,T.DockSolutionI
   ,IIF(T.InvoiceDenied = 255, 1, T.InvoiceDenied)										 AS [InvoiceDenied]
   ,T.MheResolutionCode
   ,T.DockSolutionII
   ,T.DoorSolutionI
   ,T.DoorSolutionII
   ,T.DoorSolutionIII
   ,T.SpecWastSolution
   ,T.EmailServiceReport
   ,IIF(T.SendServiceReporttoCustomer = 255, 1, T.SendServiceReporttoCustomer)			 AS [SendServiceReportToCustomer]
   ,IIF(T.EstimateNeeded = 255, 1, T.EstimateNeeded)									 AS [EstimateNeeded]
   ,T.ContractAmount
   ,T.ChangeOrderAmt
   ,T.Notes
   ,IIF(T.Retainage = 255, 1, T.Retainage)												 AS [Retainage]
   ,T.RetainagePercentage
   ,T.ParentWorkOrder
   ,T.WorkOrderMargin
   ,T.ChangeOrderAmt2
   ,T.ChangeOrderAmt3
   ,T.ChangeOrderAmt4
   ,T.SignatureName
   ,T.[Companycode]
   ,IIF(T.PartsNeededc = 255, 1, T.PartsNeededc)										 AS [PartsNeeded]
   ,T.EstimatePartsNotes
   ,T.WorkOrderMarginc2
   ,T.ContractTotal
   ,IIF(T.WorkFinished = 255, 1, T.WorkFinished)										 AS [WorkFinished]
   ,T.InstalledProductName
   ,T.BroadIPwo
   ,T.GroupIPwo
   ,T.ServiceDateI
   ,T.LastWorkPerformed
   ,T.JobHistory
   ,T.ServiceMaxFinishedOnsiteDateTime
   ,T.ServiceMaxSchedulingChangeToken
   ,T.Salesperson
   ,T.InvoiceDateI
   ,IIF(T.Locked = 255, 1, T.Locked)													 AS [Locked]
   ,T.LastMeterReading
   ,T.CustomerQueue
   ,T.SalespersonWorkOrder
   ,T.PartsCost
   ,T.TotalWorkOrderwTax
   ,T.RejectedInvoiceAmount
   ,T.LaborCost
   ,T.WorkPerformedTfs
   ,T.InvoicePostToPeriod
   ,T.DocumentNumber
   ,T.InvoiceDocument
   ,T.MakeIP
   ,T.ModelIP
   ,T.TotalInvoiced
   ,T.VendorInvoiceTotal
   ,T.SLInvoiceDate
   ,T.Salesperson2ndWorkOrder
   ,T.LocationName
   ,IIF(T.TaxExemptProject = 255, 1, T.TaxExemptProject)								 AS [TaxExemptProject]
   ,T.EquipSalesInfo
   ,T.LastMeterReadingDate
   ,T.LastPmDate
   ,T.LastPmMeterReading
   ,T.PmDateDiff
   ,T.PmMeterDiff
   ,T.Certificate
   ,IIF(T.RejectionOverride = 255, 1, T.RejectionOverride)								 AS [RejectionOverride]
   ,IIF(T.PermanentRejection = 255, 1, T.PermanentRejection)							 AS [PermanentRejection]
   ,T.IPWarrantyEndDate
   ,T.DaysLeftUnderWarranty
   ,T.MeterLeftUnderWarranty
   ,T.ApprovalRequested
   ,T.ApprovalStatus
   ,T.AssignedApprover
   ,T.StaticDocNumber
   ,T.InvoiceReceivedDateI
   ,T.InvoiceReceivedDate
   ,T.AssetMgmtFees
   ,T.TfsAmfWorkOrder
   ,T.TaxCost
   ,T.IPDepartment
   ,T.CongaVendorName
   ,T.DrawDateNew
   ,T.DocNumberDate
   ,IIF(T.ServiceReportFinalized = 255, 1, T.ServiceReportFinalized)					 AS [ServiceReportFinalized]
   ,IIF(T.ServiceReportReceived = 255, 1, T.ServiceReportReceived)						 AS [ServiceReportReceived]
   ,T.SuperCenterName
   ,T.SuperCenter2
   ,T.FirstTimeDispatched
   ,T.ResponseTime
   ,T.DateTimeInvoiceCompleted
   ,T.DateTimeJobWorkComplete
   ,T.TimeToJobWorkComplete
   ,T.TimeToInvoiceCompleted
   ,T.[Segment]
   ,T.CanadianQSTPST
   ,T.CanadianGSTHSTTPS
   ,T.CanadianQSTPSTTVQ
   ,T.InvoicedLines
   ,T.TimetoBookRevenue
   ,IIF(T.EditQuotedValues = 255, 1, T.EditQuotedValues)								 AS [EditQuotedValues]
   ,T.NonBillableItemApprovalStatus
   ,T.QuotedTotal
   ,T.WorkOrderType
   ,T.NonBillableLineItems
   ,T.NotBillablefromiPad
   ,T.ServiceNotes
   ,T.ServiceMaxSMLJSMinimumScheduleDuration
   ,T2.Name																				 AS ServiceGroupMemberName
   ,T2.ServiceGroup																		 AS ServiceGroup
   ,T3.Name																				 AS ServiceGroupName
   ,T.LastUpdate
   ,T.ImportDate
FROM [SF].[ServiceMaxServiceOrder]					 T
	LEFT JOIN [SF].[vwServiceMaxServiceGroupMembers] T2 ON T2.Id		   = T.ServiceMaxGroupMember
	LEFT JOIN [SF].[vwServiceMaxServiceGroup]		 T3 ON T2.ServiceGroup = T3.Id;
GO
GRANT SELECT
    ON OBJECT::[SF].[vwServiceMaxServiceOrder] TO [OdsUser]
    AS [dbo];

