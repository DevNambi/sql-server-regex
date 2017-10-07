# SQL Server Regex

![SQL Regex Logo](/images/sql-regex-logo.png)

SQL-Server-Regex gives you the power to run regular expressions inside SQL Server queries. It works by using SQL CLR functions to call the C# [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions.regex.aspx) library.

# Examples

### Match

The [RegexMatch()](/examples/match.md) scalar function lets you call a regular expression against a string, and returns the first result if there is a match.

![Match SSMS example](/images/match-1.png)

### Matches

The [RegexMatches()](/examples/matches.md) table-valued function lets you call a regular expression against a string, and returns all matches.

![Matches SSMS example](/images/matches-1.png)

### Group Match

The [RegexGroupMatch()](/examples/group-match.md) scalar function lets you call a regular expression with *named groups* against a string, and returns the group name you specify.

![Group Match SSMS example](/images/groupmatch-1.png)

### Replace

The [RegexReplace()](/examples/replace.md) scalar function lets you call a regular expression to find-and-replace inside a string. You can also match parts of a string and re-arrange them using references.

![Replace SSMS example](/images/replace-1.png)

### Split

The [RegexSplit()](/examples/split.md) table-valued function lets pass a regular expression against a string to split it into pieces, and returns the pieces.

![Split SSMS example](/images/split-1.png)


# Installation

You can install sql-server-regex on most versions of SQL Server. This works the same for virtual machines or cloud VMs.

* [SQL Server 2016](/install/sql-2016.md)
* [SQL Server 2014](/install/sql-2014.md)
* [SQL Server 2012](/install/sql-2012.md)
* [SQL Server 2008 and 2008 R2](/install/sql-2008.md)
* [SQL Server 2005](/install/sql-2005.md)

You can also install sql-server-regex onto [AWS RDS](/install/aws-rds.md).


# Testing

This work has been tested, both for functionality and performance.

* [Unit Testing](/test/unit-tests.md)
* [Performance Testing](/test/perf-tests.md)

# Resources

* [CLR Table-Valued Functions](https://msdn.microsoft.com/en-us/library/ms131103.aspx)
* [Introduction to SQL Server Table-Valued Functions](https://www.mssqltips.com/sqlservertip/2582/introduction-to-sql-server-clr-table-valued-functions/)