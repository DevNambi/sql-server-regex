/*
-- Unit tests for the dbo.RegexMatch() function

See unit-tests.md for a list of expected behaviors
*/



-- UNIT TEST: Match one entry
; with test as 
(
  select dbo.RegexMatch('testme   space','\w+') as TestResult
)

select StatusMessage = case when TestResult = 'testme' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'testme'
from test
go

-- UNIT TEST: Match no entries
; with test as 
(
  select dbo.RegexMatch('testme   space','ddd') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Match multiple entries
; with test as 
(
  select dbo.RegexMatch('testme   space','\w') as TestResult
)

select StatusMessage = case when TestResult = 't' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 't' --the first character
from test
go

-- UNIT TEST: Null string input
; with test as 
(
  select dbo.RegexMatch(null,'\w') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Null pattern input
; with test as 
(
  select dbo.RegexMatch('testme   space',null) as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Both inputs are null
; with test as 
(
  select dbo.RegexMatch(null,null) as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Illegal regular expression
; with test as 
(
  select dbo.RegexMatch('testme   space','$^') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Wrong input types (numbers, guids, etc)
; with test as 
(
  select dbo.RegexMatch(1334873,'\d{3}') as TestResult
)

select StatusMessage = case when TestResult = '133' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 133
from test
go


