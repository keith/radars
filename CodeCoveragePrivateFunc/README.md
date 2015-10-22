# <rdar://23225405>

<http://www.openradar.me/23225405>

Summary:

Private functions show up in code coverage with a arbitrary string
identifier after their name.

Steps to reproduce:

1. Create a public function that calls a private function
2. Write a test that calls the public function
3. View the code coverage

OR:

1. Run the tests in the example project
2. View the code coverage

Expected results:

The code coverage should (possibly) have something to identify that
function as private, but it should not be a random string.

Actual results:

The private function has a long string of characters after it's
declaration.

Notes:

See coverage.png for an example.
