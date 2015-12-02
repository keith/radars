# <rdar://23718676>

<http://www.openradar.me/23718676>

Summary:

When you have multiple swift functions with very similar generic
signatures, the compiler crashes, especially when using the nil
coalescing operator.

Steps to reproduce:

1. Attempt to run the attached script with
  `swift GenericFunctionCrash.swift`

Expected results:

Everything runs correctly.

Actual results:

It crashes at runtime with this error:

```
Could not cast value of type 'Swift.String' to 'Swift.Optional<Swift.String>'
```

Notes:

- If you comment out the fallback using the `??` operator, it runs fine
- If you comment out the similar generic function, it runs fine
