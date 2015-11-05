# <rdar://23421488>

<http://www.openradar.me/23421488>

Summary:

Swift produces an expression too complex error with this `UIColor`
extension (also attached).

```swift
import UIKit

extension UIColor {
    var isVeryBright: Bool {
        let components = CGColorGetComponents(self.CGColor)
        let colorBrightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return colorBrightness > 0.8
    }
}
```

Steps to reproduce:

1. Attempt to compile this code with Xcode 7.1

Expected results:

The code compiles

Actual results:

```
error: expression was too complex to be solved in reasonable time; consider breaking up the expression into distinct sub-expressions
```

Notes:

- Breaking this up into 3 separate expressions solves the problem
- Run with: `xcrun --sdk iphonesimulator swiftc UIColorTooComplex.swift`
