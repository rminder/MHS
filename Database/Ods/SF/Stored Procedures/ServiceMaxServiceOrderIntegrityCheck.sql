-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxServiceOrderIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxServiceOrderIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxServiceOrder;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__Service_Order__c;

	IF (@OdsRowCount > @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceOrder', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxServiceOrder
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSVMXC__Service_Order__c
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Id]
		   ,T.OwnerId
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceMaxAgeBucket
		   ,ROUND(T.ServiceMaxAge, 4)						   AS ServiceMaxAge
		   ,T.ServiceMaxBillingType
		   ,T.ServiceMaxCity
		   ,T.ServiceMaxCompany
		   ,T.ServiceMaxComponent
		   ,T.ServiceMaxConfigurationAfter
		   ,T.ServiceMaxConfigurationBefore
		   ,T.ServiceMaxContact
		   ,T.ServiceMaxCountry
		   ,T.ServiceMaxCustomerDownStatus
		   ,T.ServiceMaxCustomerDown
		   ,T.ServiceMaxDispatchStatus
		   ,ROUND(T.ServiceMaxDrivingTime, 4)				   AS ServiceMaxDrivingTime
		   ,T.ServiceMaxEndpointURL
		   ,T.ServiceMaxFirstQueuedDateTime
		   ,T.ServiceMaxGroupEmail
		   ,T.ServiceMaxGroupMember
		   ,T.ServiceMaxIsPartner
		   ,T.ServiceMaxLastDispatchEvent
		   ,T.ServiceMaxMemberEmail
		   ,ROUND(T.ServiceMaxNoOfTimesQueued, 4)			   AS ServiceMaxNoOfTimesQueued
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
		   ,ROUND(T.ServiceMaxTimeBetweenScheduleAndClose, 4)  AS ServiceMaxTimeBetweenScheduleAndClose
		   ,ROUND(T.ServiceMaxTimeToAssign, 4)				   AS ServiceMaxTimeToAssign
		   ,ROUND(T.ServiceMaxTimeToQueue, 4)				   AS ServiceMaxTimeToQueue
		   ,ROUND(T.ServiceMaxTimeToSchedule, 4)			   AS ServiceMaxTimeToSchedule
		   ,T.ServiceMaxTimeBetweenAssignAndScheduleBucket
		   ,T.ServiceMaxTimeBetweenQueueAndAssignBucket
		   ,T.ServiceMaxTimeBetweenScheduleAndCloseBucket
		   ,T.ServiceMaxTimetoAssignBucket
		   ,T.ServiceMaxTimetoQueueBucket
		   ,T.ServiceMaxTimetoScheduleBucket
		   ,T.ServiceMaxTurnaroundTime
		   ,T.ServiceMaxWorkPerformed
		   ,T.ServiceMaxZip
		   ,ROUND(T.ServiceMaxTotalBillableAmount, 4)		   AS ServiceMaxTotalBillableAmount
		   ,ROUND(T.ServiceMaxTotalWorkOrderCost, 4)		   AS ServiceMaxTotalWorkOrderCost
		   ,T.Location
		   ,T.ServiceMaxInvoiceCreated
		   ,T.ServiceMaxInvoiceNumber
		   ,T.ServiceMaxIsEntitlementPerformed
		   ,T.ServiceMaxIsServiceCovered
		   ,T.ServiceMaxPerformAutoEntitlement
		   ,T.ServiceMaxSite
		   ,T.ServiceMaxQtlStatus
		   ,T.ServiceMaxQualifiedTechnicians
		   ,T.ServiceMaxSkillSet
		   ,T.ServiceMaxServiceZoneId
		   ,ROUND(T.EstimatedWorkDetailTotal, 4)			   AS EstimatedWorkDetailTotal
		   ,T.WorkOrderDeniedReason
		   ,T.AdditionalServiceRecommended
		   ,T.EmergencyService
		   ,T.SerialNumber
		   ,T.AssetTag
		   ,T.CustomerPurchaseOrder
		   ,ROUND(T.InvoiceTotal, 4)						   AS InvoiceDetail
		   ,T.RecommendedService
		   ,T.Make
		   ,T.TfsServiceDate
		   ,ROUND(T.NteThreshold, 4)						   AS NteThreshold
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
		   ,T.TechnicianArrived
		   ,T.DispatchStatus1
		   ,T.WorkOrderRollup
		   ,ROUND(T.LaborRateStandard, 4)					   AS LaborRateStandard
		   ,ROUND(T.MeterReading, 4)						   AS MeterReading
		   ,T.BusinessUnit
		   ,ROUND(T.WorkDetailCount, 4)						   AS WorkDetailCount
		   ,ROUND(T.TotalSalesTax, 4)						   AS TotalSalesTax
		   ,T.FieldOffice
		   ,ROUND(T.VendorWorkDetailsOpen, 4)				   AS VendorWorkDetailsOpen
		   ,ROUND(T.TotalCost, 4)							   AS TotalCost
		   ,ROUND(T.EstimatedWorkTotal, 4)					   AS EstimatedWorkTotal
		   ,T.TfsInvoiceDate
		   ,T.TfsDateEntered
		   ,T.TfsVendorInvoice
		   ,T.TfsVendorWorkOrder
		   ,ROUND(T.WorkOrderTotal, 4)						   AS WorkOrderTotal
		   ,ROUND(T.SalesTaxTotal, 4)						   AS SalesTaxTotal
		   ,T.SuperCenter
		   ,ROUND(T.LaborPMRateDdm, 4)						   AS LaborPMRateDdm
		   ,ROUND(T.LaborPMRateMhe, 4)						   AS LaborPMRateMhe
		   ,ROUND(T.LaborStandardDdm, 4)					   AS LaborStandardDdm
		   ,ROUND(T.LaborStandardMhe, 4)					   AS LaborStandardMhe
		   ,ROUND(T.Labor2ManDdm, 4)						   AS Labor2ManDdm
		   ,ROUND(T.Labor2ManMhe, 4)						   AS Labor2ManMhe
		   ,ROUND(T.LaborOtddmDdm, 4)						   AS LaborOtddmDdm
		   ,ROUND(T.LaborOtmheMhe, 4)						   AS LaborOtmheMhe
		   ,ROUND(T.LaborDdmDdm, 4)							   AS LaborDdmDdm
		   ,ROUND(T.LaborDTMheMhe, 4)						   AS LaborDTMheMhe
		   ,T.JobInformation
		   ,T.DockFault
		   ,T.DoorFaultI
		   ,T.GroupMiner
		   ,T.FaultValidation
		   ,T.VendorName
		   ,T.MeterReadingRequired
		   ,T.DrawDate
		   ,T.ContractInstall
		   ,T.DoorFaultII
		   ,T.SpecWasteFault
		   ,T.DockSolutionI
		   ,T.InvoiceDenied
		   ,T.MheResolutionCode
		   ,T.DockSolutionII
		   ,T.DoorSolutionI
		   ,T.DoorSolutionII
		   ,T.DoorSolutionIII
		   ,T.SpecWastSolution
		   ,T.EmailServiceReport
		   ,T.SendServiceReporttoCustomer
		   ,T.EstimateNeeded
		   ,ROUND(T.ContractAmount, 4)						   AS ContractAmount
		   ,ROUND(T.ChangeOrderAmt, 4)						   AS ChangeOrderAmt
		   ,T.Notes
		   ,T.Retainage
		   ,ROUND(T.RetainagePercentage, 4)					   AS RetainagePercentage
		   ,T.ParentWorkOrder
		   ,T.WorkOrderMargin
		   ,ROUND(T.ChangeOrderAmt2, 4)						   AS ChangeOrderAmt2
		   ,ROUND(T.ChangeOrderAmt3, 4)						   AS ChangeOrderAmt3
		   ,ROUND(T.ChangeOrderAmt4, 4)						   AS ChangeOrderAmt4
		   ,T.SignatureName
		   ,T.Companycode
		   ,T.PartsNeeded
		   ,T.EstimatePartsNotes
		   ,ROUND(T.WorkOrderMarginc2, 4)					   AS WorkOrderMarginc2
		   ,ROUND(T.ContractTotal, 4)						   AS ContractTotal
		   ,T.WorkFinished
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
		   ,T.Locked
		   ,ROUND(T.LastMeterReading, 4)					   AS LastMeterReading
		   ,T.CustomerQueue
		   ,T.SalespersonWorkOrder
		   ,ROUND(T.PartsCost, 4)							   AS PartsCost
		   ,ROUND(T.TotalWorkOrderwTax, 4)					   AS TotalWorkOrderwTax
		   ,ROUND(T.RejectedInvoiceAmount, 4)				   AS RejectedInvoiceAmount
		   ,ROUND(T.LaborCost, 4)							   AS LaborCost
		   ,T.WorkPerformedTfs
		   ,T.InvoicePostToPeriod
		   ,T.DocumentNumber
		   ,T.InvoiceDocument
		   ,T.MakeIP
		   ,T.ModelIP
		   ,ROUND(T.TotalInvoiced, 4)						   AS TotalInvoiced
		   ,ROUND(T.VendorInvoiceTotal, 4)					   AS VendorInvoiceTotal
		   ,T.SLInvoiceDate
		   ,T.Salesperson2ndWorkOrder
		   ,T.LocationName
		   ,T.TaxExemptProject
		   ,T.EquipSalesInfo
		   ,T.LastMeterReadingDate
		   ,T.LastPmDate
		   ,ROUND(T.LastPmMeterReading, 4)					   AS LastPmMeterReading
		   ,ROUND(T.PmDateDiff, 4)							   AS PmDateDiff
		   ,ROUND(T.PmMeterDiff, 4)							   AS PmMeterDiff
		   ,T.Certificate
		   ,T.RejectionOverride
		   ,T.PermanentRejection
		   ,T.IPWarrantyEndDate
		   ,ROUND(T.DaysLeftUnderWarranty, 4)				   AS DaysLeftUnderWarranty
		   ,ROUND(T.MeterLeftUnderWarranty, 4)				   AS MeterLeftUnderWarranty
		   ,T.ApprovalRequested
		   ,T.ApprovalStatus
		   ,T.AssignedApprover
		   ,T.StaticDocNumber
		   ,T.InvoiceReceivedDateI
		   ,T.InvoiceReceivedDate
		   ,ROUND(T.AssetMgmtFees, 4)						   AS AssetMgmtFees
		   ,T.TfsAmfWorkOrder
		   ,ROUND(T.TaxCost, 4)								   AS TaxCost
		   ,T.IPDepartment
		   ,T.CongaVendorName
		   ,T.DrawDateNew
		   ,T.DocNumberDate
		   ,T.ServiceReportFinalized
		   ,T.ServiceReportReceived
		   ,T.SuperCenterName
		   ,T.SuperCenter2
		   ,T.FirstTimeDispatched
		   ,ROUND(T.ResponseTime, 4)						   AS ResponseTime
		   ,T.DateTimeInvoiceCompleted
		   ,T.DateTimeJobWorkComplete
		   ,ROUND(T.TimeToJobWorkComplete, 4)				   AS TimeToJobWorkComplete
		   ,ROUND(T.TimeToInvoiceCompleted, 4)				   AS TimeToInvoiceCompleted
		   ,T.Segment
		   ,ROUND(T.CanadianQSTPST, 4)						   AS CanadianQSTPST
		   ,ROUND(T.CanadianGSTHSTTPS, 4)					   AS CanadianGSTHSTTPS
		   ,ROUND(T.CanadianQSTPSTTVQ, 4)					   AS CanadianQSTPSTTVQ
		   ,T.InvoicedLines
		   ,ROUND(T.TimetoBookRevenue, 4)					   AS TimetoBookRevenue
		   ,T.EditQuotedValues
		   ,T.NonBillableItemApprovalStatus
		   ,ROUND(T.QuotedTotal, 4)							   AS QuotedTOtal
		   ,T.WorkOrderType
		   ,ROUND(T.NonBillableLineItems, 4)				   AS NonBillableLineItems
		   ,ROUND(T.NotBillablefromiPad, 4)					   AS NotBillablefromiPad
		   ,T.ServiceNotes
		   ,ROUND(T.ServiceMaxSMLJSMinimumScheduleDuration, 4) AS ServiceMaxSMLJSMinimumScheduleDuration
		   ,T.LastUpdate
		FROM ODS.SF.vwServiceMaxServiceOrder T
			INNER JOIN CommonRows			 T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18))						   AS Id
		   ,T.OwnerId
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.CreatedDate
		   ,T.CreatedById
		   ,T.LastModifiedDate
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.ServiceMaxAgeBucket
		   ,ROUND(T.ServiceMaxAge, 4)						   AS ServiceMaxAge
		   ,T.ServiceMaxBillingType
		   ,T.ServiceMaxCity
		   ,T.ServiceMaxCompany
		   ,T.ServiceMaxComponent
		   ,T.ServiceMaxConfigurationAfter
		   ,T.ServiceMaxConfigurationBefore
		   ,T.ServiceMaxContact
		   ,T.ServiceMaxCountry
		   ,T.ServiceMaxCustomerDownStatus
		   ,T.ServiceMaxCustomerDown
		   ,T.ServiceMaxDispatchStatus
		   ,ROUND(T.ServiceMaxDrivingTime, 4)				   AS ServiceMaxDrivingTime
		   ,T.ServiceMaxEndpointURL
		   ,T.ServiceMaxFirstQueuedDateTime
		   ,T.ServiceMaxGroupEmail
		   ,T.ServiceMaxGroupMember
		   ,T.ServiceMaxIsPartner
		   ,T.ServiceMaxLastDispatchEvent
		   ,T.ServiceMaxMemberEmail
		   ,ROUND(T.ServiceMaxNoOfTimesQueued, 4)			   AS ServiceMaxNoOfTimesQueued
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
		   ,ROUND(T.ServiceMaxTimeBetweenScheduleAndClose, 4)  AS ServiceMaxTimeBetweenScheduleAndClose
		   ,ROUND(T.ServiceMaxTimeToAssign, 4)				   AS ServiceMaxTimeToAssign
		   ,ROUND(T.ServiceMaxTimeToQueue, 4)				   AS ServiceMaxTimeToQueue
		   ,ROUND(T.ServiceMaxTimeToSchedule, 4)			   AS ServiceMaxTimeToSchedule
		   ,T.ServiceMaxTimeBetweenAssignAndScheduleBucket
		   ,T.ServiceMaxTimeBetweenQueueAndAssignBucket
		   ,T.ServiceMaxTimeBetweenScheduleAndCloseBucket
		   ,T.ServiceMaxTimetoAssignBucket
		   ,T.ServiceMaxTimetoQueueBucket
		   ,T.ServiceMaxTimetoScheduleBucket
		   ,T.ServiceMaxTurnaroundTime
		   ,T.ServiceMaxWorkPerformed
		   ,T.ServiceMaxZip
		   ,ROUND(T.ServiceMaxTotalBillableAmount, 4)		   AS ServiceMaxTotalBillableAmount
		   ,ROUND(T.ServiceMaxTotalWorkOrderCost, 4)		   AS ServiceMaxTotalWorkOrderCost
		   ,T.Location
		   ,T.ServiceMaxInvoiceCreated
		   ,T.ServiceMaxInvoiceNumber
		   ,T.ServiceMaxIsEntitlementPerformed
		   ,T.ServiceMaxIsServiceCovered
		   ,T.ServiceMaxPerformAutoEntitlement
		   ,T.ServiceMaxSite
		   ,T.ServiceMaxQtlStatus
		   ,T.ServiceMaxQualifiedTechnicians
		   ,T.ServiceMaxSkillSet
		   ,T.ServiceMaxServiceZoneId
		   ,ROUND(T.EstimatedWorkDetailTotal, 4)			   AS EstimatedWorkDetailTotal
		   ,T.WorkOrderDeniedReason
		   ,T.AdditionalServiceRecommended
		   ,T.EmergencyService
		   ,T.SerialNumber
		   ,T.AssetTag
		   ,T.CustomerPurchaseOrder
		   ,ROUND(T.InvoiceTotal, 4)						   AS InvoiceDetail
		   ,T.RecommendedService
		   ,T.Make
		   ,T.TfsServiceDate
		   ,ROUND(T.NteThreshold, 4)						   AS NteThreshold
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
		   ,T.TechnicianArrived
		   ,T.DispatchStatus1
		   ,T.WorkOrderRollup
		   ,ROUND(T.LaborRateStandard, 4)					   AS LaborRateStandard
		   ,ROUND(T.MeterReading, 4)						   AS MeterReading
		   ,T.BusinessUnit
		   ,ROUND(T.WorkDetailCount, 4)						   AS WorkDetailCount
		   ,ROUND(T.TotalSalesTax, 4)						   AS TotalSalesTax
		   ,T.FieldOffice
		   ,ROUND(T.VendorWorkDetailsOpen, 4)				   AS VendorWorkDetailsOpen
		   ,ROUND(T.TotalCost, 4)							   AS TotalCost
		   ,ROUND(T.EstimatedWorkTotal, 4)					   AS EstimatedWorkTotal
		   ,T.TfsInvoiceDate
		   ,T.TfsDateEntered
		   ,T.TfsVendorInvoice
		   ,T.TfsVendorWorkOrder
		   ,ROUND(T.WorkOrderTotal, 4)						   AS WorkOrderTotal
		   ,ROUND(T.SalesTaxTotal, 4)						   AS SalesTaxTotal
		   ,T.SuperCenter
		   ,ROUND(T.LaborPMRateDdm, 4)						   AS LaborPMRateDdm
		   ,ROUND(T.LaborPMRateMhe, 4)						   AS LaborPMRateMhe
		   ,ROUND(T.LaborStandardDdm, 4)					   AS LaborStandardDdm
		   ,ROUND(T.LaborStandardMhe, 4)					   AS LaborStandardMhe
		   ,ROUND(T.Labor2ManDdm, 4)						   AS Labor2ManDdm
		   ,ROUND(T.Labor2ManMhe, 4)						   AS Labor2ManMhe
		   ,ROUND(T.LaborOtddmDdm, 4)						   AS LaborOtddmDdm
		   ,ROUND(T.LaborOtmheMhe, 4)						   AS LaborOtmheMhe
		   ,ROUND(T.LaborDdmDdm, 4)							   AS LaborDdmDdm
		   ,ROUND(T.LaborDTMheMhe, 4)						   AS LaborDTMheMhe
		   ,T.JobInformation
		   ,T.DockFault
		   ,T.DoorFaultI
		   ,T.GroupMiner
		   ,T.FaultValidation
		   ,T.VendorName
		   ,T.MeterReadingRequired
		   ,T.DrawDate
		   ,T.ContractInstall
		   ,T.DoorFaultII
		   ,T.SpecWasteFault
		   ,T.DockSolutionI
		   ,T.InvoiceDenied
		   ,T.MheResolutionCode
		   ,T.DockSolutionII
		   ,T.DoorSolutionI
		   ,T.DoorSolutionII
		   ,T.DoorSolutionIII
		   ,T.SpecWastSolution
		   ,T.EmailServiceReport
		   ,T.SendServiceReporttoCustomer
		   ,T.EstimateNeeded
		   ,ROUND(T.ContractAmount, 4)						   AS ContractAmount
		   ,ROUND(T.ChangeOrderAmt, 4)						   AS ChangeOrderAmt
		   ,T.Notes
		   ,T.Retainage
		   ,ROUND(T.RetainagePercentage, 4)					   AS RetainagePercentage
		   ,T.ParentWorkOrder
		   ,T.WorkOrderMargin
		   ,ROUND(T.ChangeOrderAmt2, 4)						   AS ChangeOrderAmt2
		   ,ROUND(T.ChangeOrderAmt3, 4)						   AS ChangeOrderAmt3
		   ,ROUND(T.ChangeOrderAmt4, 4)						   AS ChangeOrderAmt4
		   ,T.SignatureName
		   ,T.Companycode
		   ,T.PartsNeededc
		   ,T.EstimatePartsNotes
		   ,ROUND(T.WorkOrderMarginc2, 4)					   AS WorkOrderMarginc2
		   ,ROUND(T.ContractTotal, 4)						   AS ContractTotal
		   ,T.WorkFinished
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
		   ,T.Locked
		   ,ROUND(T.LastMeterReading, 4)					   AS LastMeterReading
		   ,T.CustomerQueue
		   ,T.SalespersonWorkOrder
		   ,ROUND(T.PartsCost, 4)							   AS PartsCost
		   ,ROUND(T.TotalWorkOrderwTax, 4)					   AS TotalWorkOrderwTax
		   ,ROUND(T.RejectedInvoiceAmount, 4)				   AS RejectedInvoiceAmount
		   ,ROUND(T.LaborCost, 4)							   AS LaborCost
		   ,T.WorkPerformedTfs
		   ,T.InvoicePostToPeriod
		   ,T.DocumentNumber
		   ,T.InvoiceDocument
		   ,T.MakeIP
		   ,T.ModelIP
		   ,ROUND(T.TotalInvoiced, 4)						   AS TotalInvoiced
		   ,ROUND(T.VendorInvoiceTotal, 4)					   AS VendorInvoiceTotal
		   ,T.SLInvoiceDate
		   ,T.Salesperson2ndWorkOrder
		   ,T.LocationName
		   ,T.TaxExemptProject
		   ,T.EquipSalesInfo
		   ,T.LastMeterReadingDate
		   ,T.LastPmDate
		   ,ROUND(T.LastPmMeterReading, 4)					   AS LastPmMeterReading
		   ,ROUND(T.PmDateDiff, 4)							   AS PmDateDiff
		   ,ROUND(T.PmMeterDiff, 4)							   AS PmMeterDiff
		   ,T.Certificate
		   ,T.RejectionOverride
		   ,T.PermanentRejection
		   ,T.IPWarrantyEndDate
		   ,ROUND(T.DaysLeftUnderWarranty, 4)				   AS DaysLeftUnderWarranty
		   ,ROUND(T.MeterLeftUnderWarranty, 4)				   AS MeterLeftUnderWarranty
		   ,T.ApprovalRequested
		   ,T.ApprovalStatus
		   ,T.AssignedApprover
		   ,T.StaticDocNumber
		   ,T.InvoiceReceivedDateI
		   ,T.InvoiceReceivedDate
		   ,ROUND(T.AssetMgmtFees, 4)						   AS AssetMgmtFees
		   ,T.TfsAmfWorkOrder
		   ,ROUND(T.TaxCost, 4)								   AS TaxCost
		   ,T.IPDepartment
		   ,T.CongaVendorName
		   ,T.DrawDateNew
		   ,T.DocNumberDate
		   ,T.ServiceReportFinalized
		   ,T.ServiceReportReceived
		   ,T.SuperCenterName
		   ,T.SuperCenter2
		   ,T.FirstTimeDispatched
		   ,ROUND(T.ResponseTime, 4)						   AS ResponseTime
		   ,T.DateTimeInvoiceCompleted
		   ,T.DateTimeJobWorkComplete
		   ,ROUND(T.TimeToJobWorkComplete, 4)				   AS TimeToJobWorkComplete
		   ,ROUND(T.TimeToInvoiceCompleted, 4)				   AS TimeToInvoiceCompleted
		   ,T.Segment
		   ,ROUND(T.CanadianQSTPST, 4)						   AS CanadianQSTPST
		   ,ROUND(T.CanadianGSTHSTTPS, 4)					   AS CanadianGSTHSTTPS
		   ,ROUND(T.CanadianQSTPSTTVQ, 4)					   AS CanadianQSTPSTTVQ
		   ,T.InvoicedLines
		   ,ROUND(T.TimetoBookRevenue, 4)					   AS TimetoBookRevenue
		   ,T.EditQuotedValues
		   ,T.NonBillableItemApprovalStatus
		   ,ROUND(T.QuotedTotal, 4)							   AS QuotedTOtal
		   ,T.WorkOrderType
		   ,ROUND(T.NonBillableLineItems, 4)				   AS NonBillableLineItems
		   ,ROUND(T.NotBillablefromiPad, 4)					   AS NotBillablefromiPad
		   ,T.ServiceNotes
		   ,ROUND(T.ServiceMaxSMLJSMinimumScheduleDuration, 4) AS ServiceMaxSMLJSMinimumScheduleDuration
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__Service_Order__c T
			INNER JOIN CommonRows					 T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Note, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SFLastModifiedDate
	   ,T.LastModifiedDate	AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences									   T
		INNER JOIN ODSStaging.SF.vwSVMXC__Service_Order__c T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceOrder', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__Service_Order__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;