# SQL Server Regex

![SQL Regex Logo](/images/sql-regex-logo.png)

This code exposes regular expression functions to SQL Server, so you can run regular expressions using SQL queries. This is done by exposing C# [Regex functions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions.regex(v=vs.110).aspx) using SQL CLR scalar- and table-valued functions.

## Examples

**Match**

The [RegexMatch()](/examples/match.md) function lets you run a match against a string using a regular expression, and returns the first result.

![Match SSMS example](/images/match-1.png)

**Group Match**

See the documentation on [RegexGroupMatch()](/examples/group-match.md) for more examples.

**Replace**

See the documentation on [RegexReplace()](/examples/replace.md) for more examples.

**Matches**

See the documentation on [RegexMatches()](/examples/matches.md) for more examples.

**Split**

See the documentation on [RegexSplit()](/examples/split.md) for more examples.


## Installation

You can install sql-server-regex on most versions of SQL Server:

* [SQL Server 2016](/install/sql-2016.md)
* [SQL Server 2014](/install/sql-2014.md)
* [SQL Server 2012](/install/sql-2012.md)
* [SQL Server 2008 and 2008 R2](/install/sql-2008.md)
* [SQL Server 2005](/install/sql-2005.md)

You can also install sql-server-regex onto [AWS RDS](/install/aws-rds.md).


## Tests



## Further Resources

* https://blogs.msdn.microsoft.com/sqlclr/2005/06/29/working-with-regular-expressions/