/*
-- Unit tests for the dbo.RegexMatches() function

See unit-tests.md for a list of expected behaviors
*/



-- UNIT TEST: Match one entry
; with test as 
(
  select Position
	    ,Match = replace(replace(Match, '<TAG>',''),'</TAG>','')
  from dbo.RegexMatches('The HTML is <TAG>one</TAG>', '<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>')
)

select StatusMessage = case when Match in ('one') then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = 'one'
from test
go

-- UNIT TEST: Match multiple entries
; with test as 
(
  select Position
	    ,Match = replace(replace(Match, '<TAG>',''),'</TAG>','')
  from dbo.RegexMatches('The HTML is <TAG>one</TAG><TAG>two</TAG>', '<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>')
)

select StatusMessage = case when Match in ('one','two') then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = 'one or two'
from test
go

-- UNIT TEST: Match no entries
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexMatches('The HTML is one two ', '<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>')
)

select StatusMessage = case when count(*) = 0 then 'Success' else 'Failure' end
	,MatchCount = count(*)
	,ExpectedTestResult = '0 Rows Returned'
from test
go



-- UNIT TEST: Null string input
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexMatches(null, '<([A-Z][A-Z0-9]*)\b[^>]*>(.*?)</\1>')
)

select StatusMessage = case when count(*) = 0 then 'Success' else 'Failure' end
	,MatchCount = count(*)
	,ExpectedTestResult = '0 Rows Returned'
from test
go






-- UNIT TEST: Null pattern input
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexMatches('The HTML is <TAG>one</TAG><TAG>two</TAG>', null)
)

select StatusMessage = case when count(*) = 0 then 'Success' else 'Failure' end
	,MatchCount = count(*)
	,ExpectedTestResult = '0 Rows Returned'
from test
go

-- UNIT TEST: Both inputs are null
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexMatches(null, null)
)

select StatusMessage = case when count(*) = 0 then 'Success' else 'Failure' end
	,MatchCount = count(*)
	,ExpectedTestResult = '0 Rows Returned'
from test
go

-- UNIT TEST: Illegal regular expression
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexMatches('The HTML is <TAG>one</TAG><TAG>two</TAG>', '$^')
)

select StatusMessage = case when count(*) = 0 then 'Success' else 'Failure' end
	,MatchCount = count(*)
	,ExpectedTestResult = '0 Rows Returned'
from test
go


-- UNIT TEST: Wrong input types (numbers, guids, etc)
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexMatches(123456, '\d')
)

select StatusMessage = case when Match in (1,2,3,4,5,6) then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = '1 2 3 4 5 or 6'
from test
go