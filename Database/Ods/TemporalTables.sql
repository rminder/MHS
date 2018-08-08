/*
ALTER TABLE [dbo].[TemporalTableDemo] SET ( SYSTEM_VERSIONING = OFF )
GO

Drop Table dbo.TemporalTableDemo
Drop Table dbo.TemporalTableDemoHistory
*/


GO

INSERT INTO dbo.TemporalTableDemo(Account, Description) VALUES('ABC', 'ABC Account 000')
WAITFOR DELAY '00:01:00'

INSERT INTO dbo.TemporalTableDemo(Account, Description) VALUES('DEF', 'DEF Account 000')
WAITFOR DELAY '00:01:00'

INSERT INTO dbo.TemporalTableDemo(Account, Description) VALUES('GHI', 'GHI Account 000')
WAITFOR DELAY '00:01:00'

UPDATE dbo.TemporalTableDemo SET Description = 'ABC Account 001' WHERE Account = 'ABC'
WAITFOR DELAY '00:01:00'

UPDATE dbo.TemporalTableDemo SET Description = 'DEF Account 001' WHERE Account = 'DEF'
WAITFOR DELAY '00:01:00'

UPDATE dbo.TemporalTableDemo SET Description = 'DEF Account 002' WHERE Account = 'DEF'
WAITFOR DELAY '00:01:00'

UPDATE dbo.TemporalTableDemo SET Description = 'ABC Account 002' WHERE Account = 'ABC'
WAITFOR DELAY '00:01:00'

DELETE FROM dbo.TemporalTableDemo WHERE Account = 'ABC'
WAITFOR DELAY '00:01:00'

INSERT INTO dbo.TemporalTableDemo(Account, Description) VALUES('ABC', 'ABC Account 002')
WAITFOR DELAY '00:01:00'

UPDATE dbo.TemporalTableDemo SET Description = 'ABC Account 003' WHERE Account = 'ABC'
WAITFOR DELAY '00:01:00'

DELETE FROM dbo.TemporalTableDemo
WAITFOR DELAY '00:01:00'

INSERT INTO dbo.TemporalTableDemo(Account, Description) VALUES('JKL', 'JKL Account 000')

-- =======================================================================================================================
-- Explore the native T-SQL support for temporal tables
-- =======================================================================================================================

-- History of all data changes
SELECT * 
FROM dbo.TemporalTableDemo
FOR SYSTEM_TIME ALL 
ORDER BY RowId, ValidFrom

-- Get a state of the table at a particular point in time
SELECT * 
FROM dbo.TemporalTableDemo
FOR SYSTEM_TIME AS OF '7/20/2018 11:05:00' 
ORDER BY RowId

-- Find all rows existing (active) between two points in time, including the upper boundary.
SELECT * 
FROM dbo.TemporalTableDemo
FOR SYSTEM_TIME BETWEEN '7/13/2018 18:36:00' AND '7/13/2018 18:37:00'
ORDER BY RowId

-- Find all rows existing (active) between two points in time, excluding the upper boundary.
SELECT * 
FROM dbo.TemporalTableDemo
FOR SYSTEM_TIME FROM '7/13/2018 11:18:30' TO '7/13/2018 11:28:00'
ORDER BY RowId

-- Find all rows opened and closed between two points in time.
SELECT * 
FROM dbo.TemporalTableDemo
FOR SYSTEM_TIME CONTAINED IN('7/13/2018 11:35:12','7/13/2018 11:35:13')
ORDER BY RowId

-- =======================================================================================================================
-- Explore the ODS UDF
-- =======================================================================================================================

DECLARE @StartDateUtc DATETIME2 = '7/30/2018 10:00:00'
DECLARE @EndDateUtc DATETIME2 = '7/30/2018 12:00:00'

-- Complete history
SELECT * 
FROM dbo.TemporalTableDemoGetHistory(@StartDateUtc, @EndDateUtc)
ORDER BY RowId, __OperationDate

-- Summary of inserts, updates and deletes
--SELECT __Operation AS Operation, COUNT(*) AS OperationCount
--FROM dbo.TemporalTableDemoGetHistory(@StartDateUtc, @EndDateUtc)
--GROUP BY __Operation

-- Demonstrate how to link back to the base table.
--SELECT T.*
--FROM dbo.TemporalTableDemoGetHistory(@StartDateUtc, @EndDateUtc) T
--	LEFT JOIN dbo.TemporalTableDemo	T2 ON T2.RowId = T.RowId
--ORDER BY RowId,__OperationDate;

