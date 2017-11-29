import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var topConstraint: NSLayoutConstraint!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let animator = UIViewPropertyAnimator(duration: 2, curve: .linear) {
            self.topConstraint.constant = 200
            self.view.layoutIfNeeded()
        }

        animator.startAnimation()
        animator.pauseAnimation()
        animator.fractionComplete = 1

        let continueTime = CACurrentMediaTime()
        animator.addCompletion { _ in
            print("Ended \(CACurrentMediaTime() - continueTime) seconds after continuing")
        }

        // Set this to 0 to see the expected behavior
        let durationFactor: CGFloat = 1
        animator.continueAnimation(withTimingParameters: nil, durationFactor: durationFactor)
    }
}
