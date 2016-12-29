# Unit Tests

There are several unit tests for each of the functions



## Expected Behavior

* If any of the inputs are null, the output is null
* If given an invalid regular expression, the function returns null
* If a match() style function (Match, GroupMatch, Matches) has no matches, it returns null
* If the Replace() function doesn't match anything to replace, it returns the original string (this is how Find-and-Replace works everywhere else, such as in a text editor)
* If the Split() function can't match anything to split on, it returns the entire original string. This is how split functions work in a text editor


## Tests

* There are 5 unit test scripts, one per function. 

* [Match](/test/unit-test-match.sql)
* [Matches](/test/unit-test-matches.sql)
* [GroupMatch](/test/unit-test-groupmatch.sql)
* [Split](/test/unit-test-split.sql)
* [Replace](/test/unit-test-replace.sql)

## Running the Tests

**Test Setup**

To run these tests, you'll need to have sql-server-regex installed onto a SQL Server database.

**Running a Test**

* Open a SQL file for a test (for example, 'unit-test-match.sql')
* Run the script
* Each test should return 'Success' or 'Failure'
* If any of the tests error, or return no results, then something is broken/failing.