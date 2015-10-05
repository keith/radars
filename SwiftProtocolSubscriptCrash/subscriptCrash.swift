protocol Protocol {
    subscript(val: String, label arg: String) -> Int { get }
}

class Invalid: Protocol {
    subscript(val: String, label: String) -> Int {
        return 1
    }
}
