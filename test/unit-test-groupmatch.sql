/*
-- Unit tests for the dbo.RegexGroupMatch() function

See unit-tests.md for a list of expected behaviors
*/



-- UNIT TEST: Match one entry
; with test as 
(
  select dbo.RegexGroupMatch('testme   space','\w+\s+(?<secondword>\w+)','secondword') as TestResult
)

select StatusMessage = case when TestResult = 'space' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'space'
from test
go

-- UNIT TEST: Match no entries
; with test as 
(
  select dbo.RegexGroupMatch('testme   space','\w+\s+(?<secondword>ddd)','secondword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Invalid group name
; with test as 
(
  select dbo.RegexGroupMatch('testme   space','\w+\s+(?<secondword>ddd)', 'thirdword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Null string input
; with test as 
(
  select dbo.RegexGroupMatch(null,'\w', 'secondword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Null pattern input
; with test as 
(
  select dbo.RegexGroupMatch('testme   space',null, 'secondword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Null group input
; with test as 
(
  select dbo.RegexGroupMatch('testme   space','\w', null) as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go


-- UNIT TEST: All inputs are null
; with test as 
(
  select dbo.RegexGroupMatch(null,null, null) as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Illegal regular expression
; with test as 
(
  select dbo.RegexGroupMatch('testme   space','$$^', 'secondword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Wrong input types (numbers, guids, etc)
; with test as 
(
  select dbo.RegexGroupMatch(1334873,'(?<numbers>\d{3})', 'numbers') as TestResult
)

select StatusMessage = case when TestResult = 133 then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 133
from test
go


