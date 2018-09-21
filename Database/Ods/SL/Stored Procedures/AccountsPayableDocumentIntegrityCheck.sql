-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsPayableDocumentIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsPayableDocumentIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsPayableDocument;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.APDoc;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableDocument', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			Account
		   ,SubaccountId
		   ,DocumentType
		   ,TransactionReferenceNumber
		   ,RecordId
		FROM ODS.SL.AccountsPayableDocument
		INTERSECT
		SELECT
			Account
		   ,SubaccountId
		   ,DocumentType
		   ,TransactionReferenceNumber
		   ,RecordId
		FROM ODSStaging.SL.vwAPDoc
	)
		,RowDifferences
	AS
	(
		SELECT
			T.[Account]
		   ,T.[RecordId]
		   ,T.CompanyId
		   ,T.VendorId
		   ,T.[TransactionReferenceNumber]
		   ,T.BatchNumber
		   ,T.DocumentDate
		   ,T.DueDate
		   ,T.DiscountDate
		   ,T.[DocumentType]
		   ,ROUND(T.DocumentBalance, 2)			AS DocumentBalance
		   ,ROUND(T.CurrencyDocumentBalance, 2) AS CurrencyDocumentBalance
		   ,T.[SubaccountId]
		   ,T.ProfitCenterId
		   ,T.LocationId
		   ,T.PeriodToPost
		   ,T.InvoiceNumber
		   ,T.Released
		   ,T.OpenDocument
		   ,T.LastUpdate
		FROM ODS.SL.AccountsPayableDocument T
			INNER JOIN CommonRows			T2 ON T2.Account						= T.Account
												  AND T2.SubaccountId				= T.SubaccountId
												  AND T2.DocumentType				= T.DocumentType
												  AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
		EXCEPT
		SELECT
			T.[Account]
		   ,T.[RecordId]
		   ,T.CompanyId
		   ,T.VendorId
		   ,T.[TransactionReferenceNumber]
		   ,T.BatchNumber
		   ,CAST(T.DocumentDate AS DATE)		AS DocumentDate
		   ,CAST(T.DueDate AS DATE)				AS DueDate
		   ,CAST(T.DiscountDate AS DATE)		AS DiscountDate
		   ,T.[DocumentType]
		   ,ROUND(T.DocumentBalance, 2)			AS DocumentBalance
		   ,ROUND(T.CurrencyDocumentBalance, 2) AS CurrencyDocumentBalance
		   ,T.[SubaccountId]
		   ,T.ProfitCenterId
		   ,T.LocationId
		   ,T.PeriodToPost
		   ,T.InvoiceNumber
		   ,T.Released
		   ,T.OpenDocument
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwAPDoc T
			INNER JOIN CommonRows  T2 ON T2.Account						   = T.Account
										 AND T2.SubaccountId			   = T.SubaccountId
										 AND T2.DocumentType			   = T.DocumentType
										 AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsPayableDocument', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;