import UIKit

private let kControlPoint1 = CGPoint(x: 0.21, y: 0.75)
private let kControlPoint2 = CGPoint(x: 0.19, y: 0.95)


final class ViewController: UIViewController {
    private var statusBarHidden = false

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateStatusBar()
    }

    private func animateStatusBar() {
        let animator = UIViewPropertyAnimator(duration: 0.1, controlPoint1: kControlPoint1,
                                              controlPoint2: kControlPoint2)
        {
            UIView.animate(withDuration: 0) {
                self.statusBarHidden = !self.statusBarHidden
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }

        animator.startAnimation()
        animator.addCompletion { _ in
            self.animateStatusBar()
        }
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }

    override var prefersStatusBarHidden: Bool {
        return self.statusBarHidden
    }
}
