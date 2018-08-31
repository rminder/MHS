-- ===================================================================================
-- Author:		Randy Minder
-- Create date: 29-August, 2018
-- Description:	Get all history for the target
--		table.
--
--	Select * From [SF].[Product2GetHistory] ('8/29/2018','8/30/2018')
-- ===================================================================================
CREATE FUNCTION [SF].[Product2GetHistory]
(
	@StartDateUtc DATETIME2,
	@EndDateUtc DATETIME2	
)
RETURNS 
@ResultsTable TABLE 
(
	[RowId] BIGINT NOT NULL,
	[Id] [varchar](18) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ProductCode] [varchar](255) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[IsActive] [tinyint] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CreatedById] [varchar](18) NOT NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[LastModifiedById] [varchar](18) NOT NULL,
	[SystemModstamp] [datetime2](7) NULL,
	[Family] [varchar](40) NOT NULL,
	[RecordTypeId] [varchar](18) NOT NULL,
	[ExternalDataSourceId] [varchar](18) NOT NULL,
	[ExternalId] [varchar](255) NOT NULL,
	[DisplayUrl] [varchar](1000) NOT NULL,
	[QuantityUnitOfMeasure] [varchar](40) NOT NULL,
	[IsDeleted] [tinyint] NULL,
	[LastViewedDate] [datetime2](7) NULL,
	[LastReferencedDate] [datetime2](7) NULL,
	[ServiceMaxEnableSerializedTracking] [tinyint] NULL,
	[ServiceMaxInheritParentWarranty] [tinyint] NULL,
	[ServiceMaxProductCost] [decimal](32, 16) NULL,
	[ServiceMaxProductLine] [varchar](255) NOT NULL,
	[ServiceMaxSelect] [tinyint] NOT NULL,
	[ServiceMaxStockable] [tinyint] NULL,
	[ServiceMaxTracking] [varchar](255) NOT NULL,
	[ServiceMaxUnitOfMeasure] [varchar](255) NOT NULL,
	[ServiceMaxReplacementAvailable] [tinyint] NULL,
	[Capacity] [varchar](15) NOT NULL,
	[HighUsageProduct] [tinyint] NULL,
	[Broad] [varchar](255) NOT NULL,
	[Group] [varchar](255) NOT NULL,
	[Type] [varchar](255) NOT NULL,
	[PartSerialNumber] [varchar](18) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Make1] [varchar](255) NOT NULL,
	[UOM] [varchar](255) NOT NULL,
	[ProductId] [varchar](max) NOT NULL,
	[UnityProductExternalId] [varchar](80) NOT NULL,
	[SSVYOptimalCost] [decimal](32, 16) NULL,
	[UnityIsMenuPricing] [tinyint] NULL,
	[UnityAssetType] [varchar](255) NOT NULL,
	[UnityBumperThickness] [varchar](50) NOT NULL,
	[ServiceMaxProductType] [varchar](255) NOT NULL,
	[UnityIsStockable] [tinyint] NULL,
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
	FROM SF.Product2 FOR SYSTEM_TIME ALL
	WHERE
		(ValidFrom Between @StartDateUtc AND @EndDateUtc)		-- This gives us all rows 'born' between the start and end date
		OR (ValidTo BETWEEN @StartDateUtc AND @EndDateUtc)		-- This gives us all rows that 'died' between the start and end date

	-- Get the state of the table as of the end date, but just for the rows we're interested in
	INSERT INTO @EndDateTableState (RowId)
	SELECT T.RowId
	FROM SF.Product2
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
	FROM SF.Product2 FOR SYSTEM_TIME ALL T 
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
			,[Name]
			,[ProductCode]
			,[Description]
			,[IsActive]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[Family]
			,[RecordTypeId]
			,[ExternalDataSourceId]
			,[ExternalId]
			,[DisplayUrl]
			,[QuantityUnitOfMeasure]
			,[IsDeleted]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[ServiceMaxEnableSerializedTracking]
			,[ServiceMaxInheritParentWarranty]
			,[ServiceMaxProductCost]
			,[ServiceMaxProductLine]
			,[ServiceMaxSelect]
			,[ServiceMaxStockable]
			,[ServiceMaxTracking]
			,[ServiceMaxUnitOfMeasure]
			,[ServiceMaxReplacementAvailable]
			,[Capacity]
			,[HighUsageProduct]
			,[Broad]
			,[Group]
			,[Type]
			,[PartSerialNumber]
			,[Model]
			,[Make1]
			,[UOM]
			,[ProductId]
			,[UnityProductExternalId]
			,[SSVYOptimalCost]
			,[UnityIsMenuPricing]
			,[UnityAssetType]
			,[UnityBumperThickness]
			,[ServiceMaxProductType]
			,[UnityIsStockable]
			,[LastUpdate]
			,[ImportDate]
			,[ValidFrom]
			,[ValidTo]
		FROM SF.Product2
			FOR SYSTEM_TIME BETWEEN @StartDateUtc AND @EndDateUtc 
	)

	INSERT INTO @ResultsTable
		 (
			 [RowId]
			,[Id]
			,[Name]
			,[ProductCode]
			,[Description]
			,[IsActive]
			,[CreatedDate]
			,[CreatedById]
			,[LastModifiedDate]
			,[LastModifiedById]
			,[SystemModstamp]
			,[Family]
			,[RecordTypeId]
			,[ExternalDataSourceId]
			,[ExternalId]
			,[DisplayUrl]
			,[QuantityUnitOfMeasure]
			,[IsDeleted]
			,[LastViewedDate]
			,[LastReferencedDate]
			,[ServiceMaxEnableSerializedTracking]
			,[ServiceMaxInheritParentWarranty]
			,[ServiceMaxProductCost]
			,[ServiceMaxProductLine]
			,[ServiceMaxSelect]
			,[ServiceMaxStockable]
			,[ServiceMaxTracking]
			,[ServiceMaxUnitOfMeasure]
			,[ServiceMaxReplacementAvailable]
			,[Capacity]
			,[HighUsageProduct]
			,[Broad]
			,[Group]
			,[Type]
			,[PartSerialNumber]
			,[Model]
			,[Make1]
			,[UOM]
			,[ProductId]
			,[UnityProductExternalId]
			,[SSVYOptimalCost]
			,[UnityIsMenuPricing]
			,[UnityAssetType]
			,[UnityBumperThickness]
			,[ServiceMaxProductType]
			,[UnityIsStockable]
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
		,[Name]
		,[ProductCode]
		,[Description]
		,[IsActive]
		,T.CreatedDate
		,T.CreatedById
		,T.LastModifiedDate
		,T.LastModifiedById
		,T.SystemModstamp
		,[Family]
		,[RecordTypeId]
		,[ExternalDataSourceId]
		,[ExternalId]
		,[DisplayUrl]
		,[QuantityUnitOfMeasure]
		,T.IsDeleted
		,[LastViewedDate]
		,[LastReferencedDate]
		,[ServiceMaxEnableSerializedTracking]
		,[ServiceMaxInheritParentWarranty]
		,[ServiceMaxProductCost]
		,[ServiceMaxProductLine]
		,[ServiceMaxSelect]
		,[ServiceMaxStockable]
		,[ServiceMaxTracking]
		,[ServiceMaxUnitOfMeasure]
		,[ServiceMaxReplacementAvailable]
		,[Capacity]
		,[HighUsageProduct]
		,[Broad]
		,[Group]
		,[Type]
		,[PartSerialNumber]
		,[Model]
		,[Make1]
		,[UOM]
		,[ProductId]
		,[UnityProductExternalId]
		,[SSVYOptimalCost]
		,[UnityIsMenuPricing]
		,[UnityAssetType]
		,[UnityBumperThickness]
		,[ServiceMaxProductType]
		,[UnityIsStockable]
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