# <rdar://23239024>

<http://www.openradar.me/23239024>

Summary:

When returning an expression using bools and a condition from a Swift
function that doesn't expect a return value, the compile error is
misleading.

Steps to reproduce:

1. Create a Swift function returns nothing
2. Return `true && true`

OR:

1. Run `swiftc BoolWarning.swift`

Expected results:

The compile should produce an error message similar to that if you
return a single value from a function that doesn't return anything.

Actual results:

The compiling produces a misleading error message saying a binary
operator cannot be applied to 2 bools.

Notes:

- See expected.log and actual.log for examples
