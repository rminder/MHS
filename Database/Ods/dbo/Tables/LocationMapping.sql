CREATE TABLE [dbo].[LocationMapping] (
    [SegmentID]    NVARCHAR (10)  NULL,
    [Location]     NVARCHAR (255) NULL,
    [Parent]       NVARCHAR (255) NULL,
    [Region]       NVARCHAR (255) NULL,
    [BusinessUnit] NVARCHAR (10)  NULL,
    [Division]     NVARCHAR (10)  NULL,
    [SortOrder]    SMALLINT       NULL
);

