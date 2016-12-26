-- First, drop the functions if they already exist.
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


-- Second, drop the assembly if it already exists
drop assembly RegexAssembly
go


-- Third, finally, create the assembly
declare @AssemblyLocation varchar(8000);

set @AssemblyLocation = '--SET LOCATION HERE, e.g. C:\Install\sql-server-regex-2016.dll'

CREATE ASSEMBLY RegexAssembly  
FROM  @AssemblyLocation
WITH PERMISSION_SET = SAFE;  

-- see https://msdn.microsoft.com/en-us/library/ms189524.aspx for details
