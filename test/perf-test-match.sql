/*
-- Performance test - RegexMatch()
*/

-- TEST 1: A SIMPLE REGEX MATCH
if object_id('tempdb..#results') is not null
begin
	exec ('drop table #results');
end
go

declare @StartTime datetime, @EndTime datetime

set @StartTime = getdate();

;WITH x AS 
(
  SELECT TOP (1000) [object_id], name from sys.all_objects
)
SELECT n = ROW_NUMBER() OVER (ORDER BY x.[object_id])
	,MatchedName = dbo.RegexMatch(x.name + y.name,'\w{4}')
into #results
FROM x CROSS JOIN x AS y ORDER BY n;

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10



-- TEST 2: A SLOWER, COMPLICATED REGEX MATCH
if object_id('tempdb..#results') is not null
begin
	exec ('drop table #results');
end
go

declare @StartTime datetime, @EndTime datetime

set @StartTime = getdate();

;WITH x AS 
(
  SELECT TOP (1000) [object_id], name from sys.all_objects
)
SELECT n = ROW_NUMBER() OVER (ORDER BY x.[object_id])
	,MatchedName = dbo.RegexMatch(x.name + y.name,'(\w*)\1')
into #results
FROM x CROSS JOIN x AS y ORDER BY n;

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10 





-- TEST 3: PASS A NULL PATTERN, CHECK THE INVOCATION TIME
if object_id('tempdb..#results') is not null
begin
	exec ('drop table #results');
end
go

declare @StartTime datetime, @EndTime datetime

set @StartTime = getdate();

;WITH x AS 
(
  SELECT TOP (1000) [object_id], name from sys.all_objects
)
SELECT n = ROW_NUMBER() OVER (ORDER BY x.[object_id])
	,MatchedName = isnull(dbo.RegexMatch(x.name + y.name,null),x.name + y.name)
into #results
FROM x CROSS JOIN x AS y ORDER BY n;

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10 
