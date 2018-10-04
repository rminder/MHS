-- ===================================================
-- Author:		Randy Minder
-- Create date: 03-October, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SF].[ServiceMaxServiceGroupIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SF].[ServiceMaxServiceGroupIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SF.ServiceMaxServiceGroup;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SF.SVMXC__Service_Group__c;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceGroup', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT Id
		FROM ODS.SF.ServiceMaxServiceGroup
		INTERSECT
		SELECT Id
		FROM ODSStaging.SF.vwSVMXC__Service_Group__c
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
		   ,T.SystemModStamp
		   ,T.LastActivityDate
		   ,T.LastViewedDate
		   ,T.LastReferencedDate
		   ,T.IsActive
		   ,T.City
		   ,T.Country
		   ,T.Description
		   ,T.Email
		   ,T.GroupCode
		   ,T.GroupType
		   ,ROUND(T.Latitude, 6)  AS Latitude
		   ,ROUND(T.Longitude, 6) AS Longitude
		   ,T.Phone
		   ,T.[Select]
		   ,T.State
		   ,T.Street
		   ,T.Zip
		   ,T.SuperCenter
		   ,T.Segment
		   ,T.CompanyCode
		   ,T.Company
		   ,T.CompanyLegalName
		   ,T.OptimizerConnectionName
		   ,T.LastUpdate
		FROM ODS.SF.vwServiceMaxServiceGroup T
			INNER JOIN CommonRows			 T2 ON T2.Id = T.Id
		EXCEPT
		SELECT
			CAST(T.[Id] AS VARCHAR(18)) AS Id
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
		   ,T.IsActive
		   ,T.City
		   ,T.Country
		   ,T.Description
		   ,T.Email
		   ,T.GroupCode
		   ,T.GroupType
		   ,ROUND(T.Latitude, 6)  AS Latitude
		   ,ROUND(T.Longitude, 6) AS Longitude
		   ,T.Phone
		   ,T.[Select]
		   ,T.State
		   ,T.Street
		   ,T.Zip
		   ,T.SuperCenter
		   ,T.Segment
		   ,T.CompanyCode
		   ,T.Company
		   ,T.CompanyLegalName
		   ,T.OptimizerConnectionName
		   ,T.LastUpdate
		FROM ODSStaging.SF.vwSVMXC__Service_Group__c T
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
		INNER JOIN ODSStaging.SF.vwSVMXC__Service_Group__c T2 WITH (FORCESEEK) ON T.Id = T2.Id
	WHERE T2.LastModifiedDate <= T.LastModifiedDate;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SF-ServiceMaxServiceGroup', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

	-- Remove all the rows from staging that match, byte for byte, the rows in Ods. The rows that are left will be 
	-- updated to Ods by the SSIS data integrity package.
	DELETE FROM ODSStaging.SF.vwSVMXC__Service_Group__c
	WHERE
		Id NOT IN ( SELECT Id FROM #TempTable );

END;