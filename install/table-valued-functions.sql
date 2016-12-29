if OBJECT_ID('dbo.RegexMatches') is not null
begin
	exec ('drop function dbo.RegexMatches');
end
go

if OBJECT_ID('dbo.RegexSplit') is not null
begin
	exec ('drop function dbo.RegexSplit');
end
go

-- http://msdn.microsoft.com/en-us/library/ms131103.aspx

CREATE FUNCTION dbo.RegexMatches (@input nvarchar(max), @pattern nvarchar(max))
RETURNS TABLE (Position int, Match NVARCHAR(max))  
EXTERNAL NAME [RegexAssembly].[UDF].[Matches] 
go

CREATE FUNCTION dbo.RegexSplit (@input nvarchar(max), @pattern nvarchar(max))
RETURNS TABLE (Position int, Match NVARCHAR(max))
EXTERNAL NAME [RegexAssembly].[UDF].[Split] 
go