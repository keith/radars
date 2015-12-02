func f<T>(field: String) -> T? {
    print("Type inferred as '\(T.self)'")
    return field == "a" ? ("hi" as? T) : nil
}

// Comment this out to see the correct behavior
func f<T: RawRepresentable>(field: String) -> T? {
    return nil
}

let a: String? = f("a") ?? f("b")
print("Got '\(a)' should be 'hi'\n")

let b: String? = f("a")
print("Got '\(b)' should be 'hi'\n")

let c: String? = f("b") ?? f("a")
print("Got '\(c)' should be 'hi'")
