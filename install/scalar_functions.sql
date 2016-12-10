use Scratch
go

drop function dbo.RegexMatch
go

drop function dbo.RegexGroupMatch
go

drop function dbo.RegexReplace
go

-- see https://msdn.microsoft.com/en-us/library/ms186755.aspx for details

CREATE FUNCTION dbo.RegexMatch (@input nvarchar(max), @pattern nvarchar(max))
RETURNS nvarchar(max)
AS EXTERNAL NAME [RegexAssembly].[UDF].[Match]
go

CREATE FUNCTION dbo.RegexGroupMatch (@input nvarchar(max), @pattern nvarchar(max), @group nvarchar(max))
RETURNS nvarchar(max)
AS EXTERNAL NAME [RegexAssembly].[UDF].[GroupMatch]
go

CREATE FUNCTION dbo.RegexReplace (@input nvarchar(max), @pattern nvarchar(max), @replacement nvarchar(max))
RETURNS nvarchar(max)
AS EXTERNAL NAME [RegexAssembly].[UDF].[Replace]
go

