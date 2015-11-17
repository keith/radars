class A {
    func foo() {}
}

class B: A {
    override func foo() {
        _ = { [weak self] in
            super.foo()
        }
    }
}
