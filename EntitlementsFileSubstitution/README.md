# <rdar://31383369>

<http://www.openradar.me/31383369>

Summary:

Starting with Xcode 8.3, entitlements files with variables that need to
be resolved with a configuration's build settings, pulls the values of
the variables from the Debug configuration instead of from the active
configuration, resulting in the wrong values.

Steps to Reproduce:

1. Create a new iOS project
2. Add an entitlements file with the app groups entitlement
3. Edit the entitlements file to read $(SOME_VAR) to define the app
   group suite name
4. Define SOME_VAR in Xcode, but make it different between the Debug and
   Release configuration
5. Build the project from the command line with `xcodebuild
   -configuration Release`

Expected Results:

`SOME_VAR` is referenced from the Release configuration

Actual Results:

`SOME_VAR` is referenced from the Debug configuration

Version:

Xcode 8.3 (8E162)

Notes:

- See the attached example project and logs for an example
- Build it with `xcodebuild -configuration Release` (you may have to
  change the bundle ID first
- Also see `releasebuildsettings.txt` which was generated via
  `xcodebuild -configuration Release -showBuildSettings`. This has the
  correct value for `SOME_VAR`
- See `output.log` to see the output from running the above command. As
  you can see, the incorrect value is substituted.
