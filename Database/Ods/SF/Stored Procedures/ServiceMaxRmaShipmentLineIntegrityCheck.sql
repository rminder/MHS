
-- ===================================================
-- Author:		Randy Minder
-- Create date: 29-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxRmaShipmentLineIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxRmaShipmentLineIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxRmaShipmentLine;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__RMA_Shipment_Line__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxRmaShipmentLine', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxRmaShipmentLine
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSVMXC__RMA_Shipment_Line__c
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Id]
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   --      ,T.CreatedDate
		   ,T.CreatedById
		   --      ,T.LastModifiedDate
		   ,T.LastModifiedById
		   --      ,T.SystemModstamp
		   ,T.RmaShipmentOrder
		   ,ROUND(CAST(T.ActualQuantity2 AS FLOAT), 3)						 AS ActualQuantity
		   ,T.ActualReceiptDate
		   ,T.ActualShipDate
		   ,T.CanceledBy
		   ,T.CanceledOn
		   ,T.ClosedBy
		   ,T.ClosedOn
		   ,ROUND(CAST(T.DiscountPercentage AS FLOAT), 3)					 AS DiscountPercentage
		   ,T.DispositionInstructions
		   ,T.Disposition
		   ,T.ExpectedCondition
		   ,ROUND(CAST(T.ExpectedQuantity2 AS FLOAT), 3)					 AS ExpectedQuantity2
		   ,T.ExpectedReceiptDate
		   ,T.ExpectedShipDate
		   ,ROUND(CAST(T.LinePrice2 AS FLOAT), 3)							 AS LinePrice2
		   ,T.LineStatus
		   ,T.LineType
		   ,T.PackingInstructions
		   ,T.PartsRequestLine
		   ,T.PostedToInventory
		   ,T.Product
		   ,T.ReturnedCondition
		   ,T.SalesOrderNumber
		   ,T.[Select]
		   ,T.SerialNumber
		   ,T.ServiceEngineer
		   ,T.ServiceOrderLine
		   ,T.ShipLocation
		   ,ROUND(CAST(T.TotalLinePrice2 AS FLOAT), 3)						 AS TotalLinePrice2
		   ,T.UsePriceFromPricebook
		   ,T.Warehouse
		   ,T.CaseLine
		   ,T.DeliveredBy
		   ,T.DeliveredOn
		   ,T.Delivered
		   ,T.DeliveryLocation
		   ,T.MasterOrderLine
		   ,T.PickedBy
		   ,T.PickedOn
		   ,ROUND(CAST(T.PickedQuantity AS FLOAT), 3)						 AS PickedQuantity
		   ,T.Picked
		   ,T.ReceivedBy
		   ,T.ReceivedOn
		   ,T.Received
		   ,T.ReconciliationAction
		   ,T.RouteCard
		   ,T.RouteStop
		   ,T.SerialNumber_List
		   ,T.ServiceOrder
		   ,T.ShippedBy
		   ,T.ShippedOn
		   ,T.Shipped
		   ,T.WorkOrderCreated
		   ,T.EntitlementStatus
		   ,ROUND(CAST(T.FulfillmentQuantity AS FLOAT), 3)					 AS FulfillmentQuantity
		   ,T.ServiceContractEndDate
		   ,T.ServiceContractStartDate
		   ,T.WarrantyEndDate
		   ,T.WarrantyStartDate
		   ,T.EntitledExchangeType
		   ,ROUND(CAST(T.StandardCost AS FLOAT), 3)						 AS StandardCost
		   ,ROUND(CAST(T.MaterialHandlingTotalVendorLinePrice AS FLOAT), 3) AS MaterialHandlingTotalVendorLinePrice
		   ,T.ProductName
		   ,ROUND(CAST(T.VendorPrice AS FLOAT), 3)							 AS VendorPrice
		   ,ROUND(CAST(T.TotalStandardLinePrice AS FLOAT), 3)				 AS TotalStandardLinePrice
		   ,T.PartNumber
		   ,T.ShipVia
		   ,T.CrossReferenceDescription
		   ,T.CrossReferencePart
		   ,T.ProductCrossReference
		   ,T.OrderType
		   ,T.ToLocationSupercenter
		   ,T.ToLocationSegment
		   ,T.SLVendorId
		   ,T.CompanyId
		   ,T.PartOrderName
		   ,T.ProductCodePd
		   ,T.TransactionResults
		   ,T.Description
		--      ,T.LastUpdate
		FROM ODS.SF.vwServiceMaxRmaShipmentLine T
			INNER JOIN CommonRows				T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			T.[Id]
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   --      ,T.CreatedDate
		   ,T.CreatedById
		   --      ,T.LastModifiedDate
		   ,T.LastModifiedById
		   --      ,T.SystemModstamp
		   ,T.RmaShipmentOrder
		   ,ROUND(T.ActualQuantity2, 3)						 AS ActualQuantity
		   ,T.ActualReceiptDate
		   ,T.ActualShipDate
		   ,T.CanceledBy
		   ,T.CanceledOn
		   ,T.ClosedBy
		   ,T.ClosedOn
		   ,ROUND(T.DiscountPercentage, 3)					 AS DiscountPercentage
		   ,T.DispositionInstructions
		   ,T.Disposition
		   ,T.ExpectedCondition
		   ,ROUND(T.ExpectedQuantity2, 3)					 AS ExpectedQuantity2
		   ,T.ExpectedReceiptDate
		   ,T.ExpectedShipDate
		   ,ROUND(T.LinePrice2, 3)							 AS LinePrice2
		   ,T.LineStatus
		   ,T.LineType
		   ,T.PackingInstructions
		   ,T.PartsRequestLine
		   ,T.PostedToInventory
		   ,T.Product
		   ,T.ReturnedCondition
		   ,T.SalesOrderNumber
		   ,T.[Select]
		   ,T.SerialNumber
		   ,T.ServiceEngineer
		   ,T.ServiceOrderLine
		   ,T.ShipLocation
		   ,ROUND(T.TotalLinePrice2, 3)						 AS TotalLinePrice2
		   ,T.UsePriceFromPricebook
		   ,T.Warehouse
		   ,T.CaseLine
		   ,T.DeliveredBy
		   ,T.DeliveredOn
		   ,T.Delivered
		   ,T.DeliveryLocation
		   ,T.MasterOrderLine
		   ,T.PickedBy
		   ,T.PickedOn
		   ,ROUND(T.PickedQuantity, 3)						 AS PickedQuantity
		   ,T.Picked
		   ,T.ReceivedBy
		   ,T.ReceivedOn
		   ,T.Received
		   ,T.ReconciliationAction
		   ,T.RouteCard
		   ,T.RouteStop
		   ,T.SerialNumber_List
		   ,T.ServiceOrder
		   ,T.ShippedBy
		   ,T.ShippedOn
		   ,T.Shipped
		   ,T.WorkOrderCreated
		   ,T.EntitlementStatus
		   ,ROUND(T.FulfillmentQuantity, 3)					 AS FulfillmentQuantity
		   ,T.ServiceContractEndDate
		   ,T.ServiceContractStartDate
		   ,T.WarrantyEndDate
		   ,T.WarrantyStartDate
		   ,T.EntitledExchangeType
		   ,ROUND(T.StandardCost, 3)						 AS StandardCost
		   ,ROUND(T.MaterialHandlingTotalVendorLinePrice, 3) AS MaterialHandlingTotalVendorLinePrice
		   ,T.ProductName
		   ,ROUND(T.VendorPrice, 3)							 AS VendorPrice
		   ,ROUND(T.TotalStandardLinePrice, 3)				 AS TotalStandardLinePrice
		   ,T.PartNumber
		   ,T.ShipVia
		   ,T.CrossReferenceDescription
		   ,T.CrossReferencePart
		   ,T.ProductCrossReference
		   ,T.OrderType
		   ,T.ToLocationSupercenter
		   ,T.ToLocationSegment
		   ,T.SLVendorId
		   ,T.CompanyId
		   ,T.PartOrderName
		   ,T.ProductCodePd
		   ,T.TransactionResults
		   ,T.Description
		--      ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__RMA_Shipment_Line__c T
			INNER JOIN CommonRows						 T2 ON T2.Id = T.Id
	)

	-- Store any differences into a temporary table. Note, we only want to store differences where the SF last modified date
	-- is <= the Ods last modified date. These are rows that were updated in SF without the last modified date being changed.
	-- Rows where the SF last modifed date is > the Ods last modified date are simply rows that haven't been updated to Ods
	-- yet.
	SELECT
		T.Id
	   ,T2.LastModifiedDate AS SfLastModifiedDate
	   ,T3.LastModifiedDate AS OdsLastModifiedDate
	INTO #TempTable
	FROM RowDifferences							  T
		INNER JOIN ODSStaging.SF.MH_Invoice__c	  T2 ON T.Id = T2.Id
		INNER JOIN ODS.SF.MaterialHandlingInvoice T3 ON T.Id = T3.Id
	WHERE T2.LastModifiedDate <= T3.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxRmaShipmentLine', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__RMA_Shipment_Line__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;