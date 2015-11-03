# <rdar://23376350>

<http://www.openradar.me/23376350>

Summary:

Protocols that define an initializer with an argument, that is then
declared in a protocol extension, and then implemented in the extension
of a struct, causes the program to not compile.

Steps to reproduce:

1. Create a protocol with an initializer
2. Implement the initializer in a protocol extension
3. Create an empty struct
4. Conform to the protocol in an extension on that struct
5. Call the initializer

OR

1. Open the attached playground

Expected results:

Everything compiles correctly

Actual results:

A compiler error is produced:

```
'(string: String) -> Bar' is not convertible to '(string: String) -> Bar?'
```

Notes:

- If you make the struct conform to the protocol in the definition ( not
  in an extension) it works
