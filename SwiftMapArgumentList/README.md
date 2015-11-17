# <rdar://23570873>

<http://www.openradar.me/23570873>

Summary:

Sometimes swift cannot seem to infer the type of a multiline closure
provided to map.

Steps to reproduce:

1. Attempt to compile the provided example with
  `swiftc SwiftMapArgumentList.swift`

Expected results:

The type is inferred and it is compile correctly.

Actual results:

This error is produced:

```
error: cannot invoke 'map' with an argument list of type
'(@noescape (Thing) throws -> _)'
```

Notes:

- See the comments in the attached file for workarounds
