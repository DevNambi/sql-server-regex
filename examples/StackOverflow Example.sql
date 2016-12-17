use StackOverflow
go

with src as 
(
select
	s.Id
	,s.FavoriteCount
	,s.Score
	,s.ViewCount
	,s.Tags
from dbo.Posts s
), get_tags as 
(
select
	r.Position
	,r.Match
	,s.Id
	,s.FavoriteCount
	,s.Score
	,s.ViewCount
from src s
cross apply dbo.RegexSplit(isnull(s.Tags,''), '>|<') as r
where r.Match <> ''
)

select
	Tag = Match
	,sum(FavoriteCount)
	,avg(FavoriteCount)
	,sum(Score)
	,avg(Score)
	,sum(ViewCount)
	,avg(ViewCount)
from get_tags
group by Match

/*
select *
into #posts
from src
*/



-- 52 seconds to compile query

