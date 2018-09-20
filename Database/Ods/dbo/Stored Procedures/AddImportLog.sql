-- =============================================================================================================
-- Author:		Randy Minder
-- Create date: 21-July, 2018
-- Description:	Write an entry to dbo.ImportLog table.
--
-- Exec dbo.AddImportLogSuccess 'Package', '7/20/2018 16:48:00', 'DB171734-53B5-46E7-9B3C-079FDA734185', 17, 0
-- =============================================================================================================
CREATE PROCEDURE [dbo].[AddImportLog]
	@PackageName VARCHAR(80),
	@EntryType VARCHAR(20),
	@ExecutionStartTime DATETIME, -- The MHS SSIS server is already passing the date as UTC. No need to convert.
    @Comments VARCHAR(MAX),
	@Task VARCHAR(80),
	@InstanceId UNIQUEIDENTIFIER,
	@RowCount INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.ImportLog (PackageName, EntryType, ExecutionStartTimeUtc, Comment, Task, InstanceId, [RowCount], TimestampUtc)
	VALUES
		 (@PackageName
		 ,@EntryType
		 ,@ExecutionStartTime
		 ,@Comments
		 ,@Task
		 ,@InstanceId
		 ,@RowCount
		 ,GETUTCDATE()
		)
END
