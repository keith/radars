struct Error: ErrorType {}

class Example {
    let string: String

    init() throws {
        throw Error()
    }
}
