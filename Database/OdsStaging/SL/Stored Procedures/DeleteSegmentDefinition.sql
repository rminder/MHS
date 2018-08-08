-- ===============================================================
-- Author:      Randy Minder
-- Create Date: 6-August, 2018
-- Description: Delete rows from Ods.SL.SegmentDefinition
--		that are contained in OdsStaging.SL.SegmentDefinition.
--
-- NOTE: The name of this stored proc must mimic the name of the
--    name of the table in Ods, with 'Delete' prepended to the
--    name.
--
-- Exec SL.DeleteSegmentDefinition
-- ===============================================================
CREATE PROCEDURE [SL].[DeleteSegmentDefinition]
AS
BEGIN
	SET NOCOUNT ON;

	-- Delete rows in the Ods table by joining on the PK columns with the Delete table in 
	-- OdsStaging
	DELETE T
	FROM Ods.SL.SegmentDefinition			  T
		INNER JOIN OdsStaging.SL.SegDefDelete T2 ON RTRIM(T2.FieldClassName) = T.FieldClassName
													AND RTRIM(T2.SegNumber)	 = T.SegmentNumber
													AND RTRIM(T2.ID)		 = T.Id;
END;