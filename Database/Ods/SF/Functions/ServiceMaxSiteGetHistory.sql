-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 29-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[ServiceMaxSiteGetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[ServiceMaxSiteGetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [varchar](18) NOT NULL,
	[OwnerId] [varchar](18) NULL,
	[IsDeleted] [tinyint] NULL,
	[Name] [varchar](80) NOT NULL,
	[RecordTypeId] [varchar](18) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [varchar](18) NOT NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedById] [varchar](18) NOT NULL,
	[SystemModstamp] [datetime] NULL,
	[LastActivityDate] [datetime] NULL,
	[LastViewedDate] [datetime] NULL,
	[LastReferencedDate] [datetime] NULL,
	[Account] [varchar](18) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Costedatvalue] [tinyint] NULL,
	[Country] [varchar](255) NOT NULL,
	[Email] [varchar](80) NOT NULL,
	[InventoryAccount] [varchar](30) NOT NULL,
	[IsPartnerRecord] [tinyint] NULL,
	[IsPartner] [varchar](max) NOT NULL,
	[Latitude] [decimal](32, 16) NULL,
	[Longitude] [decimal](32, 16) NULL,
	[PartnerAccount] [varchar](18) NOT NULL,
	[PartnerContact] [varchar](18) NOT NULL,
	[ServiceEngineer] [varchar](18) NOT NULL,
	[SiteFax] [varchar](40) NOT NULL,
	[SitePhone] [varchar](40) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[StockingLocation] [tinyint] NULL,
	[Street] [varchar](255) NOT NULL,
	[Website] [varchar](255) NOT NULL,
	[Zip] [varchar](100) NOT NULL,
	[IsDefaultDelivery] [tinyint] NULL,
	[IsDeliveryLocation] [tinyint] NULL,
	[IsGoodStock] [tinyint] NULL,
	[IsReceivingLocation] [tinyint] NULL,
	[IsRepairLocation] [tinyint] NULL,
	[IsStagingLocation] [tinyint] NULL,
	[LocationType] [varchar](255) NOT NULL,
	[Parent] [varchar](18) NOT NULL,
	[MassSlLocationId] [varchar](15) NOT NULL,
	[Contact] [varchar](18) NOT NULL,
	[LocationEstablished] [datetime] NULL,
	[LaborPMRateDDM] [decimal](32, 16) NULL,
	[LaborPMRateMHE] [decimal](32, 16) NULL,
	[MergerAcquisition] [varchar](255) NOT NULL,
	[BusinessUnit] [varchar](255) NOT NULL,
	[Priority] [varchar](255) NOT NULL,
	[OpenWorkOrders] [decimal](32, 16) NULL,
	[TerritoryId] [varchar](255) NOT NULL,
	[TravelTime] [decimal](32, 16) NULL,
	[Organization] [varchar](255) NOT NULL,
	[Ar] [varchar](max) NOT NULL,
	[NteThreshold] [decimal](32, 16) NULL,
	[SuperCenter] [varchar](255) NOT NULL,
	[Segment] [varchar](255) NOT NULL,
	[LaborRateStandard] [decimal](32, 16) NULL,
	[LaborRatePremium] [decimal](32, 16) NULL,
	[LaborRateTwoMan] [decimal](32, 16) NULL,
	[CustomerPo] [varchar](18) NOT NULL,
	[Contact2] [varchar](18) NOT NULL,
	[Contact3] [varchar](18) NOT NULL,
	[Contact4] [varchar](18) NOT NULL,
	[SiteMobile] [varchar](40) NOT NULL,
	[LaborStandardDDM] [decimal](32, 16) NULL,
	[LaborStandardMHE] [decimal](32, 16) NULL,
	[Labor2ManDDM] [decimal](32, 16) NULL,
	[Labor2ManMHE] [decimal](32, 16) NULL,
	[LaborOTDDMDDM] [decimal](32, 16) NULL,
	[LaborOTMHEMHE] [decimal](32, 16) NULL,
	[LaborDTDDMDDM] [decimal](32, 16) NULL,
	[LaborDTMHEMHE] [decimal](32, 16) NULL,
	[CopyAddress] [tinyint] NULL,
	[BillingCity] [varchar](100) NOT NULL,
	[BillingStateProvince] [varchar](100) NOT NULL,
	[BillingZipPostalCode] [varchar](100) NOT NULL,
	[BillingStreet] [varchar](255) NOT NULL,
	[CallType] [varchar](255) NOT NULL,
	[AccountCreditHold] [tinyint] NULL,
	[TESTDATADONOTUSE] [tinyint] NULL,
	[Chain] [varchar](100) NOT NULL,
	[LocationSalesPerson] [varchar](18) NOT NULL,
	[Company] [varchar](10) NOT NULL,
	[Salesperson] [varchar](18) NOT NULL,
	[DownloadToMobile] [tinyint] NULL,
	[SiteContact] [varchar](150) NOT NULL,
	[SalesPersons] [varchar](18) NOT NULL,
	[DocumentNumberLoc] [varchar](max) NOT NULL,
	[SalesPerson2ndLoc] [varchar](18) NOT NULL,
	[PmFrequencyMeter] [decimal](32, 16) NULL,
	[PmFrequencyTime] [varchar](5) NOT NULL,
	[AssetManagementBillingDate] [tinyint] NULL,
	[AssetManagementFees] [decimal](32, 16) NULL,
	[StaticDocumentNumber] [varchar](20) NOT NULL,
	[InvoiceDocumentDate] [datetime] NULL,
	[Retainage] [decimal](32, 16) NULL,
	[InvoiceDueDate] [datetime] NULL,
	[RequiresDepartmentRecord] [tinyint] NULL,
	[DrawDate] [varchar](4) NOT NULL,
	[CongaTemplate] [decimal](32, 16) NULL,
	[CongaCase] [varchar](max) NOT NULL,
	[PreferredBusinessHours] [varchar](18) NOT NULL,
	[RecurringRentalFees] [decimal](32, 16) NULL,
	[CongaPostToPeriod] [varchar](max) NOT NULL,
	[CongaTFSInvoiceQueryStringField] [varchar](max) NOT NULL,
	[CongaTFSInvoiceQueryStringField1] [varchar](max) NOT NULL,
	[CongaTFSInvoiceQueryStringField2] [varchar](max) NOT NULL,
	[Conga1P2P] [varchar](7) NOT NULL,
	[CongaMonth] [varchar](50) NOT NULL,
	[LocationCount] [decimal](32, 16) NULL,
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
	FROM SF.ServiceMaxSite FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.ServiceMaxSite
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
	FROM SF.ServiceMaxSite FOR SYSTEM_TIME ALL T 
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
			,[Account]
			,[City]
			,[Costedatvalue]
			,[Country]
			,[Email]
			,[InventoryAccount]
			,[IsPartnerRecord]
			,[IsPartner]
			,[Latitude]
			,[Longitude]
			,[PartnerAccount]
			,[PartnerContact]
			,[ServiceEngineer]
			,[SiteFax]
			,[SitePhone]
			,[State]
			,[StockingLocation]
			,[Street]
			,[Website]
			,[Zip]
			,[IsDefaultDelivery]
			,[IsDeliveryLocation]
			,[IsGoodStock]
			,[IsReceivingLocation]
			,[IsRepairLocation]
			,[IsStagingLocation]
			,[LocationType]
			,[Parent]
			,[MassSlLocationId]
			,[Contact]
			,[LocationEstablished]
			,[LaborPMRateDDM]
			,[LaborPMRateMHE]
			,[MergerAcquisition]
			,[BusinessUnit]
			,[Priority]
			,[OpenWorkOrders]
			,[TerritoryId]
			,[TravelTime]
			,[Organization]
			,[Ar]
			,[NteThreshold]
			,[SuperCenter]
			,[Segment]
			,[LaborRateStandard]
			,[LaborRatePremium]
			,[LaborRateTwoMan]
			,[CustomerPo]
			,[Contact2]
			,[Contact3]
			,[Contact4]
			,[SiteMobile]
			,[LaborStandardDDM]
			,[LaborStandardMHE]
			,[Labor2ManDDM]
			,[Labor2ManMHE]
			,[LaborOTDDMDDM]
			,[LaborOTMHEMHE]
			,[LaborDTDDMDDM]
			,[LaborDTMHEMHE]
			,[CopyAddress]
			,[BillingCity]
			,[BillingStateProvince]
			,[BillingZipPostalCode]
			,[BillingStreet]
			,[CallType]
			,[AccountCreditHold]
			,[TESTDATADONOTUSE]
			,[Chain]
			,[LocationSalesPerson]
			,[Company]
			,[Salesperson]
			,[DownloadToMobile]
			,[SiteContact]
			,[SalesPersons]
			,[DocumentNumberLoc]
			,[SalesPerson2ndLoc]
			,[PmFrequencyMeter]
			,[PmFrequencyTime]
			,[AssetManagementBillingDate]
			,[AssetManagementFees]
			,[StaticDocumentNumber]
			,[InvoiceDocumentDate]
			,[Retainage]
			,[InvoiceDueDate]
			,[RequiresDepartmentRecord]
			,[DrawDate]
			,[CongaTemplate]
			,[CongaCase]
			,[PreferredBusinessHours]
			,[RecurringRentalFees]
			,[CongaPostToPeriod]
			,[CongaTFSInvoiceQueryStringField]
			,[CongaTFSInvoiceQueryStringField1]
			,[CongaTFSInvoiceQueryStringField2]
			,[Conga1P2P]
			,[CongaMonth]
			,[LocationCount]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.ServiceMaxSite
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
			,[Account]
			,[City]
			,[Costedatvalue]
			,[Country]
			,[Email]
			,[InventoryAccount]
			,[IsPartnerRecord]
			,[IsPartner]
			,[Latitude]
			,[Longitude]
			,[PartnerAccount]
			,[PartnerContact]
			,[ServiceEngineer]
			,[SiteFax]
			,[SitePhone]
			,[State]
			,[StockingLocation]
			,[Street]
			,[Website]
			,[Zip]
			,[IsDefaultDelivery]
			,[IsDeliveryLocation]
			,[IsGoodStock]
			,[IsReceivingLocation]
			,[IsRepairLocation]
			,[IsStagingLocation]
			,[LocationType]
			,[Parent]
			,[MassSlLocationId]
			,[Contact]
			,[LocationEstablished]
			,[LaborPMRateDDM]
			,[LaborPMRateMHE]
			,[MergerAcquisition]
			,[BusinessUnit]
			,[Priority]
			,[OpenWorkOrders]
			,[TerritoryId]
			,[TravelTime]
			,[Organization]
			,[Ar]
			,[NteThreshold]
			,[SuperCenter]
			,[Segment]
			,[LaborRateStandard]
			,[LaborRatePremium]
			,[LaborRateTwoMan]
			,[CustomerPo]
			,[Contact2]
			,[Contact3]
			,[Contact4]
			,[SiteMobile]
			,[LaborStandardDDM]
			,[LaborStandardMHE]
			,[Labor2ManDDM]
			,[Labor2ManMHE]
			,[LaborOTDDMDDM]
			,[LaborOTMHEMHE]
			,[LaborDTDDMDDM]
			,[LaborDTMHEMHE]
			,[CopyAddress]
			,[BillingCity]
			,[BillingStateProvince]
			,[BillingZipPostalCode]
			,[BillingStreet]
			,[CallType]
			,[AccountCreditHold]
			,[TESTDATADONOTUSE]
			,[Chain]
			,[LocationSalesPerson]
			,[Company]
			,[Salesperson]
			,[DownloadToMobile]
			,[SiteContact]
			,[SalesPersons]
			,[DocumentNumberLoc]
			,[SalesPerson2ndLoc]
			,[PmFrequencyMeter]
			,[PmFrequencyTime]
			,[AssetManagementBillingDate]
			,[AssetManagementFees]
			,[StaticDocumentNumber]
			,[InvoiceDocumentDate]
			,[Retainage]
			,[InvoiceDueDate]
			,[RequiresDepartmentRecord]
			,[DrawDate]
			,[CongaTemplate]
			,[CongaCase]
			,[PreferredBusinessHours]
			,[RecurringRentalFees]
			,[CongaPostToPeriod]
			,[CongaTFSInvoiceQueryStringField]
			,[CongaTFSInvoiceQueryStringField1]
			,[CongaTFSInvoiceQueryStringField2]
			,[Conga1P2P]
			,[CongaMonth]
			,[LocationCount]
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
		,[OwnerId]
		,T.IsDeleted
		,T.Name
		,T.RecordTypeId
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,[LastActivityDate]
		,T.LastViewedDate
		,T.LastReferencedDate
		,[Account]
		,[City]
		,[Costedatvalue]
		,[Country]
		,[Email]
		,[InventoryAccount]
		,[IsPartnerRecord]
		,[IsPartner]
		,[Latitude]
		,[Longitude]
		,[PartnerAccount]
		,[PartnerContact]
		,[ServiceEngineer]
		,[SiteFax]
		,[SitePhone]
		,[State]
		,[StockingLocation]
		,[Street]
		,[Website]
		,[Zip]
		,[IsDefaultDelivery]
		,[IsDeliveryLocation]
		,[IsGoodStock]
		,[IsReceivingLocation]
		,[IsRepairLocation]
		,[IsStagingLocation]
		,[LocationType]
		,[Parent]
		,[MassSlLocationId]
		,[Contact]
		,[LocationEstablished]
		,[LaborPMRateDDM]
		,[LaborPMRateMHE]
		,[MergerAcquisition]
		,[BusinessUnit]
		,[Priority]
		,[OpenWorkOrders]
		,[TerritoryId]
		,[TravelTime]
		,[Organization]
		,[Ar]
		,[NteThreshold]
		,T.Supercenter
		,T.Segment
		,[LaborRateStandard]
		,[LaborRatePremium]
		,[LaborRateTwoMan]
		,[CustomerPo]
		,[Contact2]
		,[Contact3]
		,[Contact4]
		,[SiteMobile]
		,[LaborStandardDDM]
		,[LaborStandardMHE]
		,[Labor2ManDDM]
		,[Labor2ManMHE]
		,[LaborOTDDMDDM]
		,[LaborOTMHEMHE]
		,[LaborDTDDMDDM]
		,[LaborDTMHEMHE]
		,[CopyAddress]
		,[BillingCity]
		,[BillingStateProvince]
		,[BillingZipPostalCode]
		,[BillingStreet]
		,[CallType]
		,[AccountCreditHold]
		,[TESTDATADONOTUSE]
		,[Chain]
		,[LocationSalesPerson]
		,[Company]
		,[Salesperson]
		,[DownloadToMobile]
		,[SiteContact]
		,[SalesPersons]
		,[DocumentNumberLoc]
		,[SalesPerson2ndLoc]
		,[PmFrequencyMeter]
		,[PmFrequencyTime]
		,[AssetManagementBillingDate]
		,[AssetManagementFees]
		,[StaticDocumentNumber]
		,[InvoiceDocumentDate]
		,[Retainage]
		,[InvoiceDueDate]
		,[RequiresDepartmentRecord]
		,[DrawDate]
		,[CongaTemplate]
		,[CongaCase]
		,[PreferredBusinessHours]
		,[RecurringRentalFees]
		,[CongaPostToPeriod]
		,[CongaTFSInvoiceQueryStringField]
		,[CongaTFSInvoiceQueryStringField1]
		,[CongaTFSInvoiceQueryStringField2]
		,[Conga1P2P]
		,[CongaMonth]
		,[LocationCount]
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