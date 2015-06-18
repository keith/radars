# <rdar://21435430>

<http://www.openradar.me/21435430>

Swift 1.2 CVarArgType array casting crash

Summary:

Converting an array of type `[String]` to a `[CVarArgType]` doesn't work
as expected. Converting literal arrays works fine but converting
existing array references crashes.

Steps to Reproduce:

1. `let array = ["a", "b"].map { $0 as CVarArgType } // Works fine`
2. `let brokenArray = ["a", "b"]`
3. `brokenArray as [CVarArgType] // Doesn't work`
4. `brokenArray.map { $0 as CVarArgType } // Works fine`

Expected Results:

You should be able to cast a `[String]` to `[CVarArgType]`

Actual Results:

You have to map the conversion over the array rather than casting with
`as`
