CREATE TABLE [Pay].[WebTime] (
    [RowId]                  INT                                         IDENTITY (1, 1) NOT NULL,
    [CompanyId]              INT                                         NOT NULL,
    [EmployeeId]             INT                                         NOT NULL,
    [PunchId]                INT                                         NOT NULL,
    [BadgeNumber]            INT                                         NOT NULL,
    [LastName]               VARCHAR (50)                                NOT NULL,
    [FirstName]              VARCHAR (50)                                NOT NULL,
    [MiddleInitial]          CHAR (1)                                    NOT NULL,
    [Title]                  VARCHAR (50)                                NOT NULL,
    [PersonalEmail]          VARCHAR (50)                                NOT NULL,
    [WorkEmail]              VARCHAR (50)                                NOT NULL,
    [MobileNumber]           VARCHAR (50)                                NOT NULL,
    [PayDescription]         VARCHAR (50)                                NOT NULL,
    [PayType]                VARCHAR (50)                                NOT NULL,
    [Date]                   DATE                                        NOT NULL,
    [RoundedTimeIn]          VARCHAR (20)                                NOT NULL,
    [RoundedTimeOut]         VARCHAR (20)                                NOT NULL,
    [ActualTimeIn]           VARCHAR (20)                                NOT NULL,
    [ActualTimeOut]          VARCHAR (20)                                NOT NULL,
    [Hours]                  DECIMAL (5, 2)                              NULL,
    [PunchType]              VARCHAR (20)                                NOT NULL,
    [LaborLevel1Code]        VARCHAR (20)                                NOT NULL,
    [LaborLevel1Description] VARCHAR (50)                                NOT NULL,
    [LaborLevel2Code]        VARCHAR (20)                                NOT NULL,
    [LaborLevel2Description] VARCHAR (50)                                NOT NULL,
    [LaborLevel3Code]        VARCHAR (20)                                NOT NULL,
    [LaborLevel3Description] VARCHAR (50)                                NOT NULL,
    [LaborLevel4Code]        VARCHAR (20)                                NOT NULL,
    [LaborLevel4Description] VARCHAR (50)                                NOT NULL,
    [LaborLevel5Code]        VARCHAR (20)                                NOT NULL,
    [LaborLevel5Description] VARCHAR (50)                                NOT NULL,
    [LastUpdate]             DATETIME2 (7)                               NOT NULL,
    [ImportDate]             DATETIME2 (7)                               NOT NULL,
    [ImportFileName]         VARCHAR (80)                                NOT NULL,
    [ValidFrom]              DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PKWebTime] PRIMARY KEY CLUSTERED ([RowId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Pay].[WebTimeHistory], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_WebTime_CompanyId_EmployeeId_PunchId_PayDescription_Date_ActualTimeIn]
    ON [Pay].[WebTime]([CompanyId] ASC, [EmployeeId] ASC, [PunchId] ASC, [PayDescription] ASC, [Date] ASC, [ActualTimeIn] ASC);

