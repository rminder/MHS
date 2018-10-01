CREATE TABLE [Pay].[AccrualBalance] (
    [RowId]                          INT                                         IDENTITY (1, 1) NOT NULL,
    [CompanyId]                      INT                                         NOT NULL,
    [EmployeeId]                     VARCHAR (10)                                NOT NULL,
    [AccrualCode]                    VARCHAR (20)                                NOT NULL,
    [EffectiveDate]                  DATE                                        NOT NULL,
    [AvailableHours]                 DECIMAL (10, 2)                             NOT NULL,
    [CurrentPeriodUsedHours]         DECIMAL (10, 2)                             NOT NULL,
    [CurrentPeriodAccruedHours]      DECIMAL (10, 2)                             NOT NULL,
    [YearToDateUsedHours]            DECIMAL (10, 2)                             NOT NULL,
    [YearToDateAccruedHours]         DECIMAL (10, 2)                             NOT NULL,
    [SocialSecurityNumber]           VARCHAR (20)                                DEFAULT ('') NOT NULL,
    [LastUpdate]                     DATETIME2 (7)                               DEFAULT (getdate()) NOT NULL,
    [ImportDate]                     DATETIME2 (7)                               DEFAULT (getdate()) NOT NULL,
    [ValidFrom]                      DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                        DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [PreviousPeriodCarriedOverHours] DECIMAL (10, 2)                             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PKAccount] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Pay].[AccrualBalanceHistory], DATA_CONSISTENCY_CHECK=ON));

