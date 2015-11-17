struct Thing {
    init?() {}
}

// This throws a compiler error
let things = Thing().map { thing in
    // Commenting out this makes it compile
    _ = thing
    return thing
}

// Adding an explicit type annotation (including return value) fixes it
let things2 = Thing().map { (thing: Thing) -> Thing in
    _ = thing
    return thing
}
