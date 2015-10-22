# <rdar://23226135>

<http://www.openradar.me/23226135>

Summary:

When you create a Swift protocol with similar function signatures, it
can become impossibly to conform to the protocol according to the
compiler.

Steps to reproduce:

1. Create a protocol with generic functions of the same signature
2. Make one function with type constraint `T` and another with `T: RawRepresentable`
3. Attempt to create a struct that conforms to the protocol

OR:

1. Run `swiftc GenericProtocolError.swift`

Expected results:

Swift should happily compile the example with no problem!

Actual results:

The compiler errors with "type does not conform to protocol"

Notes:

- See error.log for the error and note output
- The note makes it sound like the functions are interpreted as the same
  signature regardless of the difference in `T`
- Removing the protocol and just having the functions on the struct
  works fine.
