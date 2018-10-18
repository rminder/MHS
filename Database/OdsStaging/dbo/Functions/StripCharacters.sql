-- =================================================================
-- Author:		Randy Minder
-- Create date: 12-October, 2018
-- Description:	Strip certain characters from a string based on the
--	@MatchExpression parameter.
--
-- Credit for this goes to this StackOverflow question and response:
-- https://stackoverflow.com/questions/1007697/how-to-strip-all-non-alphabetic-characters-from-string-in-sql-server
-- Look at the answer provided by Even Mien
-- =================================================================

CREATE FUNCTION [dbo].[StripCharacters] (@String NVARCHAR(MAX), @MatchExpression VARCHAR(255))
RETURNS NVARCHAR(MAX)
AS
BEGIN
	SET @MatchExpression = '%[' + @MatchExpression + ']%';

	WHILE PATINDEX(@MatchExpression, @String) > 0
	SET @String = STUFF(@String, PATINDEX(@MatchExpression, @String), 1, '');

	RETURN @String;

END;