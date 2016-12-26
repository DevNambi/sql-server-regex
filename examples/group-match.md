# Group Match

![SQL Regex Logo](/images/sql-regex-logo.png)

The RegexGroupMatch() function is a SQL CLR function that exposes the [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions(v=vs.110).aspx)' [Match()](https://msdn.microsoft.com/en-us/library/b9712a7w(v=vs.110).aspx) method. It allows you to pass along a regular expression with a named group and retrieve that result.

Let's look at a few examples, inspired by a handy [Regular Expressions tutorial](http://www.regular-expressions.info/examples.html)


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
