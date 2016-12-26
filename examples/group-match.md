# Group Match

![SQL Regex Logo](/images/sql-regex-logo.png)

RegexGroupMatch() is a scalar function that lets you run a regular expression using *named groups* against a string. It returns the match for the group you've named. RegexGroupMatch() is a SQL CLR function that exposes the [System.Text.RegularExpressions](https://msdn.microsoft.com/en-us/library/system.text.regularexpressions(v=vs.110).aspx)' [Match()](https://msdn.microsoft.com/en-us/library/b9712a7w(v=vs.110).aspx) method.

Let's look at a few examples, inspired by a handy [Regular Expressions tutorial](http://www.regular-expressions.info/examples.html)


### Screenshot

![Group Match SSMS example](/images/groupmatch-1.png)

### Retrieve the domain of an email address

```
declare @regex_pattern varchar(max) = '[_]*([a-z0-9]+(\.|_*)?)+@(?<domain>([a-z][a-z0-9-]+(\.|-*\.))+[a-z]{2,6})'

select dbo.RegexGroupMatch('My email address is fakeemail@hotmail.com', @regex_pattern, 'domain')
```