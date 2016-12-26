# SQL Server Regex

![SQL Regex Logo](/images/sql-regex-logo.png)

SQL-Server-Regex gives you the power to run regular expressions inside SQL Server queries. It works by using SQL CLR functions to call the C# [Regex](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions.regex(v=vs.110).aspx) functionality.

## Examples

**Match**

The [RegexMatch()](/examples/match.md) scalar function lets you call a regular expression against a string, and returns the first result if there is a match.

![Match SSMS example](/images/match-1.png)

**Matches**

The [RegexMatches()](/examples/matches.md) table-valued function lets you call a regular expression against a string, and returns all matches

**Group Match**

The [RegexGroupMatch()](/examples/group-match.md) scalar function lets you call a regular expression with *named groups* against a string, and returns the group name you specify.

**Replace**

The [RegexReplace()](/examples/replace.md) scalar function lets you call a regular expression against a string with a *replacement* value, and replaces all the matched entries with the replacement.

**Split**

The [RegexSplit()](/examples/split.md) table-valued function lets pass a regular expression against a string to split it into pieces, and returns the pieces.


## Installation

You can install sql-server-regex on most versions of SQL Server:

* [SQL Server 2016](/install/sql-2016.md)
* [SQL Server 2014](/install/sql-2014.md)
* [SQL Server 2012](/install/sql-2012.md)
* [SQL Server 2008 and 2008 R2](/install/sql-2008.md)
* [SQL Server 2005](/install/sql-2005.md)

You can also install sql-server-regex onto [AWS RDS](/install/aws-rds.md).


## Tests


