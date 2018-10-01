CREATE TABLE [Pay].[Company] (
    [RowId]       INT          IDENTITY (1, 1) NOT NULL,
    [CompanyId]   INT          NOT NULL,
    [CompanyName] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([RowId] ASC)
);

