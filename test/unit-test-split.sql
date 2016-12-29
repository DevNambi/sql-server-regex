/*
-- Unit tests for the dbo.RegexSplit() function

See unit-tests.md for a list of expected behaviors
*/



-- UNIT TEST: Match one entry
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexSplit('Split', '\s+')
)

select StatusMessage = case when Match in ('Split','once') then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = '''Split'' or ''once'''
from test
go

-- UNIT TEST: Match multiple entries
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexSplit('Can this split into multiple words?', '\s+')
)

select StatusMessage = case when Match in ('Can','this','split','into','multiple','words?') then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = 'One of these words: Can this split into multiple words?'
from test
go

-- UNIT TEST: Match no entries
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexSplit('Split words', 'ddd')
)

select StatusMessage = case when Match = 'Split words' then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = 'Split words'
from test
go



-- UNIT TEST: Null string input
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexSplit(null, '\s+')
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
  from dbo.RegexSplit('Split all the words!', null)
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
  from dbo.RegexSplit(null, null)
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
  from dbo.RegexSplit('Split lots of words!', '$^')
)

select StatusMessage = case when Match = 'Split lots of words!' then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = 'Split lots of words!'
from test
go


-- UNIT TEST: Wrong input types (numbers, guids, etc)
; with test as 
(
  select Position
	    ,Match
  from dbo.RegexSplit(cast('7A9A986F-AD7B-4BB2-93B4-351A422B89A8' as uniqueidentifier), '-')
)

select StatusMessage = case when Match in ('7A9A986F','AD7B','4BB2','93B4','351A422B89A8') then 'Success' else 'Failure' end
	,Match
	,ExpectedTestResult = 'One of the chunks of this GUID: 7A9A986F-AD7B-4BB2-93B4-351A422B89A8'
from test
go
