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


-- Second, drop the assembly and remove trust if it already exists
IF (SELECT COUNT(1) FROM sys.trusted_assemblies WHERE description like 'sql-server-regex%')=1
BEGIN
	declare @AssemblyHash varbinary(64);
	SELECT @AssemblyHash=hash from sys.trusted_assemblies where description like 'sql-server-regex%'
	EXEC sp_drop_trusted_assembly @AssemblyHash;
END
go


-- Third, finally, trust and create the assembly (sql-server-regex-2016.dll is compatible with SQL Server 2017)
EXEC sp_add_trusted_assembly 
	0x52A8DC6C31B95961455746731FEC5DC4E8BF7F8791A6854473BB4F9A9577AA2BC4376213EC4AD9C3ADB0A0A55CEACCEBB9A01D7AC5CCBACA054B0F14EF4212D1, 
	N'sql-server-regex, version=1.0.6494.17073';

declare @AssemblyLocation varchar(8000);

set @AssemblyLocation = '--SET LOCATION HERE, e.g. C:\Install\sql-server-regex-2016.dll'

drop assembly IF EXISTS RegexAssembly

CREATE ASSEMBLY RegexAssembly  
FROM  @AssemblyLocation
WITH PERMISSION_SET = SAFE;  

-- see https://msdn.microsoft.com/en-us/library/ms189524.aspx for details
