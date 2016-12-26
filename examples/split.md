# Matches

![SQL Regex Logo](/images/sql-regex-logo.png)

The RegexSplit() function is a SQL CLR table-valued function that exposes the [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions(v=vs.110).aspx)' [Split()](https://msdn.microsoft.com/en-us/library/b9712a7w(v=vs.110).aspx) method, so you can use it using T-SQL queries. 

Let's look at a few examples, inspired by another handy [Regular Expressions tutorial](http://wiki.tcl.tk/989)




**Split a String Into Words**

Let's grab HTML tags out of text.

```
declare @regex_pattern varchar(max) = '\s+'

select *
from dbo.RegexSplit('How do I split an arbitrary string into words?', @regex_pattern)

select *
from dbo.RegexSplit('Does this work if   the words are oddly-formed?', @regex_pattern)
```

select *
from dbo.RegexSplit('testtesttest','t')
