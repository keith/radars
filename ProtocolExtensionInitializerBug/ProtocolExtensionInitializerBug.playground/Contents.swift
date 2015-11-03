protocol Foo {
    init?(string: String)
}

extension Foo {
    init?(string: String) { return nil }
}

/// This one works
struct Baz: Foo {}
Baz(string: ":)")

/// This one does not
struct Bar {}
extension Bar: Foo {}
Bar(string: ":(")
