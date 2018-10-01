-- =============================================
-- Author:		Randy Minder
-- Create date: 27-September, 2018
-- Description:	Truncate Ods history tables
-- =============================================
CREATE PROCEDURE dbo.TruncateHistoryTables
AS
BEGIN
	SET NOCOUNT ON;

	--========================================================
	-- SF.Account
	--========================================================
	ALTER TABLE SF.Account SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[AccountHistory];
	ALTER TABLE SF.Account SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.AccountHistory));

	--========================================================
	-- SF.MaterialHandlingInvoice
	--========================================================
	ALTER TABLE SF.MaterialHandlingInvoice SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[MaterialHandlingInvoiceHistory];
	ALTER TABLE SF.MaterialHandlingInvoice SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.MaterialHandlingInvoiceHistory));

	--========================================================
	-- SF.MaterialHandlingInvoiceDetail
	--========================================================
	ALTER TABLE SF.MaterialHandlingInvoiceDetail SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[MaterialHandlingInvoiceDetailHistory];
	ALTER TABLE SF.MaterialHandlingInvoiceDetail SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.MaterialHandlingInvoiceDetailHistory));

	--========================================================
	-- SF.Note
	--========================================================
	ALTER TABLE SF.Note SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[NoteHistory];
	ALTER TABLE SF.Note SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.NoteHistory));

	--========================================================
	-- SF.Product2
	--========================================================
	ALTER TABLE SF.Product2 SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[Product2History];
	ALTER TABLE SF.Product2 SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.Product2History));

	--========================================================
	-- SF.RecordType
	--========================================================
	ALTER TABLE SF.RecordType SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[RecordTypeHistory];
	ALTER TABLE SF.RecordType SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.RecordTypeHistory));

	--========================================================
	-- SF.ServiceMaxRmaShipmentLine
	--========================================================
	ALTER TABLE SF.ServiceMaxRmaShipmentLine SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[ServiceMaxRmaShipmentLineHistory];
	ALTER TABLE SF.ServiceMaxRmaShipmentLine SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxRmaShipmentLineHistory));

	--========================================================
	-- SF.ServiceMaxRmaShipmentOrder
	--========================================================
	ALTER TABLE SF.ServiceMaxRmaShipmentOrder SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[ServiceMaxRmaShipmentOrderHistory];
	ALTER TABLE SF.ServiceMaxRmaShipmentOrder SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxRmaShipmentOrderHistory));

	--========================================================
	-- SF.ServiceMaxServiceGroup
	--========================================================
	ALTER TABLE SF.ServiceMaxServiceGroup SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[ServiceMaxServiceGroupHistory];
	ALTER TABLE SF.ServiceMaxServiceGroup SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxServiceGroupHistory));

	--========================================================
	-- SF.ServiceMaxServiceGroupMembers
	--========================================================
	ALTER TABLE SF.ServiceMaxServiceGroupMembers SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].[ServiceMaxServiceGroupMembersHistory];
	ALTER TABLE SF.ServiceMaxServiceGroupMembers SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxServiceGroupMembersHistory));

	--========================================================
	-- SF.ServiceMaxServiceOrder
	--========================================================
	ALTER TABLE SF.ServiceMaxServiceOrder SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].ServiceMaxServiceOrderHistory;
	ALTER TABLE SF.ServiceMaxServiceOrder SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxServiceOrderHistory));

	--========================================================
	-- SF.ServiceMaxServiceOrderLine
	--========================================================
	ALTER TABLE SF.ServiceMaxServiceOrderLine SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].ServiceMaxServiceOrderLineHistory;
	ALTER TABLE SF.ServiceMaxServiceOrderLine SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxServiceOrderLineHistory));

	--========================================================
	-- SF.ServiceMaxSite
	--========================================================
	ALTER TABLE SF.ServiceMaxSite SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].ServiceMaxSiteHistory;
	ALTER TABLE SF.ServiceMaxSite SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.ServiceMaxSiteHistory));

	--========================================================
	-- SF.SuperCenter
	--========================================================
	ALTER TABLE SF.SuperCenter SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].SuperCenterHistory;
	ALTER TABLE SF.SuperCenter SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.SuperCenterHistory));

	--========================================================
	-- SF.User
	--========================================================
	ALTER TABLE SF.[User] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SF].UserHistory;
	ALTER TABLE SF.[User] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SF.UserHistory));

	--========================================================
	-- SL.Account
	--========================================================
	ALTER TABLE SL.[Account] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountHist;
	ALTER TABLE SL.[Account] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountHist));

	--========================================================
	-- SL.AccountHistory
	--========================================================
	ALTER TABLE SL.[AccountHistory] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountHistoryHistory;
	ALTER TABLE SL.[AccountHistory] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountHistoryHistory));

	--========================================================
	-- SL.AccountsPayableBalance
	--========================================================
	ALTER TABLE SL.[AccountsPayableBalance] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsPayableBalanceHistory;
	ALTER TABLE SL.[AccountsPayableBalance] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsPayableBalanceHistory));

	--========================================================
	-- SL.AccountsPayableDocument
	--========================================================
	ALTER TABLE SL.[AccountsPayableDocument] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsPayableDocumentHistory;
	ALTER TABLE SL.[AccountsPayableDocument] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsPayableDocumentHistory));

	--========================================================
	-- SL.AccountsPayableHistory
	--========================================================
	ALTER TABLE SL.[AccountsPayableHistory] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsPayableHistoryHistory;
	ALTER TABLE SL.[AccountsPayableHistory] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsPayableHistoryHistory));

	--========================================================
	-- SL.AccountsPayableTransaction
	--========================================================
	ALTER TABLE SL.[AccountsPayableTransaction] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsPayableTransactionHistory;
	ALTER TABLE SL.[AccountsPayableTransaction] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsPayableTransactionHistory));

	--========================================================
	-- SL.AccountsReceivableBalance
	--========================================================
	ALTER TABLE SL.[AccountsReceivableBalance] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsReceivableBalanceHistory;
	ALTER TABLE SL.[AccountsReceivableBalance] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsReceivableBalanceHistory));

	--========================================================
	-- SL.AccountsReceivableDocument
	--========================================================
	ALTER TABLE SL.[AccountsReceivableDocument] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsReceivableDocumentHistory;
	ALTER TABLE SL.[AccountsReceivableDocument] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsReceivableDocumentHistory));

	--========================================================
	-- SL.AccountsReceivableHistory
	--========================================================
	ALTER TABLE SL.[AccountsReceivableHistory] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsReceivableHistoryHistory;
	ALTER TABLE SL.[AccountsReceivableHistory] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsReceivableHistoryHistory));

	--========================================================
	-- SL.AccountsReceivableTransaction
	--========================================================
	ALTER TABLE SL.[AccountsReceivableTransaction] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].AccountsReceivableTransactionHistory;
	ALTER TABLE SL.[AccountsReceivableTransaction] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.AccountsReceivableTransactionHistory));

	--========================================================
	-- SL.Budget
	--========================================================
	ALTER TABLE SL.[Budget] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].BudgetHistory;
	ALTER TABLE SL.[Budget] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.BudgetHistory));

	--========================================================
	-- SL.BudgetDistributionType
	--========================================================
	ALTER TABLE SL.[BudgetDistributionType] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].BudgetDistributionTypeHistory;
	ALTER TABLE SL.[BudgetDistributionType] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.BudgetDistributionTypeHistory));

	--========================================================
	-- SL.BudgetGroup
	--========================================================
	ALTER TABLE SL.[BudgetGroup] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].BudgetGroupHistory;
	ALTER TABLE SL.[BudgetGroup] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.BudgetGroupHistory));

	--========================================================
	-- SL.BudgetSetup
	--========================================================
	ALTER TABLE SL.[BudgetSetup] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].BudgetSetupHistory;
	ALTER TABLE SL.[BudgetSetup] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.BudgetSetupHistory));

	--========================================================
	-- SL.Customer
	--========================================================
	ALTER TABLE SL.[Customer] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].CustomerHistory;
	ALTER TABLE SL.[Customer] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.CustomerHistory));

	--========================================================
	-- SL.CustomerClass
	--========================================================
	ALTER TABLE SL.[CustomerClass] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].CustomerClassHistory;
	ALTER TABLE SL.[CustomerClass] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.CustomerClassHistory));

	--========================================================
	-- SL.GeneralLedgerSetup
	--========================================================
	ALTER TABLE SL.[GeneralLedgerSetup] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].GeneralLedgerSetupHistory;
	ALTER TABLE SL.[GeneralLedgerSetup] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.GeneralLedgerSetupHistory));

	--========================================================
	-- SL.GeneralLedgerTransaction
	--========================================================
	ALTER TABLE SL.[GeneralLedgerTransaction] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].GeneralLedgerTransactionHistory;
	ALTER TABLE SL.[GeneralLedgerTransaction] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.GeneralLedgerTransactionHistory));

	--========================================================
	-- SL.Ledger
	--========================================================
	ALTER TABLE SL.[Ledger] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].LedgerHistory;
	ALTER TABLE SL.[Ledger] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.LedgerHistory));

	--========================================================
	-- SL.Salesperson
	--========================================================
	ALTER TABLE SL.[Salesperson] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].SalespersonHistory;
	ALTER TABLE SL.[Salesperson] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.SalespersonHistory));

	--========================================================
	-- SL.SegmentDefinition
	--========================================================
	ALTER TABLE SL.[SegmentDefinition] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].SegmentDefinitionHistory;
	ALTER TABLE SL.[SegmentDefinition] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.SegmentDefinitionHistory));

	--========================================================
	-- SL.Subaccount
	--========================================================
	ALTER TABLE SL.[Subaccount] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].SubaccountHistory;
	ALTER TABLE SL.[Subaccount] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.SubaccountHistory));

	--========================================================
	-- SL.Vendor
	--========================================================
	ALTER TABLE SL.[Vendor] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].VendorHistory;
	ALTER TABLE SL.[Vendor] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.VendorHistory));

	--========================================================
	-- SL.VendorClass
	--========================================================
	ALTER TABLE SL.[VendorClass] SET (SYSTEM_VERSIONING = OFF);
	TRUNCATE TABLE [SL].VendorClassHistory;
	ALTER TABLE SL.[VendorClass] SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE=SL.VendorClassHistory));

END;