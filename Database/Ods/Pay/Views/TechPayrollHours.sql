
CREATE VIEW [Pay].[TechPayrollHours]
AS
SELECT        CompanyId, EmployeeId, CASE WHEN PayType = 'Work' THEN PayDescription ELSE 'OTHER' END AS PayDescription, Date, MONTH(Date) AS Month, YEAR(Date) AS Year, Hours AS PeriodHours, LaborLevel1Code, 
                         LaborLevel1Description, LaborLevel2Code, RIGHT(LaborLevel2Code, 4) AS SegmentID, LaborLevel2Description, LaborLevel3Code, LaborLevel3Description, PunchId
FROM            Pay.WebTime
WHERE        (LaborLevel3Code = '10')