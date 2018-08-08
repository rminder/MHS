CREATE TABLE [SL].[SegDefDelete] (
    [FieldClassName] CHAR (15) NOT NULL,
    [SegNumber]      CHAR (2)  NOT NULL,
    [ID]             CHAR (24) NOT NULL,
    CONSTRAINT [PkSegDefDelete] PRIMARY KEY CLUSTERED ([FieldClassName] ASC, [SegNumber] ASC, [ID] ASC)
);

