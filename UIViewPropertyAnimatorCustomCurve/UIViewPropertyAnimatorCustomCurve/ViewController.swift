import UIKit

private let kControlPoint1 = CGPoint(x: 0.2136, y: 0.7532)
private let kControlPoint2 = CGPoint(x: 0.1996, y: 0.9574)

final class ViewController: UIViewController {
    @IBOutlet private var bottomConstraint: NSLayoutConstraint!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Just to give us some time to settle
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.animate)
    }

    private func animate() {
        // De-activate the bottom constraint on the view, which means it wants to attach to the top
        self.bottomConstraint.isActive = false

        // With an animator with custom control points, you will see the view fly to the top, when continuing
        // the reversed animation, instead of continuing from its current position
        let animator = UIViewPropertyAnimator(
            duration: 1, controlPoint1: kControlPoint1,
            controlPoint2: kControlPoint2, animations: self.view.layoutIfNeeded
        )

        // With an animator using a built in curve, the view won't jump, but when you continue, the animation
        // will quickly go back to the bottom, before slowly finishing
//        let animator = UIViewPropertyAnimator(
//            duration: 1, curve: .easeIn, animations: self.view.layoutIfNeeded
//        )

        animator.startAnimation()

        // Emulate user interaction by stopping the animation short of completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animator.pauseAnimation()

            // Pause just to see where the view got to before reversing
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                // By reversing an then continuing the animation, you'll see the iOS 11 behavior
                animator.isReversed = true
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 1)

                // If instead you continue with a linear curve, you can avoid some of the jumping behavior
//                animator.continueAnimation(withTimingParameters: UICubicTimingParameters(animationCurve: .linear), durationFactor: 1)
            }
        }
    }
}
