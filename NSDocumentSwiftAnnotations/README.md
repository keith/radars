# <rdar://problem/33422662>

http://www.openradar.me/33422662

Summary:

If you create a NSDocument subclass, and override `canClose` the method
signature currently looks like this:

```swift
override func canClose(
  withDelegate delegate: Any,
  shouldClose shouldCloseSelector: Selector?,
  contextInfo: UnsafeMutableRawPointer?)
```

In this case it seems as though:

1. The `delegate` argument should be a NSObject(Protocol), since you're
   expected to perform the passed Selector on it
2. Both the `shouldCloseSelector` and `contextInfo` should be nonnull
   since passing nil to either `super`'s implementation of this, or the
   passed Selector, results in a crash.

Steps to Reproduce:

1. Create a new Swift project with a NSDocument subclass that you can
   open new documents for (this involves creating a document type and
   UTI)
2. Override `canClose`
3a. Call super, passing nil for either of the last 2 arguments
3b. Attempt to call the passed Selector on the delegate manually in
    Swift

Expected Results:

3a. If you pass nil for either of the last 2 arguments it should not
    compile
3b. `delegate` is a NSObject(Protocol) so you can more easily call the
    passed Selector on it without casting from Any

Actual Results:

3a. It compiles and crashes at runtime
3b. `delegate` is an Any, and you must cast it as a NSObject(Protocol)
    in order to use it

Version:

macOS 10.12
