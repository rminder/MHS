CREATE VIEW [SL].[vwMissingMasterData]
AS
SELECT DISTINCT
	   'AR Transaction' AS 'File'
	  ,'CustID'			AS 'MissingMasterDataElement '
	  ,a.[CustomerId]	AS 'MissingMasterDataValue'
	  ,'CUSTOMER'		AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [SL].[Customer]		  b ON a.[CustomerId] = b.[CustomerId]
WHERE
	b.[CustomerId] IS NULL
	AND a.[CustomerId] <> ''
UNION
SELECT DISTINCT
	   'AP Transaction' AS 'File'
	  ,'JrnlType'		AS 'MissingMasterDataElement '
	  ,a.[JournalType]	AS 'MissingMasterDataValue'
	  ,'?'				AS 'SLMasterDataTable'
FROM [SL].[AccountsPayableTransaction] a
	LEFT OUTER JOIN [dbo].[dJrnlType]  b ON a.[JournalType] = b.[ID]
WHERE
	b.[ID] IS NULL
	AND a.[JournalType] <> ''
UNION
SELECT DISTINCT
	   'AR Transaction' AS 'File'
	  ,'JrnlType'		AS 'MissingMasterDataElement '
	  ,a.[JournalType]	AS 'MissingMasterDataValue'
	  ,'?'				AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [dbo].[dJrnlType]	  b ON a.[JournalType] = b.[ID]
WHERE
	b.[ID] IS NULL
	AND a.[JournalType] <> ''
UNION
SELECT DISTINCT
	   'GL Transaction' AS 'File'
	  ,'Journal Type'	AS 'MissingMasterDataElement '
	  ,a.[JournalType]	AS 'MissingMasterDataValue'
	  ,'?'				AS 'SLMasterDataTable'
FROM [SL].[GeneralLedgerTransaction]  a
	LEFT OUTER JOIN [dbo].[dJrnlType] b ON a.[JournalType] = b.[ID]
WHERE
	b.[ID] IS NULL
	AND a.[JournalType] <> ''
UNION
SELECT DISTINCT
	   'GL Transaction' AS 'File'
	  ,'LedgerID'		AS 'MissingMasterDataElement '
	  ,a.[LedgerId]		AS 'MissingMasterDataValue'
	  ,'Ledger'			AS 'SLMasterDataTable'
FROM [SL].[GeneralLedgerTransaction] a
	LEFT OUTER JOIN [SL].[Ledger]	 b ON a.[LedgerId] = b.[LedgerId]
WHERE
	b.[LedgerId] IS NULL
	AND a.[LedgerId] <> ''
UNION
SELECT DISTINCT
	   'GL Budget'	AS 'File'
	  ,'LedgerID'	AS 'MissingMasterDataElement '
	  ,a.[LedgerID] AS 'MissingMasterDataValue'
	  ,'Ledger'		AS 'SLMasterDataTable'
FROM [fGLBudget]				  a
	LEFT OUTER JOIN [SL].[Ledger] b ON a.[LedgerID] = b.[LedgerId]
WHERE
	b.[LedgerId] IS NULL
	AND a.[LedgerID] <> ''
UNION
SELECT DISTINCT
	   'Accounts Payable' AS 'File'
	  ,'Sub'			  AS 'MissingMasterDataElement '
	  ,a.[SubaccountId]	  AS 'MissingMasterDataValue'
	  ,'Subacct'		  AS 'SLMasterDataTable'
FROM [SL].[AccountsPayableTransaction] a
	LEFT OUTER JOIN [SL].[Subaccount]  b ON a.[SubaccountId] = b.[SubaccountId]
WHERE
	b.[SubaccountId] IS NULL
	AND a.[SubaccountId] <> ''
UNION
SELECT DISTINCT
	   'Accounts Receivable' AS 'File'
	  ,'Sub'				 AS 'MissingMasterDataElement '
	  ,a.[SubaccountId]		 AS 'MissingMasterDataValue'
	  ,'Subacct'			 AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [SL].[Subaccount]	  b ON a.[SubaccountId] = b.[SubaccountId]
WHERE
	b.[SubaccountId] IS NULL
	AND a.[SubaccountId] <> ''
UNION
SELECT DISTINCT
	   'GL Budget' AS 'File'
	  ,'Sub'	   AS 'MissingMasterDataElement '
	  ,a.[Sub]	   AS 'MissingMasterDataValue'
	  ,'Subacct'   AS 'SLMasterDataTable'
FROM [dbo].[fGLBudget]				  a
	LEFT OUTER JOIN [SL].[Subaccount] b ON a.[Sub] = b.[SubaccountId]
WHERE
	b.[SubaccountId] IS NULL
	AND a.[Sub] <> ''
UNION
SELECT DISTINCT
	   'GL Transaction' AS 'File'
	  ,'Subaccount'		AS 'MissingMasterDataElement '
	  ,a.[SubaccountId] AS 'MissingMasterDataValue'
	  ,'Subacct'		AS 'SLMasterDataTable'
FROM [SL].[GeneralLedgerTransaction]  a
	LEFT OUTER JOIN [SL].[Subaccount] b ON a.[SubaccountId] = b.[SubaccountId]
WHERE
	b.[SubaccountId] IS NULL
	AND a.[SubaccountId] <> ''
UNION
SELECT DISTINCT
	   'AP Transaction'	  AS 'File'
	  ,'ID - SubSegment1' AS 'MissingMasterDataElement '
	  ,a.[SubSeg1]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [SL].[AccountsPayableTransaction] a
	LEFT OUTER JOIN [dSubAcctSeg1]	   b ON a.[SubSeg1] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg1] <> ''
UNION
SELECT DISTINCT
	   'AR Transaction'	  AS 'File'
	  ,'ID - SubSegment1' AS 'MissingMasterDataElement '
	  ,a.[SubSeg1]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [dSubAcctSeg1]		  b ON a.[SubSeg1] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg1] <> ''
UNION
SELECT DISTINCT
	   'GL Budget'		  AS 'File'
	  ,'ID - SubSegment1' AS 'MissingMasterDataElement '
	  ,a.[SubSeg1]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [dbo].[fGLBudget]			   a
	LEFT OUTER JOIN [dSubAcctSeg1] b ON a.[SubSeg1] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg1] <> ''
UNION
SELECT DISTINCT
	   'GL Transaction'	  AS 'File'
	  ,'ID - SubSegment1' AS 'MissingMasterDataElement '
	  ,a.[SubSeg1]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [SL].[GeneralLedgerTransaction] a
	LEFT OUTER JOIN [dSubAcctSeg1]	 b ON a.[SubSeg1] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg1] <> ''
UNION
SELECT DISTINCT
	   'AP Transaction'	  AS 'File'
	  ,'ID - SubSegment2' AS 'MissingMasterDataElement '
	  ,a.[SubSeg2]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [SL].[AccountsPayableTransaction] a
	LEFT OUTER JOIN [dSubAcctSeg2]	   b ON a.[SubSeg2] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg2] <> ''
UNION
SELECT DISTINCT
	   'AR Transaction'	  AS 'File'
	  ,'ID - SubSegment2' AS 'MissingMasterDataElement '
	  ,a.[SubSeg2]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [dSubAcctSeg2]		  b ON a.[SubSeg2] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg2] <> ''
UNION
SELECT DISTINCT
	   'GL Budget'		  AS 'File'
	  ,'ID - SubSegment2' AS 'MissingMasterDataElement '
	  ,a.[SubSeg2]		  AS 'MissingMasterDataValue'
	  ,'SegDef'			  AS 'SLMasterDataTable'
FROM [dbo].[fGLBudget]			   a
	LEFT OUTER JOIN [dSubAcctSeg2] b ON a.[SubSeg2] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg2] <> ''
UNION
SELECT DISTINCT
	   'GL Transaction' AS 'File'
	  ,'SubSegment2'	AS 'MissingMasterDataElement '
	  ,a.[SubSeg2]		AS 'MissingMasterDataValue'
	  ,'SegDef'			AS 'SLMasterDataTable'
FROM [SL].[GeneralLedgerTransaction] a
	LEFT OUTER JOIN [dSubAcctSeg2]	 b ON a.[SubSeg2] = b.[SegID]
WHERE
	b.[SegID] IS NULL
	AND a.[SubSeg2] <> ''
UNION
SELECT DISTINCT
	   'Vendor Class' AS 'File'
	  ,'ClassID'	  AS 'MissingMasterDataElement '
	  ,a.[ClassId]	  AS 'MissingMasterDataValue'
	  ,'VENDCLASS'	  AS 'SLMasterDataTable'
FROM [SL].[Vendor]					   a
	LEFT OUTER JOIN [SL].[VendorClass] b ON a.[ClassId] = b.[ClassId]
WHERE
	b.[ClassId] IS NULL
	AND a.[ClassId] <> ''
UNION
SELECT DISTINCT
	   'Vendor'		AS 'File'
	  ,'VendID'		AS 'MissingMasterDataElement '
	  ,a.[VendorId] AS 'MissingMasterDataValue'
	  ,'VENDOR'		AS 'SLMasterDataTable'
FROM [SL].[AccountsPayableTransaction] a
	LEFT OUTER JOIN [SL].[Vendor]	   b ON a.[VendorId] = b.[VendorId]
WHERE
	b.[VendorId] IS NULL
	AND a.[VendorId] <> ''
UNION
SELECT DISTINCT
	   'Salesperson'	 AS 'File'
	  ,'SlsPerID'		 AS 'MissingMasterDataElement '
	  ,a.[SalesPersonId] AS 'MissingMasterDataValue'
	  ,'SALESPERSON'	 AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [SL].[Salesperson]	  b ON a.[SalesPersonId] = b.[SalesPersonId]
WHERE
	b.[SalesPersonId] IS NULL
	AND a.[SalesPersonId] <> ''
UNION
SELECT DISTINCT
	   'Accounts Payable' AS 'File'
	  ,'Acct'			  AS 'MissingMasterDataElement '
	  ,a.[Account]		  AS 'MissingMasterDataValue'
	  ,'Account'		  AS 'SLMasterDataTable'
FROM [SL].[AccountsPayableTransaction] a
	LEFT OUTER JOIN [SL].[Account]	   b ON a.[Account] = b.[Account]
WHERE
	b.[Account] IS NULL
	AND a.Account <> ''
UNION
SELECT DISTINCT
	   'Accounts Receivable' AS 'File'
	  ,'Acct'				 AS 'MissingMasterDataElement '
	  ,a.[Account]			 AS 'MissingMasterDataValue'
	  ,'Account'			 AS 'SLMasterDataTable'
FROM [SL].[AccountsReceivableTransaction] a
	LEFT OUTER JOIN [SL].[Account]		  b ON a.[Account] = b.[Account]
WHERE
	b.[Account] IS NULL
	AND a.Account <> ''
UNION
SELECT DISTINCT
	   'GL Budget' AS 'File'
	  ,'Acct'	   AS 'MissingMasterDataElement '
	  ,a.[Sub]	   AS 'MissingMasterDataValue'
	  ,'Account'   AS 'SLMasterDataTable'
FROM [dbo].[fGLBudget]			   a
	LEFT OUTER JOIN [SL].[Account] b ON a.[Acct] = b.[Account]
WHERE
	b.[Account] IS NULL
	AND a.Acct <> ''
UNION
SELECT DISTINCT
	   'GL Transaction' AS 'File'
	  ,'Acct'			AS 'MissingMasterDataElement '
	  ,a.[Account]		AS 'MissingMasterDataValue'
	  ,'Account'		AS 'SLMasterDataTable'
FROM [SL].[GeneralLedgerTransaction] a
	LEFT OUTER JOIN [SL].[Account]	 b ON a.[Account] = b.[Account]
WHERE
	b.[Account] IS NULL
	AND a.Account <> '';
GO
GRANT SELECT
    ON OBJECT::[SL].[vwMissingMasterData] TO [OdsUser]
    AS [dbo];

