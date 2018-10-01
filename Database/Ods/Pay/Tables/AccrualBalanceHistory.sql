CREATE TABLE [Pay].[AccrualBalanceHistory] (
    [RowId]                          INT             NOT NULL,
    [CompanyId]                      INT             NOT NULL,
    [EmployeeId]                     VARCHAR (10)    NOT NULL,
    [AccrualCode]                    VARCHAR (20)    NOT NULL,
    [EffectiveDate]                  DATE            NOT NULL,
    [AvailableHours]                 DECIMAL (10, 2) NOT NULL,
    [CurrentPeriodUsedHours]         DECIMAL (10, 2) NOT NULL,
    [CurrentPeriodAccruedHours]      DECIMAL (10, 2) NOT NULL,
    [YearToDateUsedHours]            DECIMAL (10, 2) NOT NULL,
    [YearToDateAccruedHours]         DECIMAL (10, 2) NOT NULL,
    [SocialSecurityNumber]           VARCHAR (20)    NOT NULL,
    [LastUpdate]                     DATETIME2 (7)   NOT NULL,
    [ImportDate]                     DATETIME2 (7)   NOT NULL,
    [ValidFrom]                      DATETIME2 (7)   NOT NULL,
    [ValidTo]                        DATETIME2 (7)   NOT NULL,
    [PreviousPeriodCarriedOverHours] DECIMAL (10, 2) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_AccrualBalanceHistory]
    ON [Pay].[AccrualBalanceHistory]([ValidTo] ASC, [ValidFrom] ASC);

