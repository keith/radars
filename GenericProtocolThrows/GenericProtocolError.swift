protocol Mapper {
    func from<T>(field: String) -> T
    func from<T: RawRepresentable>(field: String) -> T
}

struct MapperFromJSON: Mapper {
    func from<T>(field: String) -> T {}
    func from<T: RawRepresentable>(field: String) -> T {}
}
