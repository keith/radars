# <rdar://23224011>

<http://www.openradar.me/23224011>

Summary:

Xcode code coverage reports that the last line of a function hasn't been
hit when it is impossible to reach because of an else statement above.

Steps to reproduce:

1. Create a function that contains an if/else statement
2. Return from both halves of the if statement
3. Write tests that hit each half of the if
4. View the code coverage

OR:

1. Run the tests in the example project
2. View the code coverage

Expected results:

Code coverage should be 100%

Actual results:

Code coverage reports that you're missing the last line of your
function, which is unreachable.

Notes:

See coverage.png for the incorrect reporting.
