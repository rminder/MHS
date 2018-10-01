CREATE TABLE [SL].[AccountsReceivableBalanceHistory] (
    [RowId]                      INT              NOT NULL,
    [AgeBalance00]               DECIMAL (32, 16) NOT NULL,
    [AgeBalance01]               DECIMAL (32, 16) NOT NULL,
    [AgeBalance02]               DECIMAL (32, 16) NOT NULL,
    [AgeBalance03]               DECIMAL (32, 16) NOT NULL,
    [AgeBalance04]               DECIMAL (32, 16) NOT NULL,
    [AverageDaysToPay]           DECIMAL (32, 16) NOT NULL,
    [CompanyId]                  VARCHAR (10)     NOT NULL,
    [CreditLImit]                DECIMAL (32, 16) NOT NULL,
    [CurrentBalance]             DECIMAL (32, 16) NOT NULL,
    [CurrencyId]                 VARCHAR (4)      NOT NULL,
    [CustomerId]                 VARCHAR (15)     NOT NULL,
    [FutureBalance]              DECIMAL (32, 16) NOT NULL,
    [LastActivityDate]           DATETIME2 (7)    NOT NULL,
    [LastAgingDate]              DATETIME2 (7)    NOT NULL,
    [LastFinanceChargesDate]     DATETIME2 (7)    NOT NULL,
    [LastInvoiceDate]            DATETIME2 (7)    NOT NULL,
    [LastStatementBalance00]     DECIMAL (32, 16) NOT NULL,
    [LastStatementBalance01]     DECIMAL (32, 16) NOT NULL,
    [LastStatementBalance02]     DECIMAL (32, 16) NOT NULL,
    [LastStatementBalance03]     DECIMAL (32, 16) NOT NULL,
    [LastStatementBalance04]     DECIMAL (32, 16) NOT NULL,
    [LastStatementBeginBalance]  DECIMAL (32, 16) NOT NULL,
    [LastStatementDate]          DATETIME2 (7)    NOT NULL,
    [NumberOfInvoicesPaid]       DECIMAL (32, 16) NOT NULL,
    [NoteId]                     INT              NOT NULL,
    [PaidInvoiceDays]            DECIMAL (32, 16) NOT NULL,
    [PeriodNumber]               VARCHAR (6)      NOT NULL,
    [TotalOutstandingOpenOrders] DECIMAL (32, 16) NOT NULL,
    [TotalPrePaid]               DECIMAL (32, 16) NOT NULL,
    [TotalShipped]               DECIMAL (32, 16) NOT NULL,
    [LastUpdate]                 DATETIME2 (7)    NOT NULL,
    [ImportDate]                 DATETIME2 (7)    NOT NULL,
    [ValidFrom]                  DATETIME2 (7)    NOT NULL,
    [ValidTo]                    DATETIME2 (7)    NOT NULL,
    [RowVersion]                 BIGINT           NOT NULL
);




GO
CREATE NONCLUSTERED INDEX [IX_AccountsReceivableBalanceHistory_RowId]
    ON [SL].[AccountsReceivableBalanceHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_AccountsReceivableBalanceHistory]
    ON [SL].[AccountsReceivableBalanceHistory]([ValidTo] ASC, [ValidFrom] ASC);

