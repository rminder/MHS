CREATE TABLE [dbo].[DataIntegrity] (
    [RowId]              INT            IDENTITY (1, 1) NOT NULL,
    [TableName]          VARCHAR (80)   NOT NULL,
    [Description]        VARCHAR (80)   CONSTRAINT [DF_DataIntegrity_Description] DEFAULT ('') NOT NULL,
    [OdsRowCount]        INT            CONSTRAINT [DF_DataIntegrity_OdsRowCount] DEFAULT ((0)) NOT NULL,
    [SourceRowCount]     INT            CONSTRAINT [DF_DataIntegrity_SourceRowCount] DEFAULT ((0)) NOT NULL,
    [IntegrityViolation] NVARCHAR (MAX) NOT NULL,
    [TimestampUtc]       DATETIME2 (7)  CONSTRAINT [DF_DataIntegrity_TimestampUtc] DEFAULT (getutcdate()) NOT NULL
);

