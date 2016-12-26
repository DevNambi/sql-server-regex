# Replace

![SQL Regex Logo](/images/sql-regex-logo.png)

RegexReplace() is a scalar function that lets you find-and-replace inside a string using regular expressions. RegexReplace() is a SQL CLR function that exposes the [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions(v=vs.110).aspx)' [Replace()](https://msdn.microsoft.com/en-us/library/b9712a7w(v=vs.110).aspx) method.

Let's look at a few examples, inspired by another handy [Regular Expressions tutorial](http://www.regular-expressions.info/examples.html)


### Screenshot

![Replace SSMS example](/images/replace-1.png)


### Change a sentence

```
select dbo.RegexReplace('Hello, my name is John Doe', 'my name is (.+)', 'my name is not $1')
```