-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 29-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[MaterialHandlingInvoiceGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[MaterialHandlingInvoiceGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Account] [varchar](18) NOT NULL,
	[ActivityType] [varchar](255) NOT NULL,
	[AccountSlVendorId] [varchar](15) NOT NULL,
	[AccountSlCustomerId] [varchar](15) NOT NULL,
	[AccountUnityExternalId] [varchar](80) NOT NULL,
	[AccountFieldOfficeSlCustomerId] [varchar](15) NOT NULL,
	[AccountFieldOfficeSlVendorId] [varchar](15) NOT NULL,
	[AccountFieldOfficeUnityExternalId] [varchar](80) NOT NULL,
	[AccountTerms] [varchar](max) NOT NULL,
	[CallType] [varchar](max) NOT NULL,
	[Certificate] [varchar](80) NOT NULL,
	[Company] [varchar](max) NOT NULL,
	[ConsumedFromLocation] [varchar](18) NOT NULL,
	[Contact] [varchar](18) NOT NULL,
	[ContactUnityExternalId] [varchar](80) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [varchar](18) NOT NULL,
	[CustomerPo] [nvarchar](35) NOT NULL,
	[DateInvoiced] [datetime2](7) NULL,
	[EndDateAndTime] [datetime2](7) NULL,
	[FieldOffice] [varchar](18) NOT NULL,
	[HideLine] [tinyint] NULL,
	[Id] [varchar](18) NOT NULL,
	[InvoiceDetailsCost] [decimal](32, 16) NULL,
	[InvoiceDetailsRevenue] [decimal](32, 16) NULL,
	[InvoiceDetailsSubTotal] [decimal](32, 16) NULL,
	[InvoiceMargin] [decimal](32, 16) NULL,
	[InvoiceTerms] [varchar](25) NOT NULL,
	[InvoiceSalesTaxRollup] [decimal](32, 16) NULL,
	[InvoiceTotal] [decimal](32, 16) NULL,
	[InvoiceTotalFormula] [decimal](32, 16) NULL,
	[InvoiceTotalRollup] [decimal](32, 16) NULL,
	[InvoiceTotalRollup1] [decimal](32, 16) NULL,
	[IsDeleted] [tinyint] NULL,
	[LaborTime] [decimal](32, 16) NULL,
	[LastActivityDate] [datetime2](7) NULL,
	[LastViewedDate] [datetime2](7) NULL,
	[LastModifiedById] [varchar](18) NOT NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[Location] [varchar](18) NOT NULL,
	[LocationAddress] [varchar](100) NOT NULL,
	[LocationCity] [varchar](50) NOT NULL,
	[LocationState] [varchar](25) NOT NULL,
	[LocationZip] [varchar](15) NOT NULL,
	[Name] [varchar](80) NOT NULL,
	[OwnerId] [varchar](18) NOT NULL,
	[PostToPeriod] [varchar](7) NOT NULL,
	[RecommendedService] [varchar](max) NOT NULL,
	[RecordTypeId] [varchar](18) NOT NULL,
	[SalesTax] [decimal](32, 16) NULL,
	[Segment] [varchar](100) NOT NULL,
	[SegmentFormula] [varchar](max) NOT NULL,
	[ServiceNotes] [nvarchar](max) NOT NULL,
	[ServiceTeam] [varchar](255) NOT NULL,
	[ServiceTeamAddress] [varchar](255) NOT NULL,
	[ServiceTeamCity] [varchar](255) NOT NULL,
	[ServiceTeamState] [varchar](255) NOT NULL,
	[ServiceTeamZip] [varchar](255) NOT NULL,
	[ServiceTeamLegalName] [varchar](100) NOT NULL,
	[SlInvoiceDate] [datetime2](7) NULL,
	[SlInvoiceId] [varchar](30) NOT NULL,
	[SlStatus] [varchar](1) NOT NULL,
	[SpWorkPerformed] [varchar](max) NOT NULL,
	[StartDateAndTime] [datetime2](7) NULL,
	[Status] [varchar](255) NOT NULL,
	[SubTotal] [decimal](32, 16) NULL,
	[Supercenter] [varchar](100) NOT NULL,
	[SupercenterFormula] [varchar](max) NOT NULL,
	[SystemModstamp] [datetime2](7) NULL,
	[TaxAdded] [decimal](32, 16) NULL,
	[TotalTax] [decimal](32, 16) NULL,
	[Voucher] [tinyint] NULL,
	[VoucherRollupTotal] [decimal](32, 16) NULL,
	[WorkOrderLaborTotal] [decimal](32, 16) NULL,
	[WorkOrderType] [varchar](max) NOT NULL,
	[WorkOrderPartsTotal] [decimal](32, 16) NULL,
	[WorkOrderTfsTaxTotal] [decimal](32, 16) NULL,
	[WorkDescription] [nvarchar](max) NOT NULL,
	[WorkOrder] [varchar](18) NOT NULL,
	[WorkOrderDocumentNumber] [varchar](25) NOT NULL,
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
	FROM SF.MaterialHandlingInvoice FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.MaterialHandlingInvoice
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
	FROM SF.MaterialHandlingInvoice FOR SYSTEM_TIME ALL T 
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
		,[Account]
		,[ActivityType]
		,[AccountSlVendorId]
		,[AccountSlCustomerId]
		,[AccountUnityExternalId]
		,[AccountFieldOfficeSlCustomerId]
		,[AccountFieldOfficeSlVendorId]
		,[AccountFieldOfficeUnityExternalId]
		,[AccountTerms]
		,[CallType]
		,[Certificate]
		,[Company]
		,[ConsumedFromLocation]
		,[Contact]
		,[ContactUnityExternalId]
		,[CreatedDate]
		,[CreatedById]
		,[CustomerPo]
		,[DateInvoiced]
		,[EndDateAndTime]
		,[FieldOffice]
		,[HideLine]
		,[Id]
		,[InvoiceDetailsCost]
		,[InvoiceDetailsRevenue]
		,[InvoiceDetailsSubTotal]
		,[InvoiceMargin]
		,[InvoiceTerms]
		,[InvoiceSalesTaxRollup]
		,[InvoiceTotal]
		,[InvoiceTotalFormula]
		,[InvoiceTotalRollup]
		,[InvoiceTotalRollup1]
		,[IsDeleted]
		,[LaborTime]
		,[LastActivityDate]
		,[LastViewedDate]
		,[LastModifiedById]
		,[LastModifiedDate]
		,[Location]
		,[LocationAddress]
		,[LocationCity]
		,[LocationState]
		,[LocationZip]
		,[Name]
		,[OwnerId]
		,[PostToPeriod]
		,[RecommendedService]
		,[RecordTypeId]
		,[SalesTax]
		,[Segment]
		,[SegmentFormula]
		,[ServiceNotes]
		,[ServiceTeam]
		,[ServiceTeamAddress]
		,[ServiceTeamCity]
		,[ServiceTeamState]
		,[ServiceTeamZip]
		,[ServiceTeamLegalName]
		,[SlInvoiceDate]
		,[SlInvoiceId]
		,[SlStatus]
		,[SpWorkPerformed]
		,[StartDateAndTime]
		,[Status]
		,[SubTotal]
		,[Supercenter]
		,[SupercenterFormula]
		,[SystemModstamp]
		,[TaxAdded]
		,[TotalTax]
		,[Voucher]
		,[VoucherRollupTotal]
		,[WorkOrderLaborTotal]
		,[WorkOrderType]
		,[WorkOrderPartsTotal]
		,[WorkOrderTfsTaxTotal]
		,[WorkDescription]
		,[WorkOrder]
		,[WorkOrderDocumentNumber]
		,[LastUpdate]
		,[ImportDate]
		,[ValidFrom]
		,[ValidTo]
		FROM SF.MaterialHandlingInvoice
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Account]
			,[ActivityType]
			,[AccountSlVendorId]
			,[AccountSlCustomerId]
			,[AccountUnityExternalId]
			,[AccountFieldOfficeSlCustomerId]
			,[AccountFieldOfficeSlVendorId]
			,[AccountFieldOfficeUnityExternalId]
			,[AccountTerms]
			,[CallType]
			,[Certificate]
			,[Company]
			,[ConsumedFromLocation]
			,[Contact]
			,[ContactUnityExternalId]
			,[CreatedDate]
			,[CreatedById]
			,[CustomerPo]
			,[DateInvoiced]
			,[EndDateAndTime]
			,[FieldOffice]
			,[HideLine]
			,[Id]
			,[InvoiceDetailsCost]
			,[InvoiceDetailsRevenue]
			,[InvoiceDetailsSubTotal]
			,[InvoiceMargin]
			,[InvoiceTerms]
			,[InvoiceSalesTaxRollup]
			,[InvoiceTotal]
			,[InvoiceTotalFormula]
			,[InvoiceTotalRollup]
			,[InvoiceTotalRollup1]
			,[IsDeleted]
			,[LaborTime]
			,[LastActivityDate]
			,[LastViewedDate]
			,[LastModifiedById]
			,[LastModifiedDate]
			,[Location]
			,[LocationAddress]
			,[LocationCity]
			,[LocationState]
			,[LocationZip]
			,[Name]
			,[OwnerId]
			,[PostToPeriod]
			,[RecommendedService]
			,[RecordTypeId]
			,[SalesTax]
			,[Segment]
			,[SegmentFormula]
			,[ServiceNotes]
			,[ServiceTeam]
			,[ServiceTeamAddress]
			,[ServiceTeamCity]
			,[ServiceTeamState]
			,[ServiceTeamZip]
			,[ServiceTeamLegalName]
			,[SlInvoiceDate]
			,[SlInvoiceId]
			,[SlStatus]
			,[SpWorkPerformed]
			,[StartDateAndTime]
			,[Status]
			,[SubTotal]
			,[Supercenter]
			,[SupercenterFormula]
			,[SystemModstamp]
			,[TaxAdded]
			,[TotalTax]
			,[Voucher]
			,[VoucherRollupTotal]
			,[WorkOrderLaborTotal]
			,[WorkOrderType]
			,[WorkOrderPartsTotal]
			,[WorkOrderTfsTaxTotal]
			,[WorkDescription]
			,[WorkOrder]
			,[WorkOrderDocumentNumber]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
			,__Operation
			,__OperationDate
		)
	SELECT DISTINCT
		 T2.RowId
		,[Account]
		,[ActivityType]
		,[AccountSlVendorId]
		,[AccountSlCustomerId]
		,[AccountUnityExternalId]
		,[AccountFieldOfficeSlCustomerId]
		,[AccountFieldOfficeSlVendorId]
		,[AccountFieldOfficeUnityExternalId]
		,[AccountTerms]
		,[CallType]
		,[Certificate]
		,[Company]
		,[ConsumedFromLocation]
		,[Contact]
		,[ContactUnityExternalId]
		,[CreatedDate]
		,[CreatedById]
		,[CustomerPo]
		,[DateInvoiced]
		,[EndDateAndTime]
		,[FieldOffice]
		,[HideLine]
		,[Id]
		,[InvoiceDetailsCost]
		,[InvoiceDetailsRevenue]
		,[InvoiceDetailsSubTotal]
		,[InvoiceMargin]
		,[InvoiceTerms]
		,[InvoiceSalesTaxRollup]
		,[InvoiceTotal]
		,[InvoiceTotalFormula]
		,[InvoiceTotalRollup]
		,[InvoiceTotalRollup1]
		,[IsDeleted]
		,[LaborTime]
		,[LastActivityDate]
		,[LastViewedDate]
		,[LastModifiedById]
		,[LastModifiedDate]
		,[Location]
		,[LocationAddress]
		,[LocationCity]
		,[LocationState]
		,[LocationZip]
		,[Name]
		,[OwnerId]
		,[PostToPeriod]
		,[RecommendedService]
		,[RecordTypeId]
		,[SalesTax]
		,[Segment]
		,[SegmentFormula]
		,[ServiceNotes]
		,[ServiceTeam]
		,[ServiceTeamAddress]
		,[ServiceTeamCity]
		,[ServiceTeamState]
		,[ServiceTeamZip]
		,[ServiceTeamLegalName]
		,[SlInvoiceDate]
		,[SlInvoiceId]
		,[SlStatus]
		,[SpWorkPerformed]
		,[StartDateAndTime]
		,[Status]
		,[SubTotal]
		,[Supercenter]
		,[SupercenterFormula]
		,[SystemModstamp]
		,[TaxAdded]
		,[TotalTax]
		,[Voucher]
		,[VoucherRollupTotal]
		,[WorkOrderLaborTotal]
		,[WorkOrderType]
		,[WorkOrderPartsTotal]
		,[WorkOrderTfsTaxTotal]
		,[WorkDescription]
		,[WorkOrder]
		,[WorkOrderDocumentNumber]
		,[LastUpdate]
		,[ImportDate]
		,[ValidFrom]
		,[ValidTo]
		,T2.Operation
		,T2.OperationDate
	FROM BaseTableActivity T
		INNER JOIN @InsertUpdateDeleteTable T2 ON T2.RowId = T.RowId AND ((T2.Operation = 'I' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'U' AND T2.OperationDate = T.ValidFrom) OR (T2.Operation = 'D' AND T2.OperationDate = T.ValidTo))
	WHERE T2.OperationDate BETWEEN @StartDateUtc AND @EndDateUtc

	RETURN 
END