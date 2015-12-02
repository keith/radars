# <rdar://23719142>

<http://www.openradar.me/23719142>

Summary:

When calling a generic function that has a signature similar to another
generic function, the return type can be incorrectly inferred, and
casting to the return type doesn't work correctly.

Steps to reproduce:

1. Run the attached script with
  `swift GenericFunctionIncorrectTypeInference.swift`

Expected results:

Each test should print:

```
Got 'Optional("hi")' should be 'hi'
```

Actual results:

The first run returns nil because `"hi" as? Optional<String>` fails to
cast correctly. Here's the output:

```
Type inferred as 'Optional<String>'
Type inferred as 'String'
Got 'nil' should be 'hi'

Type inferred as 'String'
Got 'Optional("hi")' should be 'hi'

Type inferred as 'Optional<String>'
Type inferred as 'String'
Got 'Optional("hi")' should be 'hi'
```

Notes:

- The main issue here is that when casting `"hi" as? T` where `T` is
  `Optional<String>`, it returns nil, when it should work fine.
- Commenting out the other `RawRepresentable` function and running again
  solves this problem.
- It seems extremely odd that the last inferred type is different from
  those before it *only* when the other `RawRepresentable` function is
  also there, since these shouldn't collide as `String` does not conform
  to `RawRepresentable`
