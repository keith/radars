# <rdar://problem/34785863>

http://www.openradar.me/34785863

Summary:

When animating status bar appearance using a UIViewPropertyAnimator, if
you start a subsequent animation while the first one is still animating,
UIStatusBarItemView crashes when trying to set a nil key on CALayer

Steps to Reproduce:

Run the attached sample project on an iOS 10.3 simulator

Expected Results:

The status bar animates multiple times in a row

Actual Results:

It crashes after a little while with:

```
2017-10-03 01:16:04.481 StatusBarAnimationCrash[94054:1174550] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[CALayer valueForKey:]: attempt to retrieve a value for a nil key'
```

Version:

iOS 10.3

Notes:

I haven't been able to reproduce this on iOS 11, but I'm not sure if
it's fixed or not since it's intermittent even on iOS 10.

This can be worked around if the status bar animation isn't performed in
a nested UIView.animate block
