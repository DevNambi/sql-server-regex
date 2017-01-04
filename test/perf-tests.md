# Performance Tests

There are several performance tests for each of the functions. 

## Baseline Performance

The performance tests are against a dataset of a million rows, [generated from sys.all_objects](https://sqlperformance.com/2013/01/t-sql-queries/generate-a-set-1).

## Performance Test Results

These are the performance test results from my development machine, a Windows 7 desktop with a 4-core Skylake CPU and 32GB of RAM. 

Each test is run 10 times, and you're seeing the average runtime. You can also look at the [raw data](https://docs.google.com/spreadsheets/d/11Neu6wHXZSA50S2lEt7h4koXZFPSrdnvB4CVKEmbKpw/edit?usp=sharing) if you're interested.


| Test Category | Simple | Complex | Null |
| ------------- |:------:| :------:| ----:|
| Baseline      |  0.49  | 0.62    | N/A  |
| Match         | 14.05  | 19.25   | 5.33 |
| GroupMatch    | 18.35  | 21.31   |  |
| Matches       | 28.09  | 22.14   |  |
| Replace       | 24.03  | 21.56   |  |
| Split         | 28.00  | 23.84   |  |

**Analysis**

The SQL CLR functions are *slow*. Even calling the simplest function with a null value, RegexMatch(), takes ~10 times longer than the baseline query, 5 seconds vs .5 seconds. Relatively simple regular expressions are slow.

I noticed that one of the cores on my computer was consistently pegged at 100%, suggesting that the limitation was CPU. That makes sense; both the CLR and regular expressions are relatively CPU heavy.

## Performance Tests

There are 6 perf test scripts, one per function, plus a 'baseline' script.


* [Baseline](/test/perf-test-baseline.sql)
* [Match](/test/perf-test-match.sql)
* [Matches](/test/perf-test-matches.sql)
* [GroupMatch](/test/perf-test-groupmatch.sql)
* [Split](/test/perf-test-split.sql)
* [Replace](/test/perf-test-replace.sql)


## Running the Tests

**Test Setup**

To run these tests, you'll need to have sql-server-regex installed onto a SQL Server database.

**Running a Test**

* Open a SQL file for a test (for example, 'perf-test-match.sql')
* The top of the script has the runtime on my development machine (a desktop with a 4-core Skylake CPU and 16GB RAM). 
* Run the script
* Each test should run 10 times, and return the runtime of each.
* If any of the tests error, then something is broken/failing.