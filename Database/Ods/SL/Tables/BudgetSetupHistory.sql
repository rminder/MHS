﻿CREATE TABLE [SL].[BudgetSetupHistory] (
    [RowId]             INT           NOT NULL,
    [AllowMasking]      BIT           NOT NULL,
    [BudgetLedgerId]    VARCHAR (10)  NOT NULL,
    [BudgetYear]        VARCHAR (4)   NOT NULL,
    [CompanyId]         VARCHAR (10)  NOT NULL,
    [CreateSubaccounts] BIT           NOT NULL,
    [Description]       VARCHAR (30)  NOT NULL,
    [Include13]         BIT           NOT NULL,
    [NumberSegments]    SMALLINT      NOT NULL,
    [SubSeg00]          SMALLINT      NOT NULL,
    [SubSeg01]          SMALLINT      NOT NULL,
    [SubSeg02]          SMALLINT      NOT NULL,
    [SubSeg03]          SMALLINT      NOT NULL,
    [SubSeg04]          SMALLINT      NOT NULL,
    [SubSeg05]          SMALLINT      NOT NULL,
    [SubSeg06]          SMALLINT      NOT NULL,
    [SubSeg07]          SMALLINT      NOT NULL,
    [SubSegMask00]      VARCHAR (24)  NOT NULL,
    [SubSegMask01]      VARCHAR (24)  NOT NULL,
    [SubSegMask02]      VARCHAR (24)  NOT NULL,
    [SubSegMask03]      VARCHAR (24)  NOT NULL,
    [SubSegMask04]      VARCHAR (24)  NOT NULL,
    [SubSegMask05]      VARCHAR (24)  NOT NULL,
    [SubSegMask06]      VARCHAR (24)  NOT NULL,
    [SubSegMask07]      VARCHAR (24)  NOT NULL,
    [Type]              VARCHAR (1)   NOT NULL,
    [UseBudgetGroups]   SMALLINT      NOT NULL,
    [LastUpdate]        DATETIME2 (7) NOT NULL,
    [ImportDate]        DATETIME2 (7) NOT NULL,
    [ValidFrom]         DATETIME2 (7) NOT NULL,
    [ValidTo]           DATETIME2 (7) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_BudgetSetupHistory_RowId]
    ON [SL].[BudgetSetupHistory]([RowId] ASC);


GO
CREATE CLUSTERED INDEX [ix_BudgetSetupHistory]
    ON [SL].[BudgetSetupHistory]([ValidTo] ASC, [ValidFrom] ASC);

