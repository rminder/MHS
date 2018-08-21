CREATE VIEW SL.vwSegmentDefinition AS

SELECT
	[RowId]
   ,[Active]
   ,[Description]
   ,[FieldClass]
   ,[FieldClassName]
   ,[Id]
   ,[SegmentNumber]
   ,[LastUpdate]
   ,[ImportDate]
   ,[ValidFrom]
   ,[ValidTo]
FROM [SL].[SegmentDefinition];
GO
GRANT SELECT
    ON OBJECT::[SL].[vwSegmentDefinition] TO [OdsUser]
    AS [dbo];

