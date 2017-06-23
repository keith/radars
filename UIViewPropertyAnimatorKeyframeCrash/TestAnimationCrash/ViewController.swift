import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var constraint: NSLayoutConstraint!
    @IBOutlet private var animateView: UIView!

    /// Having a `UIViewPropertyAnimator` with spring `timingParameters`, cause this to crash
    private let animator = UIViewPropertyAnimator(duration: 1, timingParameters: UISpringTimingParameters(dampingRatio: 0.85))

    /// Replacing the `timingParameters` with a cubic function stops it from crashing
    /// Comment out the animator above, and uncomment this one to see it work
//    private let animator = UIViewPropertyAnimator(duration: 1, timingParameters: UICubicTimingParameters(animationCurve: .easeInOut))

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animate()
    }

    private func animate() {
        self.constraint.constant = 100

        /// Animating `layoutIfNeeded` after changing a constraint, mixed with a keyframe animation causes a crash
        /// Comment out this animation and uncomment the `layoutIfNeeded` inside the keyframe below to see it work
        self.animator.addAnimations {
            self.view.layoutIfNeeded()
        }

        self.animator.addAnimations {
            UIView.animateKeyframes(withDuration: 0.0, delay: 0.0, options: [], animations: {
                self.view.layoutIfNeeded()
//                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
//                    self.view.layoutIfNeeded()
//                }

                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                    self.animateView.alpha = 0.5
                }
            }, completion: nil)
        }

        /// The crash only happens when you start and then pause the animation, the second start is just to see solutions work.
        self.animator.startAnimation()
        self.animator.pauseAnimation()
        self.animator.startAnimation()
    }
}

/// Creating the selector that UIKit is attempting to call solves this problem as well. The `fromValue` gets set to a `NSPoint`
/// Uncomment this to see it work, you'll see that it is written to and never read from
//extension CAKeyframeAnimation {
//    var fromValue: Any? {
//        set {
//            print("Attempting to set \(String(describing: newValue))")
//        }
//        get {
//            assertionFailure("Attempting to get `fromValue`")
//            return nil
//        }
//    }
//}
