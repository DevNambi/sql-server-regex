/*
-- Performance test - RegexReplace()
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
    ,MatchedName = dbo.RegexReplace(x.name + y.name,'(\w{5})(\w{2})','$2__$1')
into #results
FROM x CROSS JOIN x AS y ORDER BY n;

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10



-- TEST 2: A COMPLEX REGEX MATCH
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
    ,MatchedName = dbo.RegexReplace(x.name + y.name,'(\w{5})(\w{2})(\S+)','$2__$1__$3')
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
	,OriginalName = x.name + y.name
    ,MatchedName = dbo.RegexReplace(x.name + y.name,'(\w{5})(\w+)','$2__$1')

FROM x CROSS JOIN x AS y ORDER BY n;
*/