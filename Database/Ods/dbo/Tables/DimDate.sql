CREATE TABLE [dbo].[DimDate] (
    [DateKey]              INT          NOT NULL,
    [DateValue]            DATE         NULL,
    [YearDayNumber]        INT          NULL,
    [QuarterDayNumber]     INT          NULL,
    [MonthDayNumber]       INT          NULL,
    [YearMonthNumber]      INT          NULL,
    [MonthDays]            INT          NULL,
    [YearQuarterNumber]    INT          NULL,
    [QuarterDays]          INT          NULL,
    [YearNumber]           INT          NULL,
    [PreviousYear]         INT          NULL,
    [PreviousQuarter]      INT          NULL,
    [PreviousMonth]        INT          NULL,
    [WeekDayNumber]        INT          NULL,
    [DayName]              VARCHAR (10) NULL,
    [YearWeekNumber]       INT          NULL,
    [MonthName]            VARCHAR (10) NULL,
    [YearMonth]            VARCHAR (8)  NULL,
    [WeekFirstDay]         DATE         NULL,
    [WeekLastDay]          DATE         NULL,
    [MonthFirstDay]        DATE         NULL,
    [MonthLastDay]         DATE         NULL,
    [QuarterFirstDay]      DATE         NULL,
    [QuarterLastDay]       DATE         NULL,
    [PrevMonthFirstDay]    DATE         NULL,
    [PrevMonthLastDay]     DATE         NULL,
    [NextMonthFirstDay]    DATE         NULL,
    [NextMonthLastDay]     DATE         NULL,
    [DaylightSavings_flag] BIT          NULL,
    [MonthDayOccurrence]   BIGINT       NULL,
    [CurrentBusDay]        INT          NULL,
    [SalesHoliday]         INT          NOT NULL,
    [SalesHolidayName]     VARCHAR (16) NOT NULL,
    [ServiceHoliday]       INT          NOT NULL,
    [ServiceHolidayName]   VARCHAR (16) NOT NULL,
    [TotSalesBusDay]       INT          NULL,
    [TotServiceBusDay]     INT          NULL
);


GO
CREATE UNIQUE CLUSTERED INDEX [CDX_01_Dim_Date]
    ON [dbo].[DimDate]([DateKey] ASC);

