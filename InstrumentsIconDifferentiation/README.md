# <rdar://23251278>

<http://www.openradar.me/23251278>

Summary:

For debug, beta, and release builds we use app icons of different colors
along with different bundle identifiers. This means a developer's device
can have multiple builds on it at once. When choosing which process to
monitor in Instruments, the colors of the app icons are not different,
Instruments shows just one of the icons multiple times.

Steps to Reproduce:

1. Install an app on your device
2. Change the bundle identifier and app icon
3. Install a second version on your device
4. In Instruments go to attach to a process on the device

Expected Results:

The app icons icons should be the same as the icons shown on the
device's homescreen.

Actual Results:

A single icon is repeated making it difficult to determine which process
to attach to.

Notes:

- See the attached screenshots for an example, one is instruments, the
  other is the correct behavior shown in the Xcode devices window.
