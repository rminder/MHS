CREATE TABLE [SL].[BudgetDistributionType] (
    [RowId]              INT                                         IDENTITY (1, 1) NOT NULL,
    [DistributionType]   VARCHAR (8)                                 NOT NULL,
    [Description]        VARCHAR (30)                                NOT NULL,
    [NoteId]             INT                                         NOT NULL,
    [BudgetPercent00]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent01]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent02]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent03]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent04]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent05]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent06]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent07]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent08]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent09]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent10]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercent11]    DECIMAL (32, 16)                            NOT NULL,
    [BudgetPercentTotal] DECIMAL (32, 16)                            NOT NULL,
    [LastUpdate]         DATETIME2 (7)                               NOT NULL,
    [ImportDate]         DATETIME2 (7)                               NOT NULL,
    [ValidFrom]          DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]            DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKBudgetDistributionType] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[SL].[BudgetDistributionTypeHistory], DATA_CONSISTENCY_CHECK=ON));

