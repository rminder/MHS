CREATE TABLE [dbo].[ImportLog] (
    [ImportLogId]           INT              IDENTITY (1, 1) NOT NULL,
    [PackageName]           VARCHAR (80)     NOT NULL,
    [EntryType]             VARCHAR (50)     CONSTRAINT [DF_ImportLog_EntryType] DEFAULT ('') NOT NULL,
    [InstanceId]            UNIQUEIDENTIFIER NOT NULL,
    [ExecutionStartTimeUtc] DATETIME2 (7)    NOT NULL,
    [Comment]               VARCHAR (MAX)    NOT NULL,
    [Task]                  VARCHAR (80)     NOT NULL,
    [RowCount]              INT              CONSTRAINT [DF_ImportLog_RowsInsertedUpdated] DEFAULT ((0)) NOT NULL,
    [TimestampUtc]          DATETIME2 (7)    CONSTRAINT [DF_ImportLog_TimestampUtc] DEFAULT (getutcdate()) NOT NULL,
    CONSTRAINT [PK_ImportLog] PRIMARY KEY CLUSTERED ([ImportLogId] ASC)
);

