


CREATE VIEW [dbo].[dSubAcctSeg2]
AS
SELECT        Id AS 'SegID'
,COALESCE(CASE WHEN [Description] = '' THEN NULL ELSE [Description] END,'n/a')	AS 'Descr'
FROM            SL.SegmentDefinition
WHERE        (SegmentNumber = '2')
UNION ALL
SELECT 'n/a'AS 'SegID', 'n/a' AS 'Descr'

UNION

SELECT Distinct a.[SubSeg2], 'n/a'

FROM [fAPTran] a LEFT OUTER JOIN SL.SegmentDefinition b ON a.[SubSeg2] = b.[ID]

WHERE b.[ID] IS NULL AND  (b.SegmentNumber = '2')

UNION

SELECT Distinct a.[SubSeg2], 'n/a'

FROM [fARTran] a LEFT OUTER JOIN SL.SegmentDefinition b ON a.[SubSeg2] = b.[ID]

WHERE b.[ID] IS NULL AND  (b.SegmentNumber = '2')

UNION

SELECT Distinct a.[SubSeg2], 'n/a'

FROM [fGLBudget] a LEFT OUTER JOIN SL.SegmentDefinition b ON a.[SubSeg2] = b.[ID]

WHERE b.[ID] IS NULL AND  (b.SegmentNumber = '2')

UNION

SELECT Distinct a.[SubSeg2], 'n/a'

FROM [fGLTran] a LEFT OUTER JOIN SL.SegmentDefinition b ON a.[SubSeg2] = b.[ID]

WHERE b.[ID] IS NULL AND  (b.SegmentNumber = '2') ;
GO
GRANT SELECT
    ON OBJECT::[dbo].[dSubAcctSeg2] TO [OdsUser]
    AS [dbo];

