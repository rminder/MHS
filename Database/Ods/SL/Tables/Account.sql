CREATE TABLE [SL].[Account] (
    [RowId]                    INT                                         IDENTITY (1, 1) NOT NULL,
    [Account]                  VARCHAR (10)                                NOT NULL,
    [AccountType]              VARCHAR (2)                                 NOT NULL,
    [AccountCategory]          VARCHAR (16)                                NOT NULL,
    [AccountCategorySpecified] CHAR (1)                                    NOT NULL,
    [Active]                   INT                                         NOT NULL,
    [ClassId]                  VARCHAR (10)                                NOT NULL,
    [ConsolidationAccount]     VARCHAR (10)                                NOT NULL,
    [CurrencyId]               VARCHAR (4)                                 NOT NULL,
    [Description]              VARCHAR (30)                                NOT NULL,
    [RatioGroup]               VARCHAR (2)                                 NOT NULL,
    [IsSummarized]             CHAR (1)                                    NOT NULL,
    [LastUpdate]               DATETIME2 (7)                               NOT NULL,
    [ImportDate]               DATETIME2 (7)                               NOT NULL,
    [ValidFrom]                DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                  DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKAccount] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[AccountHist], DATA_CONSISTENCY_CHECK=ON));

