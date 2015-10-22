import Foundation

public func exampleBroken(flag: Bool) -> String? {
    if flag {
        return "Hi"
    } else {
        return nil
    }
}

public func exampleFixed(flag: Bool) -> String? {
    if flag {
        return "Hi"
    }

    return nil
}
