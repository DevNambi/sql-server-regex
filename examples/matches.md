# Matches

![SQL Regex Logo](/images/sql-regex-logo.png)

RegexMatches() is a table-valued function that lets you run a regular expression against a string. All of the matched 'chunks' inside the string are returned. RegexMatches() is a SQL CLR function that exposes the [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions(v=vs.110).aspx)' [Match()](https://msdn.microsoft.com/en-us/library/b9712a7w(v=vs.110).aspx) method.

Let's look at a few examples, inspired by another handy [Regular Expressions tutorial](http://www.regular-expressions.info/examples.html)


### Screenshot

![Regex Matches](/images/matches-1.png)


### Grabbing HTML Tags

Let's grab HTML tags out of text.

```
declare @regex_pattern varchar(max) = '<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>'

select *
from dbo.RegexMatches('The HTML is <TAG>one</TAG><TAG>two</TAG>', @regex_pattern)
```
