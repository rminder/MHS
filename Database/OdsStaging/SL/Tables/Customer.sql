﻿CREATE TABLE [SL].[Customer] (
    [AccrRevAcct]       CHAR (10)     NOT NULL,
    [AccrRevSub]        CHAR (24)     NOT NULL,
    [AcctNbr]           CHAR (30)     NOT NULL,
    [Addr1]             CHAR (60)     NOT NULL,
    [Addr2]             CHAR (60)     NOT NULL,
    [AgentID]           CHAR (10)     NOT NULL,
    [ApplFinChrg]       SMALLINT      NOT NULL,
    [ArAcct]            CHAR (10)     NOT NULL,
    [ArSub]             CHAR (24)     NOT NULL,
    [Attn]              CHAR (30)     NOT NULL,
    [AutoApply]         SMALLINT      NOT NULL,
    [BankID]            CHAR (10)     NOT NULL,
    [BillAddr1]         CHAR (60)     NOT NULL,
    [BillAddr2]         CHAR (60)     NOT NULL,
    [BillAttn]          CHAR (30)     NOT NULL,
    [BillCity]          CHAR (30)     NOT NULL,
    [BillCountry]       CHAR (3)      NOT NULL,
    [BillFax]           CHAR (30)     NOT NULL,
    [BillName]          CHAR (60)     NOT NULL,
    [BillPhone]         CHAR (30)     NOT NULL,
    [BillSalut]         CHAR (30)     NOT NULL,
    [BillState]         CHAR (3)      NOT NULL,
    [BillThruProject]   SMALLINT      NOT NULL,
    [BillZip]           CHAR (10)     NOT NULL,
    [CardExpDate]       SMALLDATETIME NOT NULL,
    [CardHldrName]      CHAR (60)     NOT NULL,
    [CardNbr]           CHAR (20)     NOT NULL,
    [CardType]          CHAR (1)      NOT NULL,
    [City]              CHAR (30)     NOT NULL,
    [ClassId]           CHAR (6)      NOT NULL,
    [ConsolInv]         SMALLINT      NOT NULL,
    [Country]           CHAR (3)      NOT NULL,
    [CrLmt]             FLOAT (53)    NOT NULL,
    [Crtd_DateTime]     SMALLDATETIME NOT NULL,
    [Crtd_Prog]         CHAR (8)      NOT NULL,
    [Crtd_User]         CHAR (10)     NOT NULL,
    [CuryId]            CHAR (4)      NOT NULL,
    [CuryPrcLvlRtTp]    CHAR (6)      NOT NULL,
    [CuryRateType]      CHAR (6)      NOT NULL,
    [CustFillPriority]  SMALLINT      NOT NULL,
    [CustId]            CHAR (15)     NOT NULL,
    [DfltShipToId]      CHAR (10)     NOT NULL,
    [DocPublishingFlag] CHAR (1)      NOT NULL,
    [DunMsg]            SMALLINT      NOT NULL,
    [EMailAddr]         CHAR (80)     NOT NULL,
    [Fax]               CHAR (30)     NOT NULL,
    [InvtSubst]         SMALLINT      NOT NULL,
    [LanguageID]        CHAR (4)      NOT NULL,
    [LUpd_DateTime]     SMALLDATETIME NOT NULL,
    [LUpd_Prog]         CHAR (8)      NOT NULL,
    [LUpd_User]         CHAR (10)     NOT NULL,
    [Name]              CHAR (60)     NOT NULL,
    [NoteId]            INT           NOT NULL,
    [OneDraft]          SMALLINT      NOT NULL,
    [PerNbr]            CHAR (6)      NOT NULL,
    [Phone]             CHAR (30)     NOT NULL,
    [PmtMethod]         CHAR (1)      NOT NULL,
    [PrcLvlId]          CHAR (10)     NOT NULL,
    [PrePayAcct]        CHAR (10)     NOT NULL,
    [PrePaySub]         CHAR (24)     NOT NULL,
    [PriceClassID]      CHAR (6)      NOT NULL,
    [PrtMCStmt]         SMALLINT      NOT NULL,
    [PrtStmt]           SMALLINT      NOT NULL,
    [S4Future01]        CHAR (30)     NOT NULL,
    [S4Future02]        CHAR (30)     NOT NULL,
    [S4Future03]        FLOAT (53)    NOT NULL,
    [S4Future04]        FLOAT (53)    NOT NULL,
    [S4Future05]        FLOAT (53)    NOT NULL,
    [S4Future06]        FLOAT (53)    NOT NULL,
    [S4Future07]        SMALLDATETIME NOT NULL,
    [S4Future08]        SMALLDATETIME NOT NULL,
    [S4Future09]        INT           NOT NULL,
    [S4Future10]        INT           NOT NULL,
    [S4Future11]        CHAR (10)     NOT NULL,
    [S4Future12]        CHAR (10)     NOT NULL,
    [Salut]             CHAR (30)     NOT NULL,
    [SetupDate]         SMALLDATETIME NOT NULL,
    [ShipCmplt]         SMALLINT      NOT NULL,
    [ShipPctAct]        CHAR (1)      NOT NULL,
    [ShipPctMax]        FLOAT (53)    NOT NULL,
    [SICCode1]          CHAR (4)      NOT NULL,
    [SICCode2]          CHAR (4)      NOT NULL,
    [SingleInvoice]     SMALLINT      NOT NULL,
    [SlsAcct]           CHAR (10)     NOT NULL,
    [SlsperId]          CHAR (10)     NOT NULL,
    [SlsSub]            CHAR (24)     NOT NULL,
    [State]             CHAR (3)      NOT NULL,
    [Status]            CHAR (1)      NOT NULL,
    [StmtCycleId]       CHAR (2)      NOT NULL,
    [StmtType]          CHAR (1)      NOT NULL,
    [TaxDflt]           CHAR (1)      NOT NULL,
    [TaxExemptNbr]      CHAR (15)     NOT NULL,
    [TaxID00]           CHAR (10)     NOT NULL,
    [TaxID01]           CHAR (10)     NOT NULL,
    [TaxID02]           CHAR (10)     NOT NULL,
    [TaxID03]           CHAR (10)     NOT NULL,
    [TaxLocId]          CHAR (15)     NOT NULL,
    [TaxRegNbr]         CHAR (15)     NOT NULL,
    [Terms]             CHAR (2)      NOT NULL,
    [Territory]         CHAR (10)     NOT NULL,
    [TradeDisc]         FLOAT (53)    NOT NULL,
    [User1]             CHAR (30)     NOT NULL,
    [User2]             CHAR (30)     NOT NULL,
    [User3]             FLOAT (53)    NOT NULL,
    [User4]             FLOAT (53)    NOT NULL,
    [User5]             CHAR (10)     NOT NULL,
    [User6]             CHAR (10)     NOT NULL,
    [User7]             SMALLDATETIME NOT NULL,
    [User8]             SMALLDATETIME NOT NULL,
    [Zip]               CHAR (10)     NOT NULL,
    [tstamp]            ROWVERSION    NOT NULL,
    CONSTRAINT [Customer0] PRIMARY KEY CLUSTERED ([CustId] ASC)
);
