# <rdar://19464151>

<http://www.openradar.me/radar?id=5347857389322240>

NSUserNotificationCenter assigns it's delegate leading to crashes.

Steps:

Set a temporary object as the NSUserNotificationCenter delegate, present
the notification, exit the scope so the object is deallocated, the app
crashes.

Expected:

The deallocation of the weak delegate should make it become nil and
messaging nil shouldn't crash the app.

Actual:

The deallocation of the assigned delegate crashes the app.
