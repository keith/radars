## <rdar://19880996>

<http://www.openradar.me/19880996>

Summary:

When using target action, at least with UIRefreshControl, to call a
swift function that has a default value, the app crashes.

Steps to Reproduce:

1. Create a UITableViewController with a UIRefreshControl
2. Add a target to the UIRefreshControl such as `refresh:`
3. Create the refresh function with this signature `@objc func
   reload(sender: UIRefreshControl? = nil)`

Expected Results:

`reload:` is called and everything is fine.

Actual Results:

The application crashes with `unrecognized selector sent to instance`

Notes:

See the attached project for an example.
