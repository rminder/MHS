CREATE VIEW [SF].[vwWorkOrderInvoiceDetail]
AS
WITH WorkOrder
AS
(
	SELECT
		W.Id					  AS WorkOrderId
	   ,W.Name					  AS WorkOrderName
	   ,W.CreatedDate			  AS WorkOrderCreatedDate
	   ,W.Salesperson2ndWorkOrder AS Salesperson2ndWorkOrderID
	   ,U2.Name					  AS Salesperson2ndWorkOrderName
	   ,W.SalespersonWorkOrder	  AS SalespersonWorkOrderId
	   ,U1.Name					  AS SalespersonWorkOrderName
	   ,W.ServiceMaxGroupMember	  AS WorkOrderServiceMaxGroupMemberId
	   ,G.Name					  AS WorkOrderServiceMaxGroupMemberName
	   ,W.ServiceMaxOrderStatus	  AS WorkOrderStatus
	   ,W.ServiceMaxOrderType	  AS WorkOrderType
	   ,W.ServiceMaxSite		  AS WorkOrderSite
	   ,S.Name					  AS WorkOrderLocationName
	   ,W.ServiceMaxCompany		  AS WorkOrderCompanyId
	   ,A.Name					  AS WorkOrderCompanyName
	   ,L.Name					  AS WorkOrderLineName
	   ,L.ActivityType			  AS WorkOrderLineActivityType
	   ,L.LineType				  AS WorkOrderLineType
	   ,L.LineStatus			  AS WorkOrderLineStatus
	   ,L.BillableQuantity		  AS WorkOrderLineBillableQuantity
	   ,L.InventoryLineQuantity	  AS WorkOrderLineInventoryLineQuantity
	   ,L.ActualQuantity2		  AS WorkOrderLineActualQuantity2
	   ,L.VendorCostPerUnit		  AS WorkOrderLineVendorCostPerUnit
	   ,L.TotalCost				  AS WorkOrderLineTotalCost
	   ,L.CreatedDate			  AS WorkOrderLineCreatedDate
	   ,L.Id					  AS WorkOrderLineIdW
	FROM SF.ServiceMaxServiceOrder					  W
		INNER JOIN SF.[User]						  U1 ON W.SalespersonWorkOrder	  = U1.Id
		INNER JOIN SF.[User]						  U2 ON W.Salesperson2ndWorkOrder = U2.Id
		INNER JOIN SF.ServiceMaxServiceGroupMembers	  G ON W.ServiceMaxGroupMember	  = G.Id
		INNER JOIN SF.Account						  A ON W.ServiceMaxCompany		  = A.Id
		INNER JOIN SF.ServiceMaxSite				  S ON W.Location				  = S.Id
		LEFT OUTER JOIN SF.ServiceMaxServiceOrderLine L ON L.ServiceOrder			  = W.Id
)
,Invoice
AS
(
	SELECT
		I.Id			 AS InvoiceId
	   ,I.CreatedDate	 AS InvoiceCreatedDate
	   ,I.Account		 AS InvoiceAccountId
	   ,A.Name			 AS InvoiceAccount
	   ,I.ServiceTeam	 AS InvoiceServiceTeam
	   ,I.Status		 AS InvoiceStatus
	   ,I.Name			 AS InvoiceName
	   ,I.Location		 AS InvoiceLocationId
	   ,S.Name			 AS InvoiceLocation
	   ,I.Segment		 AS InvoiceSegment
	   ,I.SlInvoiceDate	 AS InvoiceSlInvoiceDate
	   ,I.WorkOrderType	 AS InvoiceWorkOrderType
	   ,D.CreatedDate	 AS InvoiceDetailCreatedDate
	   ,D.Name			 AS InvoiceDetailname
	   ,D.LineType		 AS InvoiceDetailLineType
	   ,D.LineQuantity	 AS InvoiceDetailLineQuantity
	   ,D.InvoiceStatus	 AS InvoiceDetailInvoiceStatus
	   ,D.ActivityType	 AS InvoiceDetailActivityType
	   ,D.TotalLinePrice AS InvoiceDetailTotalLinePrice
	   ,D.SalesTax		 AS InvoiceDetailSalesTax
	   ,D.WorkDetail	 AS WorkOrderLineId
	FROM SF.MaterialHandlingInvoice						 I
		INNER JOIN SF.Account							 A ON I.Account	 = A.Id
		INNER JOIN SF.ServiceMaxSite					 S ON I.Location = S.Id
		LEFT OUTER JOIN SF.MaterialHandlingInvoiceDetail D ON D.Invoice	 = I.Id
)
SELECT
	WorkOrder.WorkOrderId
   ,WorkOrder.WorkOrderName
   ,WorkOrder.WorkOrderCreatedDate
   ,WorkOrder.Salesperson2ndWorkOrderID
   ,WorkOrder.Salesperson2ndWorkOrderName
   ,WorkOrder.SalespersonWorkOrderId
   ,WorkOrder.SalespersonWorkOrderName
   ,WorkOrder.WorkOrderServiceMaxGroupMemberId
   ,WorkOrder.WorkOrderServiceMaxGroupMemberName
   ,WorkOrder.WorkOrderStatus
   ,WorkOrder.WorkOrderType
   ,WorkOrder.WorkOrderSite
   ,WorkOrder.WorkOrderLocationName
   ,WorkOrder.WorkOrderCompanyId
   ,WorkOrder.WorkOrderCompanyName
   ,WorkOrder.WorkOrderLineName
   ,WorkOrder.WorkOrderLineActivityType
   ,WorkOrder.WorkOrderLineType
   ,WorkOrder.WorkOrderLineStatus
   ,WorkOrder.WorkOrderLineBillableQuantity
   ,WorkOrder.WorkOrderLineInventoryLineQuantity
   ,WorkOrder.WorkOrderLineActualQuantity2
   ,WorkOrder.WorkOrderLineVendorCostPerUnit
   ,WorkOrder.WorkOrderLineTotalCost
   ,WorkOrder.WorkOrderLineCreatedDate
   ,WorkOrder.WorkOrderLineIdW
   ,Invoice.InvoiceId
   ,Invoice.InvoiceCreatedDate
   ,Invoice.InvoiceAccountId
   ,Invoice.InvoiceAccount
   ,Invoice.InvoiceServiceTeam
   ,Invoice.InvoiceStatus
   ,Invoice.InvoiceName
   ,Invoice.InvoiceLocationId
   ,Invoice.InvoiceLocation
   ,Invoice.InvoiceSegment
   ,Invoice.InvoiceSlInvoiceDate
   ,Invoice.InvoiceWorkOrderType
   ,Invoice.InvoiceDetailCreatedDate
   ,Invoice.InvoiceDetailname
   ,Invoice.InvoiceDetailLineType
   ,Invoice.InvoiceDetailLineQuantity
   ,Invoice.InvoiceDetailInvoiceStatus
   ,Invoice.InvoiceDetailActivityType
   ,Invoice.InvoiceDetailTotalLinePrice
   ,Invoice.InvoiceDetailSalesTax
   ,Invoice.WorkOrderLineId
FROM WorkOrder
	FULL OUTER JOIN Invoice ON WorkOrder.WorkOrderLineIdW = Invoice.WorkOrderLineId;
GO
GRANT SELECT
    ON OBJECT::[SF].[vwWorkOrderInvoiceDetail] TO [OdsUser]
    AS [dbo];

