# <rdar://22981205>

<http://www.openradar.me/22981205>

Summary:

swiftc crashes when there is a function signature mismatch between a
subscript defined in a protocol and the implmentation of that subscript
function in a class inheriting from the protocol.

Steps to reproduce:

1. Run `swiftc subscriptCrash.swift`

OR:

1. Create a protocol which specifies a subscript function with 2
   arguments. Make sure the second argument has a label
2. Conform to this protocol from a class, by remove the argument or
   label from the definition in the class
3. Attempt to run `swiftc` on your file

Expected results:

A compiler error that the subscript signature in the implementation does
not match that expected from the protocol is produced.

Actual results:

The compiler crashes, giving no obvious sign that there is a signature
mismatch.

Notes:

- This is fixed immediately by fixing the implementation's signature
