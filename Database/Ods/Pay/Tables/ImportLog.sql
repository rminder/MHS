CREATE TABLE [Pay].[ImportLog] (
    [RowId]        INT           IDENTITY (1, 1) NOT NULL,
    [DataImported] VARCHAR (50)  NOT NULL,
    [RowsMerged]   INT           NOT NULL,
    [Status]       VARCHAR (20)  NOT NULL,
    [Comments]     VARCHAR (MAX) NOT NULL,
    [TimestampUtc] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_ImportLog_1] PRIMARY KEY CLUSTERED ([RowId] ASC)
);

