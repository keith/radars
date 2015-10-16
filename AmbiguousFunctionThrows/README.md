# <rdar://23147654>

<http://www.openradar.me/23147654>

Summary:

Generic functions that return type `T` or `T?` are not differentiated by
the compiler based on their ability to `throws`. Meaning that if you
have a function that does not throw and returns `T?`, and a function
with the same signature that throws and returns type `T`, you get a
ambiguous function error.

Steps to reproduce:

1. Create a function that returns `T` and throws
2. Create a function that returns `T?` and doesn't throw
3. Attempt to call the function that returns `T?` and assign it to an
   optional `T`

OR

1. See the attached playground

Expected results:

The ability to throw should be take into account to choose which
function to call.

Actual results:

The compiler produces an "Ambiguous use of X()" error.
