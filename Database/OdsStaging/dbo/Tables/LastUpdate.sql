CREATE TABLE [dbo].[LastUpdate] (
    [RowId]      INT           IDENTITY (1, 1) NOT NULL,
    [TableName]  VARCHAR (50)  CONSTRAINT [DF_LastUpdate_TableName] DEFAULT ('') NOT NULL,
    [LastUpdate] DATETIME2 (7) CONSTRAINT [DF_LastUpdate_LastUpdate] DEFAULT ('1/1/1900') NOT NULL,
    CONSTRAINT [PK_LastUpdate] PRIMARY KEY CLUSTERED ([RowId] ASC)
);



