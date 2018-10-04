-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxRmaShipmentOrderIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxRmaShipmentOrderIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxRmaShipmentOrder;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__RMA_Shipment_Order__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxRmaShipmentOrder', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxRmaShipmentOrder
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSVMXC__RMA_Shipment_Order__c
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
		   ,T.LastModifiedDate
		   ,T.CreatedById
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.BillTo
		   ,T.BillingType
		   ,T.CanceledBy
		   ,T.CanceledOn
		   ,T.[Case]
		   ,T.ClosedBy
		   ,T.ClosedOn
		   ,T.Company
		   ,T.Contact
		   ,T.DeliveryOption
		   ,T.DestinationCity
		   ,T.DestinationCountry
		   ,T.DestinationLocation
		   ,T.DestinationState
		   ,T.DestinationStreet
		   ,T.DestinationZip
		   ,T.EndpointUrl
		   ,T.ExpectedDeliveryDate
		   ,T.ExpectedReceiveDate
		   ,T.IsPartnerRecord
		   ,T.IsPartner
		   ,T.OrderStatus
		   ,T.PartnerAccount
		   ,T.PartnerContact
		   ,T.PartsRequest
		   ,T.Priority
		   ,T.RmaAgeBucket
		   ,T.ReceivingCourier
		   ,T.SessionId
		   ,T.SalesOrderNumber
		   ,T.ServiceEngineer
		   ,T.ServiceOrder
		   ,T.ShipmentAgeBucket
		   ,T.ShipmentReference
		   ,T.ShippingCourier
		   ,T.ShippingReceivingNotes
		   ,T.ShippingTerms
		   ,T.SourceCity
		   ,T.SourceCountry
		   ,T.SourceLocation
		   ,T.SourceState
		   ,T.SourceStreet
		   ,T.SourceZip
		   ,T.TrackingNumber
		   ,T.Warehouse
		   ,T.TotalPrice2
		   ,T.AddressType
		   ,T.OrderType
		   ,T.FulfillmentType
		   ,T.MasterOrder
		   ,T.OnHold
		   ,T.RmaType
		   ,T.Supplier
		   ,ROUND(T.NumberOfUnitsReturned, 4)	   AS NumberOfUnitsReturned
		   ,T.ShippingProvider
		   ,T.ShipVia
		   ,T.Terms
		   ,T.Buyer
		   ,T.InternalBillTo
		   ,T.PurchaseOrderNumber
		   ,T.Vendor
		   ,T.VendorContact
		   ,ROUND(T.OpenLines, 4)				   AS OpenLines
		   ,T.VendorId
		   ,ROUND(T.TotalPrice, 4)				   AS TotalPrice
		   ,ROUND(T.MaterialHandlingTotalPrice, 4) AS MaterialHandlingTotalPrice
		   ,ROUND(T.TotalVendorPrice, 4)		   AS TotalVendorPrice
		   ,ROUND(T.TotalStandardLinePrice, 4)	   AS TotalStandardLinePrice
		   ,T.OrderDate1
		   ,ROUND(T.TotalLines, 4)				   AS TotalLines
		   ,T.ReferenceNotes
		   ,T.LocationStocking
		   ,T.CompanyLegalName
		   ,T.ShipToName
		   ,T.ChangeShipToInfo
		   ,T.PurchaseOrderVendorPhone
		   ,T.PaidWithCreditCard
		   ,T.PaymentCheckDate
		   ,T.PaymentCheckNumber
		   ,T.PaymentCreditCard
		   ,T.PaymentDate
		   ,T.VendorInvoiceDate
		   ,T.VendorInvoiceNumber
		   ,T.LastUpdate
		FROM ODS.SF.vwServiceMaxRmaShipmentOrder T
			INNER JOIN CommonRows				 T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18)) AS Id
		   ,T.OwnerId
		   ,T.IsDeleted
		   ,T.Name
		   ,T.RecordTypeId
		   ,T.LastModifiedDate
		   ,T.CreatedById
		   ,T.LastModifiedById
		   ,T.SystemModstamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.BillTo
		   ,T.BillingType
		   ,T.CanceledBy
		   ,T.CanceledOn
		   ,T.[Case]
		   ,T.ClosedBy
		   ,T.ClosedOn
		   ,T.Company
		   ,T.Contact
		   ,T.DeliveryOption
		   ,T.DestinationCity
		   ,T.DestinationCountry
		   ,T.DestinationLocation
		   ,T.DestinationState
		   ,T.DestinationStreet
		   ,T.DestinationZip
		   ,T.EndpointUrl
		   ,T.ExpectedDeliveryDate
		   ,T.ExpectedReceiveDate
		   ,T.IsPartnerRecord
		   ,T.IsPartner
		   ,T.OrderStatus
		   ,T.PartnerAccount
		   ,T.PartnerContact
		   ,T.PartsRequest
		   ,T.Priority
		   ,T.RmaAgeBucket
		   ,T.ReceivingCourier
		   ,T.SessionId
		   ,T.SalesOrderNumber
		   ,T.ServiceEngineer
		   ,T.ServiceOrder
		   ,T.ShipmentAgeBucket
		   ,T.ShipmentReference
		   ,T.ShippingCourier
		   ,T.ShippingReceivingNotes
		   ,T.ShippingTerms
		   ,T.SourceCity
		   ,T.SourceCountry
		   ,T.SourceLocation
		   ,T.SourceState
		   ,T.SourceStreet
		   ,T.SourceZip
		   ,T.TrackingNumber
		   ,T.Warehouse
		   ,T.TotalPrice2
		   ,T.AddressType
		   ,T.OrderType
		   ,T.FulfillmentType
		   ,T.MasterOrder
		   ,T.OnHold
		   ,T.RmaType
		   ,T.Supplier
		   ,ROUND(T.NumberOfUnitsReturned, 4)	   AS NumberOfUnitsReturned
		   ,T.ShippingProvider
		   ,T.ShipVia
		   ,T.Terms
		   ,T.Buyer
		   ,T.InternalBillTo
		   ,T.PurchaseOrderNumber
		   ,T.Vendor
		   ,T.VendorContact
		   ,ROUND(T.OpenLines, 4)				   AS OpenLines
		   ,T.VendorId
		   ,ROUND(T.TotalPrice, 4)				   AS TotalPrice
		   ,ROUND(T.MaterialHandlingTotalPrice, 4) AS MaterialHandlingTotalPrice
		   ,ROUND(T.TotalVendorPrice, 4)		   AS TotalVendorPrice
		   ,ROUND(T.TotalStandardLinePrice, 4)	   AS TotalStandardLinePrice
		   ,T.OrderDate1
		   ,ROUND(T.TotalLines, 4)				   AS TotalLines
		   ,T.ReferenceNotes
		   ,T.LocationStocking
		   ,T.CompanyLegalName
		   ,T.ShipToName
		   ,T.ChangeShipToInfo
		   ,T.PurchaseOrderVendorPhone
		   ,T.PaidWithCreditCard
		   ,T.PaymentCheckDate
		   ,T.PaymentCheckNumber
		   ,T.PaymentCreditCard
		   ,T.PaymentDate
		   ,T.VendorInvoiceDate
		   ,T.VendorInvoiceNumber
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__RMA_Shipment_Order__c T
			INNER JOIN CommonRows						  T2 ON T2.Id = T.Id
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
		INNER JOIN ODSStaging.SF.vwSVMXC__RMA_Shipment_Order__c T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxRmaShipmentOrder', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__RMA_Shipment_Order__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;

/*
UPDATE T SET T.DestinationLocation = T2.DestinationLocation
FROM Ods.SF.vwServiceMaxRmaShipmentOrder T
INNER JOIN ODSStaging.SF.vwSVMXC__RMA_Shipment_Order__c T2 ON T2.Id = T.Id
WHERE T.DestinationLocation <> T2.DestinationLocation OR T.DestinationLocation IS NULL
*/