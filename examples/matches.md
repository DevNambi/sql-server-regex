# Matches

The RegexMatches() function is a SQL CLR function that exposes the [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions(v=vs.110).aspx)' [Match()](https://msdn.microsoft.com/en-us/library/b9712a7w(v=vs.110).aspx) method, so you can use it using T-SQL queries. 

Let's look at a few examples, inspired by another handy [Regular Expressions tutorial](http://www.regular-expressions.info/examples.html)




**Grabbing HTML Tags**

Let's grab HTML tags out of text.

```
declare @regex_pattern varchar(max) = '<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>'

select dbo.RegexMatch('The HTML is <TAG>one<TAG>two</TAG>one</TAG>', @regex_pattern)

select dbo.RegexMatch('<A>Hello world</A> I''ve missed you', @regex_pattern)
```

select *
from dbo.RegexMatches('test test test','\w+')
