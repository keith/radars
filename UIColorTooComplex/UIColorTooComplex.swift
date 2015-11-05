import UIKit

extension UIColor {
    var isVeryBright: Bool {
        let components = CGColorGetComponents(self.CGColor)
        let colorBrightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return colorBrightness > 0.8
    }
}
