# <rdar://32939029>

<http://www.openradar.me/32939029>

Summary:

In Xcode 8 with the iOS 10 SDK, if you attempt to animate a
NSLayoutConstraint constant change (by calling `layoutIfNeeded`)
alongside a `UIView` keyframe animation both from a
`UIViewPropertyAnimator` with a spring timing curve, your app crashes.

Steps to Reproduce:

1. Create a `UIViewPropertyAnimator` with spring timing parameters
2. Create a view with a constraint to be animated
3. Change the constant of the constraint, add an animation block to the
   animator calling `layoutIfNeeded` on the appropriate view
4. Add another animation block to the animator where you attempt to use
   a keyframe animation
5. Start and pause the animator

Expected Results:

The animation is started and paused, and can happily be resumed

Actual Results:

The app crashes with `-[CAKeyframeAnimation setFromValue:]: unrecognized
selector sent to instance`

Version:

iOS 10.3.1

Notes:

- Run the attached project to see the issue and a few workarounds
- This seems to be fixed in Xcode 9 beta 1 with the iOS 11 SDK
- You can work around this by:
  1. Not using a spring for the timing parameters
  2. Putting the `layoutIfNeeded` call in the keyframe animation as well
  3. Add an extension on `CAKeyframeAnimation` where you define a
    `fromValue` and ignore it being set
