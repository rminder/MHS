


CREATE VIEW [dbo].[dSubAcctSeg2]
AS
SELECT        Id AS 'SegID'
,COALESCE(CASE WHEN [Description] = '' THEN NULL ELSE [Description] END,'n/a')	AS 'Descr'
FROM            SL.SegmentDefinition
WHERE        (SegmentNumber = '2')
UNION ALL
SELECT 'n/a'AS 'SegID', 'n/a' AS 'Descr'