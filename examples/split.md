use Scratch
go

drop function dbo.RegexMatches
go

drop function dbo.RegexSplit
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



select *
from dbo.RegexMatches('test test test','\w+')

select *
from dbo.RegexSplit('testtesttest','t')
