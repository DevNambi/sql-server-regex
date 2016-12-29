/*
-- Unit tests for the dbo.RegexReplace() function

See unit-tests.md for a list of expected behaviors
*/



-- UNIT TEST: Match one entry
; with test as 
(
  select dbo.RegexReplace('Hello, my name is John Doe', 'my name is (.+)', 'my name is not $1') as TestResult
)

select StatusMessage = case when TestResult = 'Hello, my name is not John Doe' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'space'
from test
go

-- UNIT TEST: Match no entries
; with test as 
(
  select dbo.RegexReplace('testme   space','\w+\s+ddd','foo') as TestResult
)

select StatusMessage = case when TestResult = 'testme   space' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'testme   space'
from test
go

-- UNIT TEST: Match multiple entries
; with test as 
(
  select dbo.RegexReplace('Hello, my name is John Doe', 'my name is (\w+)\s*(\w+)', 'my name is not $1 or $2') as TestResult
)

select StatusMessage = case when TestResult = 'Hello, my name is not John or Doe' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'Hello, my name is not John or Doe'
from test
go

-- UNIT TEST: Null string input
; with test as 
(
  select dbo.RegexReplace(null,'\w', 'secondword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Null pattern input
; with test as 
(
  select dbo.RegexReplace('testme   space',null, 'secondword') as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Null replacement input
; with test as 
(
  select dbo.RegexReplace('testme   space','\w', null) as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go


-- UNIT TEST: All inputs are null
; with test as 
(
  select dbo.RegexReplace(null,null, null) as TestResult
)

select StatusMessage = case when TestResult is null then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = null
from test
go

-- UNIT TEST: Illegal regular expression
; with test as 
(
  select dbo.RegexReplace('testme   space','$$^', 'secondword') as TestResult
)

select StatusMessage = case when TestResult = 'testme   space' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'testme   space'
from test
go

-- UNIT TEST: Wrong input types (numbers, guids, etc)
; with test as 
(
  select dbo.RegexReplace(1334873,'(\d+)', 'The numbers matched were $1') as TestResult
)

select StatusMessage = case when TestResult = 'The numbers matched were 1334873' then 'Success' else 'Failure' end
	,TestResult
	,ExpectedTestResult = 'The numbers matched were 1334873'
from test
go


