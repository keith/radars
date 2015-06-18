import UIKit

let string = "this is a normal string"
string as CVarArgType

let array = ["a", "b"].map { $0 as CVarArgType }
array

let brokenArray = ["a", "b"]
// This works fine
brokenArray.map { $0 as CVarArgType }
// This one doesn't
// Comment this out to see the issue
brokenArray as [CVarArgType]

"Finished!"
