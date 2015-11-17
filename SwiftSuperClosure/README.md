# <rdar://23571013>

<http://www.openradar.me/23571013>

Summary:

Currently if you attempt to call super in a closure where you are weakly
capturing self, you cannot. Based on the compiler error this is a known
issue.

Steps to reproduce:

1. Attempt to compile the attached example:
  `swiftc SwiftSuperClosure.swift`

OR:

1. Create a class with a function
2. Create another class that subclasses the original
3. Override the function in the subclass
4. Create a closure that weakly captures self
5. Attempt to call super from the closure

Expected results:

Everything compiles and works fine!

Actual results:

This compiler error is produced:

```
error: using 'super' in a closure where 'self' is explicitly captured is
not yet supported
```
