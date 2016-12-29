/*
-- Performance test - RegexSplit()
*/

-- TEST 1: A SIMPLE REGEX SPLIT
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
), gen AS
(
SELECT n = ROW_NUMBER() OVER (ORDER BY x.[object_id])
    ,InputString = x.name + y.name
FROM x CROSS JOIN x AS y
)

SELECT
    g.n
    ,SplitCount = count(*)
into #results
FROM gen g
CROSS APPLY dbo.RegexSplit(g.InputString, 's') as s --split on the 's' character
GROUP BY g.n

set @EndTime = getdate();

drop table #results;

select RunTimeInSec = datediff(ms, @StartTime,@EndTime) / 1000.0
go 10



-- TEST 2: A COMPLEX REGEX SPLIT
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
), gen AS
(
SELECT n = ROW_NUMBER() OVER (ORDER BY x.[object_id])
    ,InputString = x.name + y.name
FROM x CROSS JOIN x AS y
)

SELECT
    g.n
    ,SplitCount = count(*)
into #results
FROM gen g
CROSS APPLY dbo.RegexSplit(g.InputString, 's\W|s\w{10}') as s --split on the 's' character
GROUP BY g.n

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
    ,MatchedName = dbo.RegexMatch(x.name + y.name,'\w{4}')

FROM x CROSS JOIN x AS y ORDER BY n;
*/