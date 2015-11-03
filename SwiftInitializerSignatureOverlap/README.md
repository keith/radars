# <rdar://23376549>

<http://www.openradar.me/23376549>

Summary:

Swift initializers are not differentiated based on their optionality or
ability to throw.

Steps to reproduce:

1. Create a swift struct/protocol/class
2. Create 3 initializers with the same argument, but one optional, and
   one that throws

OR

1. Open the attached playground

Expected results:

Everything compiles correctly, and the type is inferred based on the
caller.

Actual results:

A compiler error is produced:

```
Invalid redeclaration of 'init(string:)'
```

Notes:

- This is very similar to <rdar://23226135> but for initializers
