-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxSiteIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxSiteIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxSite;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__Site__c;

	IF (@OdsRowCount > @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxSite', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxSite
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSVMXC__Site__c
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
		   ,T.Account
		   ,T.City
		   ,T.Costedatvalue
		   ,T.Country
		   ,T.Email
		   ,T.InventoryAccount
		   ,T.IsPartnerRecord
		   ,T.IsPartner
		   ,ROUND(T.Latitude, 7)			AS Latitude
		   ,ROUND(T.Longitude, 7)			AS Longitude
		   ,T.PartnerAccount
		   ,T.PartnerContact
		   ,T.ServiceEngineer
		   ,T.SiteFax
		   ,T.SitePhone
		   ,T.State
		   ,T.StockingLocation
		   ,T.Street
		   ,T.Website
		   ,T.Zip
		   ,T.IsDefaultDelivery
		   ,T.IsDeliveryLocation
		   ,T.IsGoodStock
		   ,T.IsReceivingLocation
		   ,T.IsRepairLocation
		   ,T.IsStagingLocation
		   ,T.LocationType
		   ,T.Parent
		   ,T.[MassSlLocationId]
		   ,T.Contact
		   ,T.LocationEstablished
		   ,ROUND(T.LaborPMRateDDM, 4)		AS LaborPMRateDDM
		   ,ROUND(T.LaborPMRateMHE, 4)		AS LaborPMRateMHE
		   ,T.MergerAcquisition
		   ,T.BusinessUnit
		   ,T.Priority
		   ,ROUND(T.OpenWorkOrders, 4)		AS OpenWorkOrders
		   ,T.TerritoryId
		   ,ROUND(T.TravelTime, 4)			AS TravelTime
		   ,T.Organization
		   ,T.Ar
		   ,ROUND(T.NteThreshold, 4)		AS NteThreshold
		   ,T.SuperCenter
		   ,T.Segment
		   ,ROUND(T.LaborRateStandard, 4)	AS LaborRateStandard
		   ,ROUND(T.LaborRatePremium, 4)	AS LaborRatePremium
		   ,ROUND(T.LaborRateTwoMan, 4)		AS LaborRateTwoMan
		   ,T.CustomerPo
		   ,T.Contact2
		   ,T.Contact3
		   ,T.Contact4
		   ,T.SiteMobile
		   ,ROUND(T.LaborStandardDDM, 4)	AS LaborStandardDDM
		   ,ROUND(T.LaborStandardMHE, 4)	AS LaborStandardMHE
		   ,ROUND(T.Labor2ManDDM, 4)		AS Labor2ManDDM
		   ,ROUND(T.Labor2ManMHE, 4)		AS Labor2ManMHE
		   ,ROUND(T.LaborOTDDMDDM, 4)		AS LaborOTDDMDDM
		   ,ROUND(T.LaborOTMHEMHE, 4)		AS LaborOTMHEMHE
		   ,ROUND(T.LaborDTDDMDDM, 4)		AS LaborDTDDMDDM
		   ,ROUND(T.LaborDTMHEMHE, 4)		LaborDTMHEMHE
		   ,T.CopyAddress
		   ,T.BillingCity
		   ,T.BillingStateProvince
		   ,T.BillingZipPostalCode
		   ,T.BillingStreet
		   ,T.CallType
		   ,T.AccountCreditHold
		   ,T.Chain
		   ,T.LocationSalesPerson
		   ,T.Company
		   ,T.Salesperson
		   ,T.DownloadToMobile
		   ,T.SiteContact
		   ,T.SalesPersons
		   ,T.DocumentNumberLoc
		   ,T.SalesPerson2ndLoc
		   ,ROUND(T.PmFrequencyMeter, 4)	AS PmFrequencyMeter
		   ,T.PmFrequencyTime
		   ,T.AssetManagementBillingDate
		   ,ROUND(T.AssetManagementFees, 4) AS AssetManagementFees
		   ,T.StaticDocumentNumber
		   ,T.InvoiceDocumentDate
		   ,ROUND(T.Retainage, 4)			AS Retainage
		   ,T.InvoiceDueDate
		   ,T.RequiresDepartmentRecord
		   ,T.DrawDate
		   ,ROUND(T.CongaTemplate, 4)		AS CongaTemplate
		   ,T.CongaCase
		   ,T.PreferredBusinessHours
		   ,ROUND(T.RecurringRentalFees, 4) AS RecurringRentalFees
		   ,T.CongaPostToPeriod
		   ,T.CongaTFSInvoiceQueryStringField
		   ,T.CongaTFSInvoiceQueryStringField1
		   ,T.CongaTFSInvoiceQueryStringField2
		   ,T.Conga1P2P
		   ,T.CongaMonth
		   ,ROUND(T.LocationCount, 4)		AS LocationCount
		   ,T.LastUpdate
		FROM ODS.SF.vwServiceMaxSite T
			INNER JOIN CommonRows	 T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18))		AS Id
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
		   ,T.Account
		   ,T.City
		   ,T.CostedAtValue
		   ,T.Country
		   ,T.Email
		   ,T.InventoryAccount
		   ,T.IsPartnerRecord
		   ,T.IsPartner
		   ,ROUND(T.Latitude, 7)			AS Latitude
		   ,ROUND(T.Longitude, 7)			AS Longitude
		   ,T.PartnerAccount
		   ,T.PartnerContact
		   ,T.ServiceEngineer
		   ,T.SiteFax
		   ,T.SitePhone
		   ,T.State
		   ,T.StockingLocation
		   ,T.Street
		   ,T.Website
		   ,T.Zip
		   ,T.IsDefaultDelivery
		   ,T.IsDeliveryLocation
		   ,T.IsGoodStock
		   ,T.IsReceivingLocation
		   ,T.IsRepairLocation
		   ,T.IsStagingLocation
		   ,T.LocationType
		   ,T.Parent
		   ,T.[MassSLLocationId]
		   ,T.Contact
		   ,T.LocationEstablished
		   ,ROUND(T.LaborPMRateDDM, 4)		AS LaborPMRateDDM
		   ,ROUND(T.LaborPMRateMHE, 4)		AS LaborPMRateMHE
		   ,T.MergerAcquisition
		   ,T.BusinessUnit
		   ,T.Priority
		   ,ROUND(T.OpenWorkOrders, 4)		AS OpenWorkOrders
		   ,T.TerritoryId
		   ,ROUND(T.TravelTime, 4)			AS TravelTime
		   ,T.Organization
		   ,T.Ar
		   ,ROUND(T.NteThreshold, 4)		AS NteThreshold
		   ,T.SuperCenter
		   ,T.Segment
		   ,ROUND(T.LaborRateStandard, 4)	AS LaborRateStandard
		   ,ROUND(T.LaborRatePremium, 4)	AS LaborRatePremium
		   ,ROUND(T.LaborRateTwoMan, 4)		AS LaborRateTwoMan
		   ,T.CustomerPO
		   ,T.Contact2
		   ,T.Contact3
		   ,T.Contact4
		   ,T.SiteMobile
		   ,ROUND(T.LaborStandardDDM, 4)	AS LaborStandardDDM
		   ,ROUND(T.LaborStandardMHE, 4)	AS LaborStandardMHE
		   ,ROUND(T.Labor2ManDDM, 4)		AS Labor2ManDDM
		   ,ROUND(T.Labor2ManMHE, 4)		AS Labor2ManMHE
		   ,ROUND(T.LaborOTDDMDDM, 4)		AS LaborOTDDMDDM
		   ,ROUND(T.LaborOTMHEMHE, 4)		AS LaborOTMHEMHE
		   ,ROUND(T.LaborDTDDMDDM, 4)		AS LaborDTDDMDDM
		   ,ROUND(T.LaborDTMHEMHE, 4)		LaborDTMHEMHE
		   ,T.CopyAddress
		   ,T.BillingCity
		   ,T.BillingStateProvince
		   ,T.BillingZipPostalCode
		   ,T.BillingStreet
		   ,T.CallType
		   ,T.AccountCreditHold
		   ,T.Chain
		   ,T.LocationSalesPerson
		   ,T.Company
		   ,T.Salesperson
		   ,T.DownloadToMobile
		   ,T.SiteContact
		   ,T.SalesPersons
		   ,T.DocumentNumberLoc
		   ,T.Salesperson2ndLoc
		   ,ROUND(T.PmFrequencyMeter, 4)	AS PmFrequencyMeter
		   ,T.PmFrequencyTime
		   ,T.AssetManagementBillingDate
		   ,ROUND(T.AssetManagementFees, 4) AS AssetManagementFees
		   ,T.StaticDocumentNumber
		   ,T.InvoiceDocumentDate
		   ,ROUND(T.Retainage, 4)			AS Retainage
		   ,T.InvoiceDueDate
		   ,T.RequiresDepartmentRecord
		   ,T.DrawDate
		   ,ROUND(T.CongaTemplate, 4)		AS CongaTemplate
		   ,T.CongaCase
		   ,T.PreferredBusinessHours
		   ,ROUND(T.RecurringRentalFees, 4) AS RecurringRentalFees
		   ,T.CongaPostToPeriod
		   ,T.CongaTFSInvoiceQueryStringField
		   ,T.CongaTFSInvoiceQueryStringField1
		   ,T.CongaTFSInvoiceQueryStringField2
		   ,T.Conga1P2P
		   ,T.CongaMonth
		   ,ROUND(T.LocationCount, 4)		AS LocationCount
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__Site__c T
			INNER JOIN CommonRows			T2 ON T2.Id = T.Id
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
	FROM RowDifferences							  T
		INNER JOIN ODSStaging.SF.vwSVMXC__Site__c T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxSite', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__Site__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;