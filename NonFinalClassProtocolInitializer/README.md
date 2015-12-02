# <rdar://23718307>

<http://www.openradar.me/23718307>

Summary:

When you have a non-final class conforming to a protocol that contains
an initializer and a static function returning `Self`. If you add a
protocol extension implementing the static function, you cannot compile
the class.

Steps to reproduce:

1. Attempt to compile the example file with
  `swift NonFinalClassProtocolInitializer.swift`

Expected results:

Everything compiles correctly, and the static function calls through the
initializer on the class no problem.

Actual results:

A compiler error is produced.

Notes:

- Everything works fine with structs
- Everything works fine with `final` classes
- Uncomment the static function override in the example for it to
  compile fine.
