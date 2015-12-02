protocol Foo {
    init()
    static func create() -> Self
}

extension Foo {
    static func create() -> Self {
        return self.init()
    }
}

// Structs work fine
struct Bar: Foo {
    init() {}
}
Bar.create()

// Final classes work fine
final class Qux: Foo {
    init() {}
}
Qux.create()

// Non-final classes throw an error
class Baz: Foo {
    required init() {}

    // If you duplicate the create method that's in the protocol
    // extension it compiles
//    static func create() -> Self {
//        return self.init()
//    }
}
Baz.create()
