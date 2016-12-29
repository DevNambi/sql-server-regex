-- First, drop the functions if they already exist.
if OBJECT_ID('dbo.RegexMatch') is not null
begin
	exec ('drop function dbo.RegexMatch');
end
go

if OBJECT_ID('dbo.RegexGroupMatch') is not null
begin
	exec ('drop function dbo.RegexGroupMatch');
end
go

if OBJECT_ID('dbo.RegexReplace') is not null
begin
	exec ('drop function dbo.RegexReplace');
end
go

if OBJECT_ID('dbo.RegexMatches') is not null
begin
	exec ('drop function dbo.RegexMatches');
end
go

if OBJECT_ID('dbo.RegexSplit') is not null
begin
	exec ('drop function dbo.RegexSplit');
end
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
