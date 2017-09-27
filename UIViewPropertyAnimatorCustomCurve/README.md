# <rdar://problem/34674968>

http://www.openradar.me/34674968

Summary:

If you have a UIViewPropertyAnimator performing autolayout animations
with a non-linear curve, and you reverse it, and then call
`continueAnimation(withTimingParameters:durationFactor:)`, you end up
with some unexpected animations.

There seem to be 2 different cases of this:

1. If you're using custom control points, when you reverse and continue,
   the view will jump to what would've been its final position, had you
   not reversed the animation, and then begins to animate back to the
   starting position. This happens instead of animating from its current
   position, back to the starting position.
2. If you use a non-linear built in curve line `.easeIn` the view does
   not jump to the final position, but does seem to very quickly
   complete a significant portion of the reversed animation, before
   quickly slowing down. This behavior is of course different per built
   in curve, but none of them seem to behave correctly.

Steps to Reproduce:

1. Open the attached sample project and run it on an iOS 11 simulator

Expected Results:

- For the custom control points case, you should not see the view jump
  to its final position, before animating in reverse
- For the built in curve case, the curve seems to be exaggerated after
  continuing

Actual Results:

- With custom control points the view jumps across the screen, only to
  animate back to the starting point
- With a built in curve, the view animates very slowly back to the
  original position

Version:

iOS 11.0

Notes:

- This seems to be a regression from iOS 10. Using an iOS 10.3
  simulator, all these combinations work as expected
- Attached is the sample project, and 2 videos, one from an iOS 10.3.1
  simulator, and one from an iOS 11 simulator. You can see the jumping
  issue there.
- Different combinations are commented in/out in the sample project in
  ViewController.swift, you can see different issues there.
