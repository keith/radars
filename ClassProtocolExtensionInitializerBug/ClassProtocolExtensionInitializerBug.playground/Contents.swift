protocol Foo {
    init()
    init?(string: String)
}

extension Foo {
    init?(string: String) {
        self.init()
    }
}

/// Comment/Uncomment this to see an error on the above protocol extension
class Bar: Foo {
    required init() {}
}

/// Everything works fine if the class is final
final class Baz: Foo {
    required init() {}
}

/// Everything works fine with structs!
struct Qux: Foo {
    init() {}
}
