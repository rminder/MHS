CREATE TABLE [SL].[AccountHist] (
    [RowId]                    INT           NOT NULL,
    [Account]                  VARCHAR (10)  NOT NULL,
    [AccountType]              VARCHAR (2)   NOT NULL,
    [AccountCategory]          VARCHAR (16)  NOT NULL,
    [AccountCategorySpecified] CHAR (1)      NOT NULL,
    [Active]                   INT           NOT NULL,
    [ClassId]                  VARCHAR (10)  NOT NULL,
    [ConsolidationAccount]     VARCHAR (10)  NOT NULL,
    [CurrencyId]               VARCHAR (4)   NOT NULL,
    [Description]              VARCHAR (30)  NOT NULL,
    [RatioGroup]               VARCHAR (2)   NOT NULL,
    [IsSummarized]             CHAR (1)      NOT NULL,
    [LastUpdate]               DATETIME2 (7) NOT NULL,
    [ImportDate]               DATETIME2 (7) NOT NULL,
    [ValidFrom]                DATETIME2 (7) NOT NULL,
    [ValidTo]                  DATETIME2 (7) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_AccountHist]
    ON [SL].[AccountHist]([ValidTo] ASC, [ValidFrom] ASC);

