# <rdar://problem/35743469>

http://www.openradar.me/35743469

Summary:

Completing a UIViewPropertyAnimator's animations with a non-zero
duration factor takes a significant amount of time if the animator had
previously been paused and had its fractionComplete updated (possibly by
a gesture recognizer) even if the animation has already been completed.

Steps to Reproduce:

1. Create a property animator with some view animations
2. Start and pause the animator
3. Set the animators fractionComplete to 1 (driving the animation all
   the way to completion)
4. Add a completion block to the animator with a log so you know when
   it's done
5. Call continueAnimationWithTimingParameters:durationFactor: with a
   non-zero durationFactor

Expected Results:

Since the fractionComplete of the animator was set to 1, the animation
has already completed and therefore regardless of the durationFactor,
the animation should finish immediately, and call the completions.

Actual Results:

The animator takes longer than the original animation duration to
complete (in the case the durationFactor is 1) even though no visual
animation is happening during this time.

Version:
iOS 11

Notes:

- If you pass 0 as the durationFactor, it completes immediately as
  expected.
- See the attached sample project for an example
