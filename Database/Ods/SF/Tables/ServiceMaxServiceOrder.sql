﻿CREATE TABLE [SF].[ServiceMaxServiceOrder] (
    [RowId]                                        INT                                         IDENTITY (1, 1) NOT NULL,
    [Id]                                           NVARCHAR (18)                               NOT NULL,
    [OwnerId]                                      NVARCHAR (18)                               NOT NULL,
    [IsDeleted]                                    TINYINT                                     NULL,
    [Name]                                         NVARCHAR (80)                               NOT NULL,
    [RecordTypeId]                                 NVARCHAR (18)                               NOT NULL,
    [CreatedDate]                                  DATETIME2 (7)                               NULL,
    [CreatedById]                                  NVARCHAR (18)                               NOT NULL,
    [LastModifiedDate]                             DATETIME2 (7)                               NULL,
    [LastModifiedById]                             NVARCHAR (18)                               NOT NULL,
    [SystemModstamp]                               DATETIME2 (7)                               NULL,
    [LastActivityDate]                             DATETIME2 (7)                               NULL,
    [LastViewedDate]                               DATETIME2 (7)                               NULL,
    [LastReferencedDate]                           DATETIME2 (7)                               NULL,
    [ServiceMaxAgeBucket]                          NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxAge]                                DECIMAL (32, 16)                            NULL,
    [ServiceMaxBillingType]                        NVARCHAR (255)                              NOT NULL,
    [ServiceMaxCity]                               NVARCHAR (100)                              NOT NULL,
    [ServiceMaxCompany]                            NVARCHAR (18)                               NOT NULL,
    [ServiceMaxComponent]                          NVARCHAR (18)                               NOT NULL,
    [ServiceMaxConfigurationAfter]                 NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxConfigurationBefore]                NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxContact]                            NVARCHAR (18)                               NOT NULL,
    [ServiceMaxCountry]                            NVARCHAR (255)                              NOT NULL,
    [ServiceMaxCustomerDownStatus]                 NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxCustomerDown]                       TINYINT                                     NULL,
    [ServiceMaxDispatchStatus]                     NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxDrivingTime]                        DECIMAL (32, 16)                            NULL,
    [ServiceMaxEndpointURL]                        NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxFirstQueuedDateTime]                DATETIME2 (7)                               NULL,
    [ServiceMaxGroupEmail]                         NVARCHAR (80)                               NOT NULL,
    [ServiceMaxGroupMember]                        NVARCHAR (18)                               NOT NULL,
    [ServiceMaxIsPartner]                          NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxLastDispatchEvent]                  NVARCHAR (255)                              NOT NULL,
    [ServiceMaxMemberEmail]                        NVARCHAR (80)                               NOT NULL,
    [ServiceMaxNoOfTimesQueued]                    DECIMAL (32, 16)                            NULL,
    [ServiceMaxNumberOfTimesQueuedBucket]          NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxNumberOfTimesScheduledBucket]       NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxOptiMaxStatus]                      NVARCHAR (255)                              NOT NULL,
    [ServiceMaxOrderStatus]                        NVARCHAR (255)                              NOT NULL,
    [ServiceMaxOrderType]                          NVARCHAR (255)                              NOT NULL,
    [ServiceMaxPriority]                           NVARCHAR (255)                              NOT NULL,
    [ServiceMaxProblemDescription]                 NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxProduct]                            NVARCHAR (18)                               NOT NULL,
    [ServiceMaxSessionId]                          NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxScheduledDateTime]                  DATETIME2 (7)                               NULL,
    [ServiceMaxScheduledDate]                      DATETIME2 (7)                               NULL,
    [ServiceMaxTimeBetweenScheduleAndClose]        DECIMAL (32, 16)                            NULL,
    [ServiceMaxTimeToAssign]                       DECIMAL (32, 16)                            NULL,
    [ServiceMaxTimeToQueue]                        DECIMAL (32, 16)                            NULL,
    [ServiceMaxTimeToSchedule]                     DECIMAL (32, 16)                            NULL,
    [ServiceMaxTimeBetweenAssignAndScheduleBucket] NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxTimeBetweenQueueAndAssignBucket]    NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxTimeBetweenScheduleAndCloseBucket]  NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxTimetoAssignBucket]                 NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxTimetoQueueBucket]                  NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxTimetoScheduleBucket]               NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxTurnaroundTime]                     NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxWorkPerformed]                      NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxZip]                                NVARCHAR (100)                              NOT NULL,
    [ServiceMaxTotalBillableAmount]                DECIMAL (32, 16)                            NULL,
    [ServiceMaxTotalWorkOrderCost]                 DECIMAL (32, 16)                            NULL,
    [Location]                                     NVARCHAR (18)                               NOT NULL,
    [ServiceMaxInvoiceCreated]                     TINYINT                                     NULL,
    [ServiceMaxInvoiceNumber]                      NVARCHAR (255)                              NOT NULL,
    [ServiceMaxIsEntitlementPerformed]             TINYINT                                     NULL,
    [ServiceMaxIsServiceCovered]                   TINYINT                                     NULL,
    [ServiceMaxPerformAutoEntitlement]             TINYINT                                     NULL,
    [ServiceMaxSite]                               NVARCHAR (18)                               NOT NULL,
    [ServiceMaxQtlStatus]                          NVARCHAR (255)                              NOT NULL,
    [ServiceMaxQualifiedTechnicians]               NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxSkillSet]                           NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxServiceZoneId]                      NVARCHAR (255)                              NOT NULL,
    [EstimatedWorkDetailTotal]                     DECIMAL (32, 16)                            NULL,
    [WorkOrderDeniedReason]                        NVARCHAR (255)                              NOT NULL,
    [AdditionalServiceRecommended]                 TINYINT                                     NULL,
    [EmergencyService]                             TINYINT                                     NULL,
    [SerialNumber]                                 NVARCHAR (150)                              NOT NULL,
    [AssetTag]                                     NVARCHAR (100)                              NOT NULL,
    [CustomerPurchaseOrder]                        NVARCHAR (35)                               NOT NULL,
    [InvoiceTotal]                                 DECIMAL (32, 16)                            NULL,
    [RecommendedService]                           NVARCHAR (MAX)                              NOT NULL,
    [Make]                                         NVARCHAR (MAX)                              NOT NULL,
    [TfsServiceDate]                               DATETIME2 (7)                               NULL,
    [NteThreshold]                                 DECIMAL (32, 16)                            NULL,
    [MheFaultCodesTierI]                           NVARCHAR (255)                              NOT NULL,
    [MheFaultCodesTierII]                          NVARCHAR (255)                              NOT NULL,
    [Model1]                                       NVARCHAR (MAX)                              NOT NULL,
    [Broad]                                        NVARCHAR (MAX)                              NOT NULL,
    [Group]                                        NVARCHAR (MAX)                              NOT NULL,
    [Type]                                         NVARCHAR (MAX)                              NOT NULL,
    [BroadLocation]                                NVARCHAR (255)                              NOT NULL,
    [BroadReportable]                              NVARCHAR (MAX)                              NOT NULL,
    [GroupLocation]                                NVARCHAR (255)                              NOT NULL,
    [TypeLocation]                                 NVARCHAR (255)                              NOT NULL,
    [GroupReportable]                              NVARCHAR (MAX)                              NOT NULL,
    [TypeReportable]                               NVARCHAR (MAX)                              NOT NULL,
    [TechnicianArrived]                            TINYINT                                     NULL,
    [DispatchStatus1]                              NVARCHAR (MAX)                              NOT NULL,
    [WorkOrderRollup]                              TINYINT                                     NULL,
    [LaborRateStandard]                            DECIMAL (32, 16)                            NULL,
    [MeterReading]                                 DECIMAL (32, 16)                            NULL,
    [BusinessUnit]                                 NVARCHAR (255)                              NOT NULL,
    [WorkDetailCount]                              DECIMAL (32, 16)                            NULL,
    [TotalSalesTax]                                DECIMAL (32, 16)                            NULL,
    [FieldOffice]                                  NVARCHAR (18)                               NOT NULL,
    [VendorWorkDetailsOpen]                        DECIMAL (32, 16)                            NULL,
    [TotalCost]                                    DECIMAL (32, 16)                            NULL,
    [EstimatedWorkTotal]                           DECIMAL (32, 16)                            NULL,
    [TfsInvoiceDate]                               DATETIME2 (7)                               NULL,
    [TfsDateEntered]                               DATETIME2 (7)                               NULL,
    [TfsVendorInvoice]                             NVARCHAR (18)                               NOT NULL,
    [TfsVendorWorkOrder]                           NVARCHAR (18)                               NOT NULL,
    [WorkOrderTotal]                               DECIMAL (32, 16)                            NULL,
    [SalesTaxTotal]                                DECIMAL (32, 16)                            NULL,
    [SuperCenter]                                  NVARCHAR (MAX)                              NOT NULL,
    [LaborPMRateDdm]                               DECIMAL (32, 16)                            NULL,
    [LaborPMRateMhe]                               DECIMAL (32, 16)                            NULL,
    [LaborStandardDdm]                             DECIMAL (32, 16)                            NULL,
    [LaborStandardMhe]                             DECIMAL (32, 16)                            NULL,
    [Labor2ManDdm]                                 DECIMAL (32, 16)                            NULL,
    [Labor2ManMhe]                                 DECIMAL (32, 16)                            NULL,
    [LaborOtddmDdm]                                DECIMAL (32, 16)                            NULL,
    [LaborOtmheMhe]                                DECIMAL (32, 16)                            NULL,
    [LaborDdmDdm]                                  DECIMAL (32, 16)                            NULL,
    [LaborDTMheMhe]                                DECIMAL (32, 16)                            NULL,
    [JobInformation]                               NVARCHAR (25)                               NOT NULL,
    [DockFault]                                    NVARCHAR (MAX)                              NOT NULL,
    [DoorFaultI]                                   NVARCHAR (MAX)                              NOT NULL,
    [GroupMiner]                                   NVARCHAR (255)                              NOT NULL,
    [FaultValidation]                              DATETIME2 (7)                               NULL,
    [VendorName]                                   NVARCHAR (18)                               NOT NULL,
    [MeterReadingRequired]                         TINYINT                                     NULL,
    [DrawDate]                                     DATETIME2 (7)                               NULL,
    [ContractInstall]                              DATETIME2 (7)                               NULL,
    [DoorFaultII]                                  NVARCHAR (MAX)                              NOT NULL,
    [SpecWasteFault]                               NVARCHAR (MAX)                              NOT NULL,
    [DockSolutionI]                                NVARCHAR (MAX)                              NOT NULL,
    [InvoiceDenied]                                TINYINT                                     NULL,
    [MheResolutionCode]                            NVARCHAR (255)                              NOT NULL,
    [DockSolutionII]                               NVARCHAR (MAX)                              NOT NULL,
    [DoorSolutionI]                                NVARCHAR (MAX)                              NOT NULL,
    [DoorSolutionII]                               NVARCHAR (MAX)                              NOT NULL,
    [DoorSolutionIII]                              NVARCHAR (MAX)                              NOT NULL,
    [SpecWastSolution]                             NVARCHAR (MAX)                              NOT NULL,
    [EmailServiceReport]                           NVARCHAR (80)                               NOT NULL,
    [SendServiceReporttoCustomer]                  TINYINT                                     NULL,
    [EstimateNeeded]                               TINYINT                                     NULL,
    [ContractAmount]                               DECIMAL (32, 16)                            NULL,
    [ChangeOrderAmt]                               DECIMAL (32, 16)                            NULL,
    [Notes]                                        NVARCHAR (MAX)                              NOT NULL,
    [Retainage]                                    TINYINT                                     NULL,
    [RetainagePercentage]                          DECIMAL (32, 16)                            NULL,
    [ParentWorkOrder]                              NVARCHAR (18)                               NOT NULL,
    [WorkOrderMargin]                              DECIMAL (32, 16)                            NULL,
    [ChangeOrderAmt2]                              DECIMAL (32, 16)                            NULL,
    [ChangeOrderAmt3]                              DECIMAL (32, 16)                            NULL,
    [ChangeOrderAmt4]                              DECIMAL (32, 16)                            NULL,
    [SignatureName]                                NVARCHAR (100)                              NOT NULL,
    [Companycode]                                  NVARCHAR (MAX)                              NOT NULL,
    [PartsNeededc]                                 TINYINT                                     NULL,
    [EstimatePartsNotes]                           NVARCHAR (MAX)                              NOT NULL,
    [WorkOrderMarginc2]                            DECIMAL (32, 16)                            NULL,
    [ContractTotal]                                DECIMAL (32, 16)                            NULL,
    [WorkFinished]                                 TINYINT                                     NULL,
    [InstalledProductName]                         NVARCHAR (150)                              NOT NULL,
    [BroadIPwo]                                    NVARCHAR (MAX)                              NOT NULL,
    [GroupIPwo]                                    NVARCHAR (MAX)                              NOT NULL,
    [ServiceDateI]                                 NVARCHAR (8)                                NOT NULL,
    [LastWorkPerformed]                            NVARCHAR (MAX)                              NOT NULL,
    [JobHistory]                                   NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxFinishedOnsiteDateTime]             DATETIME2 (7)                               NULL,
    [ServiceMaxSchedulingChangeToken]              NVARCHAR (255)                              NOT NULL,
    [Salesperson]                                  NVARCHAR (18)                               NOT NULL,
    [InvoiceDateI]                                 NVARCHAR (8)                                NOT NULL,
    [Locked]                                       TINYINT                                     NULL,
    [LastMeterReading]                             DECIMAL (32, 16)                            NULL,
    [CustomerQueue]                                NVARCHAR (100)                              NOT NULL,
    [SalespersonWorkOrder]                         NVARCHAR (18)                               NOT NULL,
    [PartsCost]                                    DECIMAL (32, 16)                            NULL,
    [TotalWorkOrderwTax]                           DECIMAL (32, 16)                            NULL,
    [RejectedInvoiceAmount]                        DECIMAL (32, 16)                            NULL,
    [LaborCost]                                    DECIMAL (32, 16)                            NULL,
    [WorkPerformedTfs]                             NVARCHAR (MAX)                              NOT NULL,
    [InvoicePostToPeriod]                          NVARCHAR (7)                                NOT NULL,
    [DocumentNumber]                               NVARCHAR (MAX)                              NOT NULL,
    [InvoiceDocument]                              NVARCHAR (25)                               NOT NULL,
    [MakeIP]                                       NVARCHAR (MAX)                              NOT NULL,
    [ModelIP]                                      NVARCHAR (MAX)                              NOT NULL,
    [TotalInvoiced]                                DECIMAL (32, 16)                            NULL,
    [VendorInvoiceTotal]                           DECIMAL (32, 16)                            NULL,
    [SLInvoiceDate]                                DATETIME2 (7)                               NULL,
    [Salesperson2ndWorkOrder]                      NVARCHAR (18)                               NOT NULL,
    [LocationName]                                 NVARCHAR (100)                              NOT NULL,
    [TaxExemptProject]                             TINYINT                                     NULL,
    [EquipSalesInfo]                               NVARCHAR (MAX)                              NOT NULL,
    [LastMeterReadingDate]                         DATETIME2 (7)                               NULL,
    [LastPmDate]                                   DATETIME2 (7)                               NULL,
    [LastPmMeterReading]                           DECIMAL (32, 16)                            NULL,
    [PmDateDiff]                                   DECIMAL (32, 16)                            NULL,
    [PmMeterDiff]                                  DECIMAL (32, 16)                            NULL,
    [Certificate]                                  NVARCHAR (25)                               NOT NULL,
    [RejectionOverride]                            TINYINT                                     NULL,
    [PermanentRejection]                           TINYINT                                     NULL,
    [IPWarrantyEndDate]                            DATETIME2 (7)                               NULL,
    [DaysLeftUnderWarranty]                        DECIMAL (32, 16)                            NULL,
    [MeterLeftUnderWarranty]                       DECIMAL (32, 16)                            NULL,
    [ApprovalRequested]                            DATETIME2 (7)                               NULL,
    [ApprovalStatus]                               NVARCHAR (255)                              NOT NULL,
    [AssignedApprover]                             NVARCHAR (100)                              NOT NULL,
    [StaticDocNumber]                              NVARCHAR (25)                               NOT NULL,
    [InvoiceReceivedDateI]                         NVARCHAR (8)                                NOT NULL,
    [InvoiceReceivedDate]                          DATETIME2 (7)                               NULL,
    [AssetMgmtFees]                                DECIMAL (32, 16)                            NULL,
    [TfsAmfWorkOrder]                              TINYINT                                     NULL,
    [TaxCost]                                      DECIMAL (32, 16)                            NULL,
    [IPDepartment]                                 NVARCHAR (100)                              NOT NULL,
    [CongaVendorName]                              NVARCHAR (MAX)                              NOT NULL,
    [DrawDateNew]                                  NVARCHAR (4)                                NOT NULL,
    [DocNumberDate]                                DATETIME2 (7)                               NULL,
    [ServiceReportFinalized]                       TINYINT                                     NULL,
    [ServiceReportReceived]                        TINYINT                                     NULL,
    [SuperCenterName]                              NVARCHAR (MAX)                              NOT NULL,
    [SuperCenter2]                                 NVARCHAR (18)                               NOT NULL,
    [FirstTimeDispatched]                          DATETIME2 (7)                               NULL,
    [ResponseTime]                                 DECIMAL (32, 16)                            NULL,
    [DateTimeInvoiceCompleted]                     DATETIME2 (7)                               NULL,
    [DateTimeJobWorkComplete]                      DATETIME2 (7)                               NULL,
    [TimeToJobWorkComplete]                        DECIMAL (32, 16)                            NULL,
    [TimeToInvoiceCompleted]                       DECIMAL (32, 16)                            NULL,
    [Segment]                                      NVARCHAR (18)                               NOT NULL,
    [CanadianQSTPST]                               DECIMAL (32, 16)                            NULL,
    [CanadianGSTHSTTPS]                            DECIMAL (32, 16)                            NULL,
    [CanadianQSTPSTTVQ]                            DECIMAL (32, 16)                            NULL,
    [InvoicedLines]                                NVARCHAR (MAX)                              NOT NULL,
    [TimetoBookRevenue]                            DECIMAL (32, 16)                            NULL,
    [EditQuotedValues]                             TINYINT                                     NULL,
    [NonBillableItemApprovalStatus]                NVARCHAR (255)                              NOT NULL,
    [QuotedTotal]                                  DECIMAL (32, 16)                            NULL,
    [WorkOrderType]                                NVARCHAR (255)                              NOT NULL,
    [NonBillableLineItems]                         DECIMAL (32, 16)                            NULL,
    [NotBillablefromiPad]                          DECIMAL (32, 16)                            NULL,
    [ServiceNotes]                                 NVARCHAR (MAX)                              NOT NULL,
    [ServiceMaxSMLJSMinimumScheduleDuration]       DECIMAL (32, 16)                            NULL,
    [LastUpdate]                                   DATETIME2 (7)                               NOT NULL,
    [ImportDate]                                   DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                                    DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                                      DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKServiceMaxServiceOrder] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SF].[ServiceMaxServiceOrderHistory], DATA_CONSISTENCY_CHECK=ON));




GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ServiceMaxServiceOrder_Id]
    ON [SF].[ServiceMaxServiceOrder]([Id] ASC);

