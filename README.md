# SQL Server Regex

This code exposes regular expression functions to SQL Server, so you can run regular expressions using SQL queries. This is done by exposing C# [Regex functions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions.regex(v=vs.110).aspx) using SQL CLR scalar- and table-valued functions.

## Examples

**Match**

The Match() function lets you run a regular expression match against a string to find. 

See the documentation on [RegexMatch()](https://github.com/DevNambi/sql-server-regex/blob/master/examples/match.md) for more examples.

**Group Match**

See the documentation on [RegexGroupMatch()](https://github.com/DevNambi/sql-server-regex/blob/master/examples/group-match.md) for more examples.

**Replace**

See the documentation on [RegexReplace()](https://github.com/DevNambi/sql-server-regex/blob/master/examples/replace.md) for more examples.

**Matches**

See the documentation on [RegexMatches()](https://github.com/DevNambi/sql-server-regex/blob/master/examples/matches.md) for more examples.

**Split**

See the documentation on [RegexSplit()](https://github.com/DevNambi/sql-server-regex/blob/master/examples/split.md) for more examples.


## Installation

You can install sql-server-regex on most versions of SQL Server:

* [SQL Server 2016](https://github.com/DevNambi/sql-server-regex/blob/master/install/sql-2016.md)
* [SQL Server 2014](https://github.com/DevNambi/sql-server-regex/blob/master/install/sql-2014.md)
* [SQL Server 2012](https://github.com/DevNambi/sql-server-regex/blob/master/install/sql-2012.md)
* [SQL Server 2008 and 2008 R2](https://github.com/DevNambi/sql-server-regex/blob/master/install/sql-2008.md)
* [SQL Server 2005](https://github.com/DevNambi/sql-server-regex/blob/master/install/sql-2005.md)

You can also install sql-server-regex onto [AWS RDS](https://github.com/DevNambi/sql-server-regex/blob/master/install/aws-rds.md).








## Supported Versions

Currently only SQL Server 2012 is supported. Support for SQL 2008, 2014, and 2016 is coming very soon.


## Tests



## Further Resources

* https://blogs.msdn.microsoft.com/sqlclr/2005/06/29/working-with-regular-expressions/