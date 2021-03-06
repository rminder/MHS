﻿CREATE TABLE [SL].[ARHist] (
    [AccruedRevBegBal] FLOAT (53)    NOT NULL,
    [BegBal]           FLOAT (53)    NOT NULL,
    [CpnyID]           CHAR (10)     NOT NULL,
    [Crtd_DateTime]    SMALLDATETIME NOT NULL,
    [Crtd_Prog]        CHAR (8)      NOT NULL,
    [Crtd_User]        CHAR (10)     NOT NULL,
    [CuryID]           CHAR (4)      NOT NULL,
    [CustId]           CHAR (15)     NOT NULL,
    [FiscYr]           CHAR (4)      NOT NULL,
    [LUpd_DateTime]    SMALLDATETIME NOT NULL,
    [LUpd_Prog]        CHAR (8)      NOT NULL,
    [LUpd_User]        CHAR (10)     NOT NULL,
    [NbrInvcPaid00]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid01]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid02]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid03]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid04]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid05]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid06]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid07]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid08]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid09]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid10]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid11]    FLOAT (53)    NOT NULL,
    [NbrInvcPaid12]    FLOAT (53)    NOT NULL,
    [NoteId]           INT           NOT NULL,
    [PaidInvcDays00]   FLOAT (53)    NOT NULL,
    [PaidInvcDays01]   FLOAT (53)    NOT NULL,
    [PaidInvcDays02]   FLOAT (53)    NOT NULL,
    [PaidInvcDays03]   FLOAT (53)    NOT NULL,
    [PaidInvcDays04]   FLOAT (53)    NOT NULL,
    [PaidInvcDays05]   FLOAT (53)    NOT NULL,
    [PaidInvcDays06]   FLOAT (53)    NOT NULL,
    [PaidInvcDays07]   FLOAT (53)    NOT NULL,
    [PaidInvcDays08]   FLOAT (53)    NOT NULL,
    [PaidInvcDays09]   FLOAT (53)    NOT NULL,
    [PaidInvcDays10]   FLOAT (53)    NOT NULL,
    [PaidInvcDays11]   FLOAT (53)    NOT NULL,
    [PaidInvcDays12]   FLOAT (53)    NOT NULL,
    [PerNbr]           CHAR (6)      NOT NULL,
    [PTDAccruedRev00]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev01]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev02]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev03]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev04]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev05]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev06]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev07]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev08]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev09]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev10]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev11]  FLOAT (53)    NOT NULL,
    [PTDAccruedRev12]  FLOAT (53)    NOT NULL,
    [PTDCOGS00]        FLOAT (53)    NOT NULL,
    [PTDCOGS01]        FLOAT (53)    NOT NULL,
    [PTDCOGS02]        FLOAT (53)    NOT NULL,
    [PTDCOGS03]        FLOAT (53)    NOT NULL,
    [PTDCOGS04]        FLOAT (53)    NOT NULL,
    [PTDCOGS05]        FLOAT (53)    NOT NULL,
    [PTDCOGS06]        FLOAT (53)    NOT NULL,
    [PTDCOGS07]        FLOAT (53)    NOT NULL,
    [PTDCOGS08]        FLOAT (53)    NOT NULL,
    [PTDCOGS09]        FLOAT (53)    NOT NULL,
    [PTDCOGS10]        FLOAT (53)    NOT NULL,
    [PTDCOGS11]        FLOAT (53)    NOT NULL,
    [PTDCOGS12]        FLOAT (53)    NOT NULL,
    [PTDCrMemo00]      FLOAT (53)    NOT NULL,
    [PTDCrMemo01]      FLOAT (53)    NOT NULL,
    [PTDCrMemo02]      FLOAT (53)    NOT NULL,
    [PTDCrMemo03]      FLOAT (53)    NOT NULL,
    [PTDCrMemo04]      FLOAT (53)    NOT NULL,
    [PTDCrMemo05]      FLOAT (53)    NOT NULL,
    [PTDCrMemo06]      FLOAT (53)    NOT NULL,
    [PTDCrMemo07]      FLOAT (53)    NOT NULL,
    [PTDCrMemo08]      FLOAT (53)    NOT NULL,
    [PTDCrMemo09]      FLOAT (53)    NOT NULL,
    [PTDCrMemo10]      FLOAT (53)    NOT NULL,
    [PTDCrMemo11]      FLOAT (53)    NOT NULL,
    [PTDCrMemo12]      FLOAT (53)    NOT NULL,
    [PTDDisc00]        FLOAT (53)    NOT NULL,
    [PTDDisc01]        FLOAT (53)    NOT NULL,
    [PTDDisc02]        FLOAT (53)    NOT NULL,
    [PTDDisc03]        FLOAT (53)    NOT NULL,
    [PTDDisc04]        FLOAT (53)    NOT NULL,
    [PTDDisc05]        FLOAT (53)    NOT NULL,
    [PTDDisc06]        FLOAT (53)    NOT NULL,
    [PTDDisc07]        FLOAT (53)    NOT NULL,
    [PTDDisc08]        FLOAT (53)    NOT NULL,
    [PTDDisc09]        FLOAT (53)    NOT NULL,
    [PTDDisc10]        FLOAT (53)    NOT NULL,
    [PTDDisc11]        FLOAT (53)    NOT NULL,
    [PTDDisc12]        FLOAT (53)    NOT NULL,
    [PTDDrMemo00]      FLOAT (53)    NOT NULL,
    [PTDDrMemo01]      FLOAT (53)    NOT NULL,
    [PTDDrMemo02]      FLOAT (53)    NOT NULL,
    [PTDDrMemo03]      FLOAT (53)    NOT NULL,
    [PTDDrMemo04]      FLOAT (53)    NOT NULL,
    [PTDDrMemo05]      FLOAT (53)    NOT NULL,
    [PTDDrMemo06]      FLOAT (53)    NOT NULL,
    [PTDDrMemo07]      FLOAT (53)    NOT NULL,
    [PTDDrMemo08]      FLOAT (53)    NOT NULL,
    [PTDDrMemo09]      FLOAT (53)    NOT NULL,
    [PTDDrMemo10]      FLOAT (53)    NOT NULL,
    [PTDDrMemo11]      FLOAT (53)    NOT NULL,
    [PTDDrMemo12]      FLOAT (53)    NOT NULL,
    [PTDFinChrg00]     FLOAT (53)    NOT NULL,
    [PTDFinChrg01]     FLOAT (53)    NOT NULL,
    [PTDFinChrg02]     FLOAT (53)    NOT NULL,
    [PTDFinChrg03]     FLOAT (53)    NOT NULL,
    [PTDFinChrg04]     FLOAT (53)    NOT NULL,
    [PTDFinChrg05]     FLOAT (53)    NOT NULL,
    [PTDFinChrg06]     FLOAT (53)    NOT NULL,
    [PTDFinChrg07]     FLOAT (53)    NOT NULL,
    [PTDFinChrg08]     FLOAT (53)    NOT NULL,
    [PTDFinChrg09]     FLOAT (53)    NOT NULL,
    [PTDFinChrg10]     FLOAT (53)    NOT NULL,
    [PTDFinChrg11]     FLOAT (53)    NOT NULL,
    [PTDFinChrg12]     FLOAT (53)    NOT NULL,
    [PTDRcpt00]        FLOAT (53)    NOT NULL,
    [PTDRcpt01]        FLOAT (53)    NOT NULL,
    [PTDRcpt02]        FLOAT (53)    NOT NULL,
    [PTDRcpt03]        FLOAT (53)    NOT NULL,
    [PTDRcpt04]        FLOAT (53)    NOT NULL,
    [PTDRcpt05]        FLOAT (53)    NOT NULL,
    [PTDRcpt06]        FLOAT (53)    NOT NULL,
    [PTDRcpt07]        FLOAT (53)    NOT NULL,
    [PTDRcpt08]        FLOAT (53)    NOT NULL,
    [PTDRcpt09]        FLOAT (53)    NOT NULL,
    [PTDRcpt10]        FLOAT (53)    NOT NULL,
    [PTDRcpt11]        FLOAT (53)    NOT NULL,
    [PTDRcpt12]        FLOAT (53)    NOT NULL,
    [PTDSales00]       FLOAT (53)    NOT NULL,
    [PTDSales01]       FLOAT (53)    NOT NULL,
    [PTDSales02]       FLOAT (53)    NOT NULL,
    [PTDSales03]       FLOAT (53)    NOT NULL,
    [PTDSales04]       FLOAT (53)    NOT NULL,
    [PTDSales05]       FLOAT (53)    NOT NULL,
    [PTDSales06]       FLOAT (53)    NOT NULL,
    [PTDSales07]       FLOAT (53)    NOT NULL,
    [PTDSales08]       FLOAT (53)    NOT NULL,
    [PTDSales09]       FLOAT (53)    NOT NULL,
    [PTDSales10]       FLOAT (53)    NOT NULL,
    [PTDSales11]       FLOAT (53)    NOT NULL,
    [PTDSales12]       FLOAT (53)    NOT NULL,
    [YTDAccruedRev]    FLOAT (53)    NOT NULL,
    [YtdCOGS]          FLOAT (53)    NOT NULL,
    [YtdCrMemo]        FLOAT (53)    NOT NULL,
    [YtdDisc]          FLOAT (53)    NOT NULL,
    [YtdDrMemo]        FLOAT (53)    NOT NULL,
    [YtdFinChrg]       FLOAT (53)    NOT NULL,
    [YtdRcpt]          FLOAT (53)    NOT NULL,
    [YtdSales]         FLOAT (53)    NOT NULL,
    [RowVersion]       BIGINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ARHist0] PRIMARY KEY CLUSTERED ([CustId] ASC, [CpnyID] ASC, [FiscYr] ASC)
);



