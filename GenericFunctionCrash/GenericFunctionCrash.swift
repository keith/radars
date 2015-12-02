func g<T>(a: Int) -> T? {
    return ("hi" as! T)
}

// If you comment this out, it works fine
func g<T: RawRepresentable>(a: Int) -> T? {
    return nil
}

let a: String? = g(1)
    // If you comment this out, it works fine
    ?? g(2)
print(a)
