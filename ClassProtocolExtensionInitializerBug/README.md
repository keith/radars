# <rdar://23358609>

<http://www.openradar.me/23358609>

Summary:

Adding an initializer in a Swift protocol extension, then creating a
non-final class that conforms to that protocol produces:

```
<unknown>:0: error: initializer requirement 'init(string:)' can only be
satisfied by a `required` initializer in the definition of non-final
class 'Bar'
```

Steps to reproduce:

1. Create a protocol with 2 initializers
2. Implement only one of the in a class conforming to the protocol
3. Implement the other in a protocol extension

OR

1. Open the attached playground

Expected results:

Everything compiles correctly

Actual results:

A compiler error is produced:

```
<unknown>:0: error: initializer requirement 'init(string:)' can only be
satisfied by a `required` initializer in the definition of non-final
class 'Bar'
```

Notes:

- Making this class final, fixes the problem
- There is no compiler error produced for structs conforming to the
  protocol
