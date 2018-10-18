CREATE TABLE [Pay].[WebTime] (
    [RowId]                  INT            IDENTITY (1, 1) NOT NULL,
    [CompanyId]              INT            NULL,
    [EmployeeId]             INT            NULL,
    [BadgeNumber]            BIGINT         NULL,
    [LastName]               VARCHAR (50)   NULL,
    [FirstName]              VARCHAR (50)   NULL,
    [MiddleInitial]          CHAR (1)       NULL,
    [Title]                  VARCHAR (50)   NULL,
    [PersonalEmail]          VARCHAR (50)   NULL,
    [WorkEmail]              VARCHAR (50)   NULL,
    [MobileNumber]           VARCHAR (50)   NULL,
    [PayDescription]         VARCHAR (50)   NULL,
    [PayType]                VARCHAR (50)   NULL,
    [Date]                   DATE           NULL,
    [RoundedTimeIn]          VARCHAR (20)   NULL,
    [RoundedTimeOut]         VARCHAR (20)   NULL,
    [ActualTimeIn]           VARCHAR (20)   NULL,
    [ActualTimeOut]          VARCHAR (20)   NULL,
    [Hours]                  DECIMAL (5, 2) NULL,
    [PunchType]              VARCHAR (20)   NULL,
    [LaborLevel1Code]        VARCHAR (20)   NULL,
    [LaborLevel1Description] VARCHAR (50)   NULL,
    [LaborLevel2Code]        VARCHAR (20)   NULL,
    [LaborLevel2Description] VARCHAR (50)   NULL,
    [LaborLevel3Code]        VARCHAR (20)   NULL,
    [LaborLevel3Description] VARCHAR (50)   NULL,
    [LaborLevel4Code]        VARCHAR (20)   NULL,
    [LaborLevel4Description] VARCHAR (50)   NULL,
    [LaborLevel5Code]        VARCHAR (20)   NULL,
    [LaborLevel5Description] VARCHAR (50)   NULL,
    [PunchId]                INT            NULL,
    [FileName]               VARCHAR (80)   CONSTRAINT [DF_WebTime_FileName] DEFAULT ('') NOT NULL,
    [FileDate]               DATE           CONSTRAINT [DF_WebTime_FileDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PKWebTime] PRIMARY KEY CLUSTERED ([RowId] ASC)
);






GO
-- =============================================
-- Author:		Randy Minder
-- Create date: 17-October, 2018
-- Description:	Verify time fields
-- =============================================
CREATE TRIGGER Pay.WebTimeInsertUpdate
   ON  Pay.WebTime
   AFTER INSERT, UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	-- The following time columns are actually represented as strings. However, sometimes Paylocity doesn't
	-- include a leading '0' on them. So, if the length <> 8, add a leading '0'. This is important for 
	-- consistency, but especially important for ActualTimeIn which is part of a unique key.

	UPDATE Pay.WebTime SET ActualTimeIn = '0' + ActualTimeIn WHERE LEN(ActualTimeIn) <> 8 AND LEN(ActualTimeIn) > 0
	UPDATE Pay.WebTime SET ActualTimeOut = '0' + ActualTimeOut WHERE LEN(ActualTimeOut) <> 8 AND LEN(ActualTimeOut) > 0
	UPDATE Pay.WebTime SET RoundedTimeIn = '0' + RoundedTimeIn WHERE LEN(RoundedTimeIn) <> 8 AND LEN(RoundedTimeIn) > 0
	UPDATE Pay.WebTime SET RoundedTimeOut = '0' + RoundedTimeOut WHERE LEN(RoundedTimeOut) <> 8 AND LEN(RoundedTimeOut) > 0

END