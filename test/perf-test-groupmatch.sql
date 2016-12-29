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
    ,MatchedName = dbo.RegexGroupMatch(x.name + y.name,'(?<firstfour>\w{4})','firstfour')
into #results
FROM x CROSS JOIN x AS y ORDER BY n;

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10



-- TEST 2: A COMPLEX, SLOW REGEX MATCH
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
    ,MatchedName = dbo.RegexGroupMatch(x.name + y.name,'(?<firstsix>(\w{4}\w?\w{1}))\S+','firstsix')
into #results
FROM x CROSS JOIN x AS y ORDER BY n;

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10




/*
;WITH x AS 
(
  SELECT TOP (1000) [object_id], name from sys.all_objects
)
SELECT n = ROW_NUMBER() OVER (ORDER BY x.[object_id])
    --,x.name
    --,y.name
    ,MatchedName = dbo.RegexGroupMatch(x.name + y.name,'(?<firstfour>(\w{4}\w?\w{1}))\S+','firstfour')

FROM x CROSS JOIN x AS y ORDER BY n;
*/