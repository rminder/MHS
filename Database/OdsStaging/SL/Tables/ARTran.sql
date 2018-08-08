﻿CREATE TABLE [SL].[ARTran] (
    [Acct]               CHAR (10)     NOT NULL,
    [AcctDist]           SMALLINT      NOT NULL,
    [BatNbr]             CHAR (10)     NOT NULL,
    [CmmnPct]            FLOAT (53)    NOT NULL,
    [CnvFact]            FLOAT (53)    NOT NULL,
    [ContractID]         CHAR (10)     NOT NULL,
    [CostType]           CHAR (8)      NOT NULL,
    [CpnyID]             CHAR (10)     NOT NULL,
    [Crtd_DateTime]      SMALLDATETIME NOT NULL,
    [Crtd_Prog]          CHAR (8)      NOT NULL,
    [Crtd_User]          CHAR (10)     NOT NULL,
    [CuryExtCost]        FLOAT (53)    NOT NULL,
    [CuryId]             CHAR (4)      NOT NULL,
    [CuryMultDiv]        CHAR (1)      NOT NULL,
    [CuryRate]           FLOAT (53)    NOT NULL,
    [CuryTaxAmt00]       FLOAT (53)    NOT NULL,
    [CuryTaxAmt01]       FLOAT (53)    NOT NULL,
    [CuryTaxAmt02]       FLOAT (53)    NOT NULL,
    [CuryTaxAmt03]       FLOAT (53)    NOT NULL,
    [CuryTranAmt]        FLOAT (53)    NOT NULL,
    [CuryTxblAmt00]      FLOAT (53)    NOT NULL,
    [CuryTxblAmt01]      FLOAT (53)    NOT NULL,
    [CuryTxblAmt02]      FLOAT (53)    NOT NULL,
    [CuryTxblAmt03]      FLOAT (53)    NOT NULL,
    [CuryUnitPrice]      FLOAT (53)    NOT NULL,
    [CustId]             CHAR (15)     NOT NULL,
    [DrCr]               CHAR (1)      NOT NULL,
    [Excpt]              SMALLINT      NOT NULL,
    [ExtCost]            FLOAT (53)    NOT NULL,
    [ExtRefNbr]          CHAR (15)     NOT NULL,
    [FiscYr]             CHAR (4)      NOT NULL,
    [FlatRateLineNbr]    SMALLINT      NOT NULL,
    [InstallNbr]         SMALLINT      NOT NULL,
    [InvtId]             CHAR (30)     NOT NULL,
    [JobRate]            FLOAT (53)    NOT NULL,
    [JrnlType]           CHAR (3)      NOT NULL,
    [LineId]             INT           NOT NULL,
    [LineNbr]            SMALLINT      NOT NULL,
    [LineRef]            CHAR (5)      NOT NULL,
    [LUpd_DateTime]      SMALLDATETIME NOT NULL,
    [LUpd_Prog]          CHAR (8)      NOT NULL,
    [LUpd_User]          CHAR (10)     NOT NULL,
    [MasterDocNbr]       CHAR (10)     NOT NULL,
    [NoteId]             INT           NOT NULL,
    [OrdNbr]             CHAR (15)     NOT NULL,
    [PC_Flag]            CHAR (1)      NOT NULL,
    [PC_ID]              CHAR (20)     NOT NULL,
    [PC_Status]          CHAR (1)      NOT NULL,
    [PerEnt]             CHAR (6)      NOT NULL,
    [PerPost]            CHAR (6)      NOT NULL,
    [ProjectID]          CHAR (16)     NOT NULL,
    [Qty]                FLOAT (53)    NOT NULL,
    [RecordID]           INT           NOT NULL,
    [RefNbr]             CHAR (10)     NOT NULL,
    [Rlsed]              SMALLINT      NOT NULL,
    [S4Future01]         CHAR (30)     NOT NULL,
    [S4Future02]         CHAR (30)     NOT NULL,
    [S4Future03]         FLOAT (53)    NOT NULL,
    [S4Future04]         FLOAT (53)    NOT NULL,
    [S4Future05]         FLOAT (53)    NOT NULL,
    [S4Future06]         FLOAT (53)    NOT NULL,
    [S4Future07]         SMALLDATETIME NOT NULL,
    [S4Future08]         SMALLDATETIME NOT NULL,
    [S4Future09]         INT           NOT NULL,
    [S4Future10]         INT           NOT NULL,
    [S4Future11]         CHAR (10)     NOT NULL,
    [S4Future12]         CHAR (10)     NOT NULL,
    [ServiceCallID]      CHAR (10)     NOT NULL,
    [ServiceCallLineNbr] SMALLINT      NOT NULL,
    [ServiceDate]        SMALLDATETIME NOT NULL,
    [ShipperCpnyID]      CHAR (10)     NOT NULL,
    [ShipperID]          CHAR (15)     NOT NULL,
    [ShipperLineRef]     CHAR (5)      NOT NULL,
    [SiteId]             CHAR (10)     NOT NULL,
    [SlsperId]           CHAR (10)     NOT NULL,
    [SpecificCostID]     CHAR (25)     NOT NULL,
    [Sub]                CHAR (24)     NOT NULL,
    [TaskID]             CHAR (32)     NOT NULL,
    [TaxAmt00]           FLOAT (53)    NOT NULL,
    [TaxAmt01]           FLOAT (53)    NOT NULL,
    [TaxAmt02]           FLOAT (53)    NOT NULL,
    [TaxAmt03]           FLOAT (53)    NOT NULL,
    [TaxCalced]          CHAR (1)      NOT NULL,
    [TaxCat]             CHAR (10)     NOT NULL,
    [TaxId00]            CHAR (10)     NOT NULL,
    [TaxId01]            CHAR (10)     NOT NULL,
    [TaxId02]            CHAR (10)     NOT NULL,
    [TaxId03]            CHAR (10)     NOT NULL,
    [TaxIdDflt]          CHAR (10)     NOT NULL,
    [TranAmt]            FLOAT (53)    NOT NULL,
    [TranClass]          CHAR (1)      NOT NULL,
    [TranDate]           SMALLDATETIME NOT NULL,
    [TranDesc]           CHAR (30)     NOT NULL,
    [TranType]           CHAR (2)      NOT NULL,
    [TxblAmt00]          FLOAT (53)    NOT NULL,
    [TxblAmt01]          FLOAT (53)    NOT NULL,
    [TxblAmt02]          FLOAT (53)    NOT NULL,
    [TxblAmt03]          FLOAT (53)    NOT NULL,
    [UnitDesc]           CHAR (6)      NOT NULL,
    [UnitPrice]          FLOAT (53)    NOT NULL,
    [User1]              CHAR (30)     NOT NULL,
    [User2]              CHAR (30)     NOT NULL,
    [User3]              FLOAT (53)    NOT NULL,
    [User4]              FLOAT (53)    NOT NULL,
    [User5]              CHAR (10)     NOT NULL,
    [User6]              CHAR (10)     NOT NULL,
    [User7]              SMALLDATETIME NOT NULL,
    [User8]              SMALLDATETIME NOT NULL,
    [WhseLoc]            CHAR (10)     NOT NULL,
    [tstamp]             ROWVERSION    NOT NULL,
    CONSTRAINT [ARTran0] PRIMARY KEY CLUSTERED ([CustId] ASC, [TranType] ASC, [RefNbr] ASC, [LineNbr] ASC, [RecordID] ASC)
);
