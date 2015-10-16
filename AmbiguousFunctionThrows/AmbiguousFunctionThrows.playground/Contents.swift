struct Error: ErrorType {}

func from<T>() -> T? {
    return "foo" as? T
}

func from<T>() throws -> T {
    if let value = "foo" as? T {
        return value
    } else {
        throw Error()
    }
}

let valid: String = try from()
let invalid: String? = from()
