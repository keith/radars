# <rdar://22441425>

<http://www.openradar.me/22441425>

Summary:

Xcode 7 beta 5 and 6 produce unexpected compiler errors from our unit
tests. When testing an instance method on our `String` extension we
began getting compiler crashes with Xcode 7 beta 5. These errors change
each time the project is compiled, some examples include:

- INTERNAL ERROR: this diagnostic should not be produced
- INTERNAL ERROR: feature not implemented: 'Int'
- Invalid character in source file

Steps to reproduce:

1. Open the example project
2. Run the unit tests

Expected results:

The project compiles and the tests pass

Actual results:

The compiler produces warnings that don't seem to pertain to the tests

Notes:

- The only way we've been able to reproduce this is using Quick and
  Nimble as test frameworks. We're assuming it has something to do with
  the type inference happening in those libraries.

- We got multiple warnings that implied there may be a character in a
  source file that the compiler was choking on. We filtered out all
  special characters (such as «) and had the same errors.

- We are able to fix this by assigning the output of our function to a
  temporary variable, or using `as String` inline. See
  [here](https://github.com/Quick/Quick/issues/369)
