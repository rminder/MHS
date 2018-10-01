
-- ===================================================
-- Author:		Randy Minder
-- Create date: 20-September, 2018
-- Description:	Ods table data integrity check
--
-- Exec [SL].[AccountsReceivableDocumentIntegrityCheck]
-- ===================================================
CREATE PROCEDURE [SL].[AccountsReceivableDocumentIntegrityCheck]
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @OdsRowCount INT = 0;
	DECLARE @SLRowCount INT = 0;

	--=======================================================================================================
	-- Perform a row count check of the table in Ods and the source table
	--=======================================================================================================

	SELECT @OdsRowCount = COUNT(*)
	FROM SL.AccountsReceivableDocument;

	SELECT @SLRowCount = COUNT(*)
	FROM ODSStaging.SL.ARDoc;

	IF (@OdsRowCount <> @SLRowCount)
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableDocument', 'Row count mismatch', @OdsRowCount, @SLRowCount, '')

		--=======================================================================================================
		-- Now do a row by row comparison of column values for all rows that exist in both tables. We do that
		-- by using the INTERSECT command on the PK columns of the tables.
		--=======================================================================================================

		;
	WITH CommonRows
	AS
	(
		SELECT
			CustomerId
		   ,DocumentType
		   ,TransactionReferenceNumber
		   ,BatchNumber
		   ,BatchSequence
		FROM ODS.SL.AccountsReceivableDocument
		INTERSECT
		SELECT
			CustomerId
		   ,DocumentType
		   ,TransactionReferenceNumber
		   ,BatchNumber
		   ,BatchSequence
		FROM ODSStaging.SL.vwARDoc
	)
		,RowDifferences
	AS
	(
		SELECT
			T.CompanyId
		   ,T.[CustomerId]
		   ,T.[DocumentType]
		   ,T.[TransactionReferenceNumber]
		   ,T.[BatchNumber]
		   ,T.[BatchSequence]
		   ,T.DocumentDate
		   ,T.DueDate
		   ,ROUND(T.DocumentBalance, 3) AS DocumentBalance
		   ,ROUND(T.CurrencyDocumentBalance, 3) AS CurrencyDocumentBalance
		   ,ROUND(T.OriginalDocumentAmount, 3) AS OriginalDocumentAmount
		   ,T.SubaccountId
		   ,T.PeriodToPost
		   ,T.WorkOrder
		   ,T.Released
		   ,T.OpenDocument
		   ,T.LastUpdate
		FROM ODS.SL.AccountsReceivableDocument T
			INNER JOIN CommonRows			   T2 ON T2.CustomerId					   = T.CustomerId
													 AND T2.DocumentType			   = T.DocumentType
													 AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
													 AND T2.BatchNumber				   = T.BatchNumber
													 AND T2.BatchSequence			   = T.BatchSequence
		EXCEPT
		SELECT
			T.CompanyId
		   ,T.[CustomerId]
		   ,T.[DocumentType]
		   ,T.[TransactionReferenceNumber]
		   ,T.[BatchNumber]
		   ,T.[BatchSequence]
		   ,CAST(T.DocumentDate AS DATE) AS DocumentDate
		   ,CAST(T.DueDate AS DATE) AS DueDate
		   ,ROUND(T.DocumentBalance, 3) AS DocumentBalance
		   ,ROUND(T.CurrencyDocumentBalance, 3) AS CurrencyDocumentBalance
		   ,ROUND(T.OriginalDocumentAmount, 3) AS OriginalDocumentAmount
		   ,T.SubaccountId
		   ,T.PeriodToPost
		   ,T.WorkOrder
		   ,T.Released
		   ,T.OpenDocument
		   ,T.LastUpdate
		FROM ODSStaging.SL.vwARDoc T
			INNER JOIN CommonRows  T2 ON T2.CustomerId					   = T.CustomerId
										 AND T2.DocumentType			   = T.DocumentType
										 AND T2.TransactionReferenceNumber = T.TransactionReferenceNumber
										 AND T2.BatchNumber				   = T.BatchNumber
										 AND T2.BatchSequence			   = T.BatchSequence
	)

	-- Store any differences into a temporary table
	SELECT *
	INTO #TempTable
	FROM RowDifferences;

	-- If there are differences, store them in the dbo.DataIntegrity table
	IF @@ROWCOUNT > 0
		INSERT INTO dbo.DataIntegrity (TableName, Description, OdsRowCount, SourceRowCount, IntegrityViolation)
		VALUES
			 ('SL-AccountsReceivableDocument', 'Difference in column values', 0, 0, (SELECT * FROM #TempTable FOR JSON AUTO));

END;