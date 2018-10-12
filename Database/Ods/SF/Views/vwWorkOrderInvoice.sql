CREATE VIEW [SF].[vwWorkOrderInvoice]
AS
SELECT
	T.Id					   AS InvoiceId
   ,T.CreatedDate			   AS InvoiceCreatedDate
   ,T.Account				   AS InvoiceAccountId
   ,T2.Name					   AS InvoiceAccount
   ,T.ServiceTeam			   AS InvoiceServiceTeam
   ,T.Status				   AS InvoiceStatus
   ,T.Name					   AS InvoiceName
   ,T.Location				   AS InvoiceLocationId
   ,T3.Name					   AS InvoiceLocation
   ,T.Segment				   AS InvoiceSegment
   ,T.SlInvoiceDate			   AS InvoiceSlInvoiceDate
   ,T.WorkOrder				   AS WorkOrderId
   ,T.WorkOrderType			   AS InvoiceWorkOrderType
   ,T4.CreatedDate			   AS InvoiceDetailCreatedDate
   ,T4.Name					   AS InvoiceDetailName
   ,T4.LineType				   AS InvoiceDetailLineType
   ,T4.LineQuantity			   AS InvoiceDetailLineQuantity
   ,T4.InvoiceStatus		   AS InvoiceDetailInvoiceStatus
   ,T4.ActivityType			   AS InvoiceDetailActivityType
   ,T4.TotalLinePrice		   AS InvoiceDetailTotalLinePrice
   ,T4.SalesTax				   AS InvoiceDetailSalesTax
   ,T4.WorkDetail			   AS WorkOrderLineId
   ,T5.Name					   AS WorkOrderName
   ,T5.CreatedDate			   AS WorkOrderCreatedDate
   ,T5.Salesperson2ndWorkOrder AS Salesperson2ndWorkOrderId
   ,T5.SalespersonWorkOrder	   AS SalespersonWorkOrderId
   ,T5.ServiceMaxGroupMember   AS WorkOrderServiceMaxGroupMemberId
   ,T5.ServiceMaxOrderStatus   AS WorkOrderStatus
   ,T5.ServiceMaxOrderType	   AS WorkOrderType
   ,T5.ServiceMaxSite		   AS WorkOrderSite
   ,T5.ServiceMaxCompany	   AS WorkOrderCompanyId
   ,ISNULL(T6.Name, '')		   AS Salesperson2ndWorkOrderName
   ,ISNULL(T7.Name, '')		   AS SalespersonWorkOrderName
   ,T8.Name					   AS WorkOrderServiceMaxGroupMemberName
   ,T9.Name					   AS WorkOrderCompanyName
   ,T10.Name				   AS WorkOrderLineName
   ,T10.ActivityType		   AS WorkOrderLineActivityType
   ,T10.LineType			   AS WorkOrderLineType
   ,T10.LineStatus			   AS WorkOrderLineStatus
   ,T10.BillableQuantity	   AS WorkOrderLineBillableQuantity
   ,T10.InventoryLineQuantity  AS WorkOrderLineInventoryLineQuantity
   ,T10.ActualQuantity2		   AS WorkOrderLineActualQuantity2
   ,T10.VendorCostPerUnit	   AS WorkOrderLineVendorCostPerUnit
   ,T10.TotalCost			   AS WorkOrderLineTotalCost
   ,T10.CreatedDate			   AS WorkOrderLineCreatedDate
FROM SF.MaterialHandlingInvoice					T
	INNER JOIN SF.Account						T2 ON T2.Id				= T.Account
	INNER JOIN SF.ServiceMaxSite				T3 ON T3.Id				= T.Location
	INNER JOIN SF.MaterialHandlingInvoiceDetail T4 ON T4.Invoice		= T.Id
	INNER JOIN SF.ServiceMaxServiceOrder		T5 ON T5.Id				= T.WorkOrder
	LEFT JOIN SF.[User]							T6 ON T6.Id				= T5.Salesperson2ndWorkOrder
	LEFT JOIN SF.[User]							T7 ON T7.Id				= T5.SalespersonWorkOrder
	LEFT JOIN SF.ServiceMaxServiceGroupMembers	T8 ON T8.Id				= T5.ServiceMaxGroupMember
	INNER JOIN SF.Account						T9 ON T9.Id				= T5.ServiceMaxCompany
	INNER JOIN SF.ServiceMaxServiceOrderLine	T10 ON T10.ServiceOrder = T5.Id;

/*
SELECT *
FROM SF.vwWorkOrderInvoice
WHERE InvoiceName = 'IN-0193233';
*/