func g(string: String) -> String {
    let result = string == "b" ? "hi" : ""
    print("Called with '\(string)' returning '\(result)'")
    return result
}

public extension CollectionType {
    public func find(includedElement: Generator.Element -> Bool) -> Generator.Element? {
        if let index = self.indexOf(includedElement) {
            return self[index]
        }

        return nil
    }
}

func f(fields: [String]) {
   _ = fields.lazy
        .map { g($0) }
        .find { !$0.isEmpty }
}

f(["a", "b", "c"])
