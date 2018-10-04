

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
		LEFT JOIN SF.[User]						  U1 ON W.SalespersonWorkOrder	  = U1.Id
		LEFT JOIN SF.[User]						  U2 ON W.Salesperson2ndWorkOrder = U2.Id
		LEFT JOIN SF.ServiceMaxServiceGroupMembers	  G ON W.ServiceMaxGroupMember	  = G.Id
		LEFT JOIN SF.Account						  A ON W.ServiceMaxCompany		  = A.Id
		LEFT JOIN SF.ServiceMaxSite				  S ON W.Location				  = S.Id
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
	   ,I.WorkOrder		 AS WorkOrderId
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
		LEFT JOIN SF.Account							 A ON I.Account	 = A.Id
		LEFT JOIN SF.ServiceMaxSite					 S ON I.Location = S.Id
		LEFT OUTER JOIN SF.MaterialHandlingInvoiceDetail D ON D.Invoice	 = I.Id
)
SELECT
	CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderId FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderId END AS WorkOrderId
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderName FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderName END AS WorkOrderName
 --,CASE WHEN WorkOrder.WorkOrderName IS NULL THEN (SELECT O.Name FROM SF.ServiceMaxServiceOrder O 
	--	WHERE  O.Id = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderName END AS WorkOrderName
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderCreatedDate FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderCreatedDate END AS WorkOrderCreatedDate
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.Salesperson2ndWorkOrderID FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.Salesperson2ndWorkOrderID END AS Salesperson2ndWorkOrderID
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.Salesperson2ndWorkOrderName FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.Salesperson2ndWorkOrderName END AS Salesperson2ndWorkOrderName
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.SalespersonWorkOrderID FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.SalespersonWorkOrderID END AS SalespersonWorkOrderID
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.SalespersonWorkOrderName FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.SalespersonWorkOrderName END AS SalespersonWorkOrderName
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderServiceMaxGroupMemberId FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderServiceMaxGroupMemberId END AS WorkOrderServiceMaxGroupMemberId
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderServiceMaxGroupMemberName FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderServiceMaxGroupMemberName END AS WorkOrderServiceMaxGroupMemberName
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderStatus FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderStatus END AS WorkOrderStatus
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderType FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderType END AS WorkOrderType
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderSite FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderSite END AS WorkOrderSite
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderLocationName FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderLocationName END AS WorkOrderLocationName
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderCompanyId FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderCompanyId END AS WorkOrderCompanyId
   ,CASE WHEN WorkOrder.WorkOrderId IS NULL THEN (SELECT TOP 1 O.WorkOrderCompanyName FROM WorkOrder O 
		WHERE  O.WorkOrderId = Invoice.WorkOrderId ) ELSE WorkOrder.WorkOrderCompanyName END AS WorkOrderCompanyName
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
	FULL OUTER JOIN Invoice ON WorkOrder.WorkOrderLineIdW = Invoice.WorkOrderLineId 
	--WHERE Invoice.InvoiceName = 'IN-0272169'
	;
GO
GRANT SELECT
    ON OBJECT::[SF].[vwWorkOrderInvoiceDetail] TO [OdsUser]
    AS [dbo];

