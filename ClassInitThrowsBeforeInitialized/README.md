# <rdar://23472747>

<http://www.openradar.me/23472747>

Summary:

Swift class inits cannot throw without initializing all properties. Part
of the benefit of being able to throw from an initializer is that you
can do an "early return" when you get invalid data (especially from a
server). Example:

```swift
struct Error: ErrorType {}

class Example {
    let string: String

    init() throws {
        throw Error()
    }
}
```

Steps to reproduce:

1. Run the code snippet above (or the attached file)

Expected results:

The code compiles

Actual results:

This error is produced:

```
ClassInitThrowsBeforeInitialized.swift:8:5: error: all stored properties of a class instance must be initialized before throwing from an initializer
    }
    ^
ClassInitThrowsBeforeInitialized.swift:4:9: note: 'self.string' not initialized
    let string: String
        ^
```

Notes:

- This is the same problem as returning nil before initializing all
  properties in an `init?`
