use Scratch
go

--DROP FUNCTIONS FIRST
drop function dbo.RegexMatch
go

drop function dbo.RegexGroupMatch
go

drop function dbo.RegexReplace
go

drop function dbo.RegexMatches
go

drop function dbo.RegexSplit
go


--declare @FileLocation nvarchar(4000) = 'D:\GitHub\sql-server-regex\dev\bin\Debug\dev.dll'

drop assembly RegexAssembly
go

-- see https://msdn.microsoft.com/en-us/library/ms189524.aspx for details
CREATE ASSEMBLY RegexAssembly  
FROM  'D:\GitHub\sql-server-regex\dev\bin\Debug\dev.dll'
WITH PERMISSION_SET = SAFE;  


