import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var topConstraint: NSLayoutConstraint!
    private var animator = UIViewPropertyAnimator(duration: 0.33, curve: .linear, animations: nil)

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: self.animate)
    }

    private func animate() {
        self.performAnimations()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // Pause the animation some percent of the way complete
            self.animator.pauseAnimation()
            // Reverse the animation emulating the user interactivelly cancelling it
            self.animator.isReversed = true

            // With a non-zero durationFactor, the second animation ends up taking much longer than expected
            let durationFactor: CGFloat = 1.0
            // Uncomment this, comment out the line above to see the animation take the expected time
//            let durationFactor: CGFloat = 0.0

            self.animator.continueAnimation(withTimingParameters: nil, durationFactor: durationFactor)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Restart the animation later, and it takes much longer than expected
                let startTime = CACurrentMediaTime()
                self.performAnimations()

                self.animator.addCompletion { _ in
                    print("""
                          Completed animation, took: \(CACurrentMediaTime() - startTime) seconds, \
                          Should have taken \(self.animator.duration) seconds
                          """)
                }
            }
        }
    }

    private func performAnimations() {
        if self.animator.state == .active {
            assertionFailure("Something went wrong with this example")
        }

        self.topConstraint.constant = self.topConstraint.constant > 100 ? 90 : 300

        self.animator.addAnimations {
            self.view.layoutIfNeeded()
        }

        self.animator.startAnimation()
    }
}
