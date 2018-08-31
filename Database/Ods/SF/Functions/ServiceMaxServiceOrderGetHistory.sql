-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 31-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxServiceOrderGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxServiceOrderGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [NVARCHAR](18) NOT NULL,
	[OwnerId] [NVARCHAR](18) NOT NULL,
	[IsDeleted] [TINYINT] NULL,
	[Name] [NVARCHAR](80) NOT NULL,
	[RecordTypeId] [NVARCHAR](18) NOT NULL,
	[CreatedDate] [DATETIME2](7) NULL,
	[CreatedById] [NVARCHAR](18) NOT NULL,
	[LastModifiedDate] [DATETIME2](7) NULL,
	[LastModifiedById] [NVARCHAR](18) NOT NULL,
	[SystemModstamp] [DATETIME2](7) NULL,
	[LastActivityDate] [DATETIME2](7) NULL,
	[LastViewedDate] [DATETIME2](7) NULL,
	[LastReferencedDate] [DATETIME2](7) NULL,
	[ServiceMaxAgeBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxAge] [DECIMAL](32, 16) NULL,
	[ServiceMaxBillingType] [NVARCHAR](255) NOT NULL,
	[ServiceMaxCity] [NVARCHAR](100) NOT NULL,
	[ServiceMaxCompany] [NVARCHAR](18) NOT NULL,
	[ServiceMaxComponent] [NVARCHAR](18) NOT NULL,
	[ServiceMaxConfigurationAfter] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxConfigurationBefore] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxContact] [NVARCHAR](18) NOT NULL,
	[ServiceMaxCountry] [NVARCHAR](255) NOT NULL,
	[ServiceMaxCustomerDownStatus] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxCustomerDown] [TINYINT] NULL,
	[ServiceMaxDispatchStatus] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxDrivingTime] [DECIMAL](32, 16) NULL,
	[ServiceMaxEndpointURL] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxFirstQueuedDateTime] [DATETIME2](7) NULL,
	[ServiceMaxGroupEmail] [NVARCHAR](80) NOT NULL,
	[ServiceMaxGroupMember] [NVARCHAR](18) NOT NULL,
	[ServiceMaxIsPartner] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxLastDispatchEvent] [NVARCHAR](255) NOT NULL,
	[ServiceMaxMemberEmail] [NVARCHAR](80) NOT NULL,
	[ServiceMaxNoOfTimesQueued] [DECIMAL](32, 16) NULL,
	[ServiceMaxNumberOfTimesQueuedBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxNumberOfTimesScheduledBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxOptiMaxStatus] [NVARCHAR](255) NOT NULL,
	[ServiceMaxOrderStatus] [NVARCHAR](255) NOT NULL,
	[ServiceMaxOrderType] [NVARCHAR](255) NOT NULL,
	[ServiceMaxPriority] [NVARCHAR](255) NOT NULL,
	[ServiceMaxProblemDescription] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxProduct] [NVARCHAR](18) NOT NULL,
	[ServiceMaxSessionId] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxScheduledDateTime] [DATETIME2](7) NULL,
	[ServiceMaxScheduledDate] [DATETIME2](7) NULL,
	[ServiceMaxTimeBetweenScheduleAndClose] [DECIMAL](32, 16) NULL,
	[ServiceMaxTimeToAssign] [DECIMAL](32, 16) NULL,
	[ServiceMaxTimeToQueue] [DECIMAL](32, 16) NULL,
	[ServiceMaxTimeToSchedule] [DECIMAL](32, 16) NULL,
	[ServiceMaxTimeBetweenAssignAndScheduleBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxTimeBetweenQueueAndAssignBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxTimeBetweenScheduleAndCloseBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxTimetoAssignBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxTimetoQueueBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxTimetoScheduleBucket] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxTurnaroundTime] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxWorkPerformed] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxZip] [NVARCHAR](100) NOT NULL,
	[ServiceMaxTotalBillableAmount] [DECIMAL](32, 16) NULL,
	[ServiceMaxTotalWorkOrderCost] [DECIMAL](32, 16) NULL,
	[Location] [NVARCHAR](18) NOT NULL,
	[ServiceMaxInvoiceCreated] [TINYINT] NULL,
	[ServiceMaxInvoiceNumber] [NVARCHAR](255) NOT NULL,
	[ServiceMaxIsEntitlementPerformed] [TINYINT] NULL,
	[ServiceMaxIsServiceCovered] [TINYINT] NULL,
	[ServiceMaxPerformAutoEntitlement] [TINYINT] NULL,
	[ServiceMaxSite] [NVARCHAR](18) NOT NULL,
	[ServiceMaxQtlStatus] [NVARCHAR](255) NOT NULL,
	[ServiceMaxQualifiedTechnicians] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxSkillSet] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxServiceZoneId] [NVARCHAR](255) NOT NULL,
	[EstimatedWorkDetailTotal] [DECIMAL](32, 16) NULL,
	[WorkOrderDeniedReason] [NVARCHAR](255) NOT NULL,
	[AdditionalServiceRecommended] [TINYINT] NULL,
	[EmergencyService] [TINYINT] NULL,
	[SerialNumber] [NVARCHAR](100) NOT NULL,
	[AssetTag] [NVARCHAR](100) NOT NULL,
	[CustomerPurchaseOrder] [NVARCHAR](35) NOT NULL,
	[InvoiceTotal] [DECIMAL](32, 16) NULL,
	[RecommendedService] [NVARCHAR](MAX) NOT NULL,
	[Make] [NVARCHAR](MAX) NOT NULL,
	[TfsServiceDate] [DATETIME2](7) NULL,
	[NteThreshold] [DECIMAL](32, 16) NULL,
	[MheFaultCodesTierI] [NVARCHAR](255) NOT NULL,
	[MheFaultCodesTierII] [NVARCHAR](255) NOT NULL,
	[Model1] [NVARCHAR](MAX) NOT NULL,
	[Broad] [NVARCHAR](MAX) NOT NULL,
	[Group] [NVARCHAR](MAX) NOT NULL,
	[Type] [NVARCHAR](MAX) NOT NULL,
	[BroadLocation] [NVARCHAR](255) NOT NULL,
	[BroadReportable] [NVARCHAR](MAX) NOT NULL,
	[GroupLocation] [NVARCHAR](255) NOT NULL,
	[TypeLocation] [NVARCHAR](255) NOT NULL,
	[GroupReportable] [NVARCHAR](MAX) NOT NULL,
	[TypeReportable] [NVARCHAR](MAX) NOT NULL,
	[TechnicianArrived] [TINYINT] NULL,
	[DispatchStatus1] [NVARCHAR](MAX) NOT NULL,
	[WorkOrderRollup] [TINYINT] NULL,
	[LaborRateStandard] [DECIMAL](32, 16) NULL,
	[MeterReading] [DECIMAL](32, 16) NULL,
	[BusinessUnit] [NVARCHAR](255) NOT NULL,
	[WorkDetailCount] [DECIMAL](32, 16) NULL,
	[TotalSalesTax] [DECIMAL](32, 16) NULL,
	[FieldOffice] [NVARCHAR](18) NOT NULL,
	[VendorWorkDetailsOpen] [DECIMAL](32, 16) NULL,
	[TotalCost] [DECIMAL](32, 16) NULL,
	[EstimatedWorkTotal] [DECIMAL](32, 16) NULL,
	[TfsInvoiceDate] [DATETIME2](7) NULL,
	[TfsDateEntered] [DATETIME2](7) NULL,
	[TfsVendorInvoice] [NVARCHAR](18) NOT NULL,
	[TfsVendorWorkOrder] [NVARCHAR](18) NOT NULL,
	[WorkOrderTotal] [DECIMAL](32, 16) NULL,
	[SalesTaxTotal] [DECIMAL](32, 16) NULL,
	[SuperCenter] [NVARCHAR](MAX) NOT NULL,
	[LaborPMRateDdm] [DECIMAL](32, 16) NULL,
	[LaborPMRateMhe] [DECIMAL](32, 16) NULL,
	[LaborStandardDdm] [DECIMAL](32, 16) NULL,
	[LaborStandardMhe] [DECIMAL](32, 16) NULL,
	[Labor2ManDdm] [DECIMAL](32, 16) NULL,
	[Labor2ManMhe] [DECIMAL](32, 16) NULL,
	[LaborOtddmDdm] [DECIMAL](32, 16) NULL,
	[LaborOtmheMhe] [DECIMAL](32, 16) NULL,
	[LaborDdmDdm] [DECIMAL](32, 16) NULL,
	[LaborDTMheMhe] [DECIMAL](32, 16) NULL,
	[JobInformation] [NVARCHAR](25) NOT NULL,
	[DockFault] [NVARCHAR](MAX) NOT NULL,
	[DoorFaultI] [NVARCHAR](MAX) NOT NULL,
	[GroupMiner] [NVARCHAR](255) NOT NULL,
	[FaultValidation] [DATETIME2](7) NULL,
	[VendorName] [NVARCHAR](18) NOT NULL,
	[MeterReadingRequired] [TINYINT] NULL,
	[DrawDate] [DATETIME2](7) NULL,
	[ContractInstall] [DATETIME2](7) NULL,
	[DoorFaultII] [NVARCHAR](MAX) NOT NULL,
	[SpecWasteFault] [NVARCHAR](MAX) NOT NULL,
	[DockSolutionI] [NVARCHAR](MAX) NOT NULL,
	[InvoiceDenied] [TINYINT] NULL,
	[MheResolutionCode] [NVARCHAR](255) NOT NULL,
	[DockSolutionII] [NVARCHAR](MAX) NOT NULL,
	[DoorSolutionI] [NVARCHAR](MAX) NOT NULL,
	[DoorSolutionII] [NVARCHAR](MAX) NOT NULL,
	[DoorSolutionIII] [NVARCHAR](MAX) NOT NULL,
	[SpecWastSolution] [NVARCHAR](MAX) NOT NULL,
	[EmailServiceReport] [NVARCHAR](80) NOT NULL,
	[SendServiceReporttoCustomer] [TINYINT] NULL,
	[EstimateNeeded] [TINYINT] NULL,
	[ContractAmount] [DECIMAL](32, 16) NULL,
	[ChangeOrderAmt] [DECIMAL](32, 16) NULL,
	[Notes] [NVARCHAR](MAX) NOT NULL,
	[Retainage] [TINYINT] NULL,
	[RetainagePercentage] [DECIMAL](32, 16) NULL,
	[ParentWorkOrder] [NVARCHAR](18) NOT NULL,
	[WorkOrderMargin] [DECIMAL](32, 16) NULL,
	[ChangeOrderAmt2] [DECIMAL](32, 16) NULL,
	[ChangeOrderAmt3] [DECIMAL](32, 16) NULL,
	[ChangeOrderAmt4] [DECIMAL](32, 16) NULL,
	[SignatureName] [NVARCHAR](100) NOT NULL,
	[Companycode] [NVARCHAR](MAX) NOT NULL,
	[PartsNeededc] [TINYINT] NULL,
	[EstimatePartsNotes] [NVARCHAR](MAX) NOT NULL,
	[WorkOrderMarginc2] [DECIMAL](32, 16) NULL,
	[ContractTotal] [DECIMAL](32, 16) NULL,
	[WorkFinished] [TINYINT] NULL,
	[InstalledProductName] [NVARCHAR](150) NOT NULL,
	[BroadIPwo] [NVARCHAR](MAX) NOT NULL,
	[GroupIPwo] [NVARCHAR](MAX) NOT NULL,
	[ServiceDateI] [NVARCHAR](8) NOT NULL,
	[LastWorkPerformed] [NVARCHAR](MAX) NOT NULL,
	[JobHistory] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxFinishedOnsiteDateTime] [DATETIME2](7) NULL,
	[ServiceMaxSchedulingChangeToken] [NVARCHAR](255) NOT NULL,
	[Salesperson] [NVARCHAR](18) NOT NULL,
	[InvoiceDateI] [NVARCHAR](8) NOT NULL,
	[Locked] [TINYINT] NULL,
	[LastMeterReading] [DECIMAL](32, 16) NULL,
	[CustomerQueue] [NVARCHAR](100) NOT NULL,
	[SalespersonWorkOrder] [NVARCHAR](18) NOT NULL,
	[PartsCost] [DECIMAL](32, 16) NULL,
	[TotalWorkOrderwTax] [DECIMAL](32, 16) NULL,
	[RejectedInvoiceAmount] [DECIMAL](32, 16) NULL,
	[LaborCost] [DECIMAL](32, 16) NULL,
	[WorkPerformedTfs] [NVARCHAR](MAX) NOT NULL,
	[InvoicePostToPeriod] [NVARCHAR](7) NOT NULL,
	[DocumentNumber] [NVARCHAR](MAX) NOT NULL,
	[InvoiceDocument] [NVARCHAR](25) NOT NULL,
	[MakeIP] [NVARCHAR](MAX) NOT NULL,
	[ModelIP] [NVARCHAR](MAX) NOT NULL,
	[TotalInvoiced] [DECIMAL](32, 16) NULL,
	[VendorInvoiceTotal] [DECIMAL](32, 16) NULL,
	[SLInvoiceDate] [DATETIME2](7) NULL,
	[Salesperson2ndWorkOrder] [NVARCHAR](18) NOT NULL,
	[LocationName] [NVARCHAR](100) NOT NULL,
	[TaxExemptProject] [TINYINT] NULL,
	[EquipSalesInfo] [NVARCHAR](MAX) NOT NULL,
	[LastMeterReadingDate] [DATETIME2](7) NULL,
	[LastPmDate] [DATETIME2](7) NULL,
	[LastPmMeterReading] [DECIMAL](32, 16) NULL,
	[PmDateDiff] [DECIMAL](32, 16) NULL,
	[PmMeterDiff] [DECIMAL](32, 16) NULL,
	[Certificate] [NVARCHAR](25) NOT NULL,
	[RejectionOverride] [TINYINT] NULL,
	[PermanentRejection] [TINYINT] NULL,
	[IPWarrantyEndDate] [DATETIME2](7) NULL,
	[DaysLeftUnderWarranty] [DECIMAL](32, 16) NULL,
	[MeterLeftUnderWarranty] [DECIMAL](32, 16) NULL,
	[ApprovalRequested] [DATETIME2](7) NULL,
	[ApprovalStatus] [NVARCHAR](255) NOT NULL,
	[AssignedApprover] [NVARCHAR](100) NOT NULL,
	[StaticDocNumber] [NVARCHAR](25) NOT NULL,
	[InvoiceReceivedDateI] [NVARCHAR](8) NOT NULL,
	[InvoiceReceivedDate] [DATETIME2](7) NULL,
	[AssetMgmtFees] [DECIMAL](32, 16) NULL,
	[TfsAmfWorkOrder] [TINYINT] NULL,
	[TaxCost] [DECIMAL](32, 16) NULL,
	[IPDepartment] [NVARCHAR](100) NOT NULL,
	[CongaVendorName] [NVARCHAR](MAX) NOT NULL,
	[DrawDateNew] [NVARCHAR](4) NOT NULL,
	[DocNumberDate] [DATETIME2](7) NULL,
	[ServiceReportFinalized] [TINYINT] NULL,
	[ServiceReportReceived] [TINYINT] NULL,
	[SuperCenterName] [NVARCHAR](MAX) NOT NULL,
	[SuperCenter2] [NVARCHAR](18) NOT NULL,
	[FirstTimeDispatched] [DATETIME2](7) NULL,
	[ResponseTime] [DECIMAL](32, 16) NULL,
	[DateTimeInvoiceCompleted] [DATETIME2](7) NULL,
	[DateTimeJobWorkComplete] [DATETIME2](7) NULL,
	[TimeToJobWorkComplete] [DECIMAL](32, 16) NULL,
	[TimeToInvoiceCompleted] [DECIMAL](32, 16) NULL,
	[Segment] [NVARCHAR](18) NOT NULL,
	[CanadianQSTPST] [DECIMAL](32, 16) NULL,
	[CanadianGSTHSTTPS] [DECIMAL](32, 16) NULL,
	[CanadianQSTPSTTVQ] [DECIMAL](32, 16) NULL,
	[InvoicedLines] [NVARCHAR](MAX) NOT NULL,
	[TimetoBookRevenue] [DECIMAL](32, 16) NULL,
	[EditQuotedValues] [TINYINT] NULL,
	[NonBillableItemApprovalStatus] [NVARCHAR](255) NOT NULL,
	[QuotedTotal] [DECIMAL](32, 16) NULL,
	[WorkOrderType] [NVARCHAR](255) NOT NULL,
	[NonBillableLineItems] [DECIMAL](32, 16) NULL,
	[NotBillablefromiPad] [DECIMAL](32, 16) NULL,
	[ServiceNotes] [NVARCHAR](MAX) NOT NULL,
	[ServiceMaxSMLJSMinimumScheduleDuration] [DECIMAL](32, 16) NULL,
	[LastUpdate] [datetime2](7) NOT NULL,
	[ImportDate] [datetime2](7) NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL,
	[__Operation] CHAR(1) NOT NULL,
	[__OperationDate] DATETIME2 NOT NULL
)
AS
BEGIN
	DECLARE @DistinctPKValue TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)
	)
	DECLARE @ActivityTable TABLE 
	(
		RowId BIGINT NOT NULL,
		ValidFrom DATETIME2	 NOT NULL,
		ValidTo DATETIME2 NOT NULL,
		RowNumber INT NOT NULL,
		MaxRowNumber INT NOT NULL,
		UNIQUE CLUSTERED (RowId, ValidFrom, ValidTo)
	)
	DECLARE @EndDateTableState TABLE
	(
		RowId BIGINT NOT NULL,
		UNIQUE CLUSTERED (RowId)	
	)
	DECLARE @InsertUpdateDeleteTable TABLE 
	(
		RowId BIGINT NOT NULL,
		Operation CHAR(1) NOT NULL,
		OperationDate DATETIME2 NOT NULL,
		UNIQUE CLUSTERED (RowId, Operation, OperationDate)
	)

	-- Find and store all distinct PK values found for the desired time period.
	INSERT INTO @DistinctPKValue (RowId)
	SELECT DISTINCT RowId
	FROM SF.ServiceMaxServiceOrder FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxServiceOrder
		FOR SYSTEM_TIME AS OF @EndDateUtc T
	INNER JOIN @EndDateTableState T2 ON T2.RowId = T.RowId

	-- For each PK value found above, store all activity for those rows.
	INSERT INTO @ActivityTable (RowId, ValidFrom, ValidTo, RowNumber, MaxRowNumber)
	SELECT
		 T.RowId
		,ValidFrom
		,ValidTo
		,ROW_NUMBER() OVER (PARTITION BY T.RowId ORDER BY ValidFrom) AS [RowNumber]
		,SUM(1) OVER (PARTITION BY T.RowId) AS MaxRowNumber
	FROM SF.ServiceMaxServiceOrder FOR SYSTEM_TIME ALL T 
	INNER JOIN @DistinctPKValue T2 ON T2.RowId = T.RowId

	-- Store all the inserts. An insert can be identified by a row in @ActivityTable that has a RowNumber = 1 and
	-- ValidFrom within the desired time period. The ValidFrom is the date the row was 'born'
	INSERT Into @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		RowId
		,'I' AS Operation
		,ValidFrom AS OperationDate
	FROM @ActivityTable
	WHERE RowNumber = 1 AND ValidFrom BETWEEN @StartDateUtc AND @EndDateUtc

	-- Store all the deletes. A delete can be identified by a row in @ActivityTable where RowNumber = MaxRowNumber and the row
	-- doesn't exist in @EndDateStateTable
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
	   ,'D'		AS Operation
	   ,ValidTo AS OperationDate
	FROM @ActivityTable				 T
		LEFT JOIN @EndDateTableState T2 ON T2.RowId = T.RowId
	WHERE
		T.RowNumber = T.MaxRowNumber
		AND T2.RowId IS NULL;

	-- Store all updates. An update can be identified by a row whose RowNumber > 1. If a row is inserted and then deleted (with no updates)
	-- there will only be a single row in history. Each time a row is updated, an entry is added to history. Therefore, the total number of
	-- updates for a row will be maximum row number - 1.
	INSERT INTO @InsertUpdateDeleteTable (RowId, Operation, OperationDate)
	SELECT
		T.RowId
		,'U' AS Operation
		,T.ValidFrom AS OperationDate
	FROM @ActivityTable T
	WHERE RowNumber > 1

	-- ====================================================================================================================
	-- Now we're going to gather all the results and store them in the return table.
	-- ====================================================================================================================

	;WITH BaseTableActivity AS
	(
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
		FROM SF.ServiceMaxServiceOrder
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
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
			,__Operation
			,__OperationDate
		)
	SELECT DISTINCT
		 T.[RowId]
		,T.Id
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
		,T.ServiceMaxCustomerDown
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
		,T.EstimatedWorkDetailTotal
		,T.WorkOrderDeniedReason
		,T.AdditionalServiceRecommended
		,T.EmergencyService
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
		,T.TechnicianArrived
		,T.DispatchStatus1
		,T.WorkOrderRollup
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
		,T.SuperCenter
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
		,T.ContractAmount
		,T.ChangeOrderAmt
		,T.Notes
		,T.Retainage
		,T.RetainagePercentage
		,T.ParentWorkOrder
		,T.WorkOrderMargin
		,T.ChangeOrderAmt2
		,T.ChangeOrderAmt3
		,T.ChangeOrderAmt4
		,T.SignatureName
		,T.Companycode
		,T.PartsNeededc
		,T.EstimatePartsNotes
		,T.WorkOrderMarginc2
		,T.ContractTotal
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
		,T.TaxExemptProject
		,T.EquipSalesInfo
		,T.LastMeterReadingDate
		,T.LastPmDate
		,T.LastPmMeterReading
		,T.PmDateDiff
		,T.PmMeterDiff
		,T.Certificate
		,T.RejectionOverride
		,T.PermanentRejection
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
		,T.ServiceReportFinalized
		,T.ServiceReportReceived
		,T.SuperCenterName
		,T.SuperCenter2
		,T.FirstTimeDispatched
		,T.ResponseTime
		,T.DateTimeInvoiceCompleted
		,T.DateTimeJobWorkComplete
		,T.TimeToJobWorkComplete
		,T.TimeToInvoiceCompleted
		,T.Segment
		,T.CanadianQSTPST
		,T.CanadianGSTHSTTPS
		,T.CanadianQSTPSTTVQ
		,T.InvoicedLines
		,T.TimetoBookRevenue
		,T.EditQuotedValues
		,T.NonBillableItemApprovalStatus
		,T.QuotedTotal
		,T.WorkOrderType
		,T.NonBillableLineItems
		,T.NotBillablefromiPad
		,T.ServiceNotes
		,T.ServiceMaxSMLJSMinimumScheduleDuration
		,T.LastUpdate
		,T.ImportDate
		,T.ValidFrom
		,T.ValidTo
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END