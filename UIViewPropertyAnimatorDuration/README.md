# <rdar://problem/34675414>

http://www.openradar.me/34675414

Summary:

When using a re-using UIViewPropertyAnimator that has previously started
its animations, been reversed, and the completed them with a non-zero
durationFactor (passed to
`continueAnimation(withTimingParameters:durationFactor:)`), any
subsequent animations you run with the same UIViewPropertyAnimator are
performed much more slowly than the duration of the animator.

Steps to Reproduce:

1. Open the sample project and run it on iOS 10 or 11

Or:

1. Create a UIViewPropertyAnimator and hold on to it
2. Add some animations to it
3. Start and immediately pause the animator
4. Set isReversed = true
5. Call continue with a non-zero durationFactor
6. Re-use the animator for another set of animations

Expected Results:

The first animation occurs, then completes, then the second animation
should be performed at the correct duration of 0.33 seconds

Actual Results:

After the first animation completes, the second animation takes over 1
second to complete

Version:

iOS 11

Notes:

- This is also a bug on iOS 10
- You can workaround this by re-creating UIViewPropertyAnimator
  instances for each set of animations
- This happens with linear curves and springs
- Passing 0 as the durationFactor fixes this issue, unless you want to
  impact the duration of the continuation
- See the attached sample project and video for the example
