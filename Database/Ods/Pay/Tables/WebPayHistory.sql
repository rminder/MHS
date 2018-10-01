CREATE TABLE [Pay].[WebPayHistory] (
    [RowId]                          INT             NOT NULL,
    [CompanyId]                      INT             NOT NULL,
    [EmployeeId]                     VARCHAR (10)    NOT NULL,
    [BadgeNumber]                    VARCHAR (10)    NOT NULL,
    [LastName]                       VARCHAR (25)    NOT NULL,
    [FirstName]                      VARCHAR (25)    NOT NULL,
    [MiddleInitial]                  CHAR (1)        NOT NULL,
    [PersonalEmail]                  VARCHAR (50)    NOT NULL,
    [WorkEmail]                      VARCHAR (50)    NOT NULL,
    [MobileNumber]                   VARCHAR (25)    NOT NULL,
    [PayDescription]                 VARCHAR (10)    NOT NULL,
    [PayType]                        VARCHAR (20)    NOT NULL,
    [PayDate]                        DATE            NOT NULL,
    [RoundedTimeIn]                  VARCHAR (15)    NOT NULL,
    [RoundedTimeOut]                 VARCHAR (15)    NOT NULL,
    [ActualTimeIn]                   VARCHAR (15)    NOT NULL,
    [ActualTimeOut]                  VARCHAR (15)    NOT NULL,
    [Hours]                          DECIMAL (5, 2)  NOT NULL,
    [Rate]                           DECIMAL (7, 3)  NULL,
    [Earnings]                       DECIMAL (10, 2) NULL,
    [PunchType]                      VARCHAR (10)    NOT NULL,
    [LaborLevel1Code]                VARCHAR (10)    NOT NULL,
    [LaborLevel1Description]         VARCHAR (50)    NOT NULL,
    [LaborLevel2Code]                VARCHAR (10)    NOT NULL,
    [LaborLevel2Description]         VARCHAR (50)    NOT NULL,
    [LaborLevel3Code]                VARCHAR (10)    NOT NULL,
    [LaborLevel3Description]         VARCHAR (50)    NOT NULL,
    [LaborLevel4Code]                VARCHAR (10)    NOT NULL,
    [LaborLevel4Description]         VARCHAR (50)    NOT NULL,
    [LaborLevel5Code]                VARCHAR (10)    NOT NULL,
    [LaborLevel5Description]         VARCHAR (50)    NOT NULL,
    [PunchId]                        INT             NOT NULL,
    [LastUpdate]                     DATETIME2 (7)   NOT NULL,
    [ImportDate]                     DATETIME2 (7)   NOT NULL,
    [ValidFrom]                      DATETIME2 (7)   NOT NULL,
    [ValidTo]                        DATETIME2 (7)   NOT NULL,
    [PreviousPeriodCarriedOverHours] DECIMAL (10, 2) NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_WebPayHistory]
    ON [Pay].[WebPayHistory]([ValidTo] ASC, [ValidFrom] ASC);

