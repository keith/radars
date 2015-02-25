# <rdar://19956856>

<http://www.openradar.me/19956856>

Summary:

When using a `let` with an NSPoint and then trying to alter a value on
the point, the error message reads "Binary operator '-=' cannot be
applied to two CGFloat operands" which isn't descriptive of the actual
issue.

Steps to Reproduce:

```swift
let originPoint: NSPoint = NSWindow().frame.origin
originPoint.y -= originFrame.height
```

Expected Results:

The error should mention something about how constant points cannot be
changed.

Actual Results:

The error reads "Binary operator '-=' cannot be applied to two CGFloat
operands"

Notes:

See the attached playground
