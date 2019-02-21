# <rdar://problem/42564768>

http://www.openradar.me/42564768

Order of Swift files in Compile Sources causes code coverage report not
to be generated

Summary:

With a Swift static library with these characteristics:

1. SWIFT_COMPILATION_MODE=wholemodule
2. ENABLE_TESTABILITY=YES
3. You have 2 files with a specific order in the Compile Sources phase

The test coverage report fails to be generated with this error:

```
Failed to generate coverage for target 'WMOCoverageTests.xctest' at path /Users/ksmiley/Downloads/WMOCoverage/build.noindex/WMOCoverage/Build/Products/Debug-iphonesimulator/WMOCoverageTests.xctest/WMOCoverageTests: Malformed instrumentation profile data
```

Steps to Reproduce:

1. Create a new Swift static library project
2. Add a test target for your library
3. Create 2 source files Foo and Bar, add top level functions in both,
   reorder the Compile Sources build phase to have Bar first
4. Add a single test file BarTests, add a test calling the function in
   Bar
5. Enable testability and WMO for your library
6. Configure a scheme to run the tests and gather coverage data
7. Run the tests and view the coverage report


Expected Results:

A code coverage report is generated showing Foo.swift has 0% coverage
and Bar.swift has 100% coverage

Actual Results:

You get this error:

```
Failed to generate coverage for target 'WMOCoverageTests.xctest' at path /Users/ksmiley/Downloads/WMOCoverage/build.noindex/WMOCoverage/Build/Products/Debug-iphonesimulator/WMOCoverageTests.xctest/WMOCoverageTests: Malformed instrumentation profile data
```

Version:
Xcode 10.0 beta 4 (10L213o)

Notes:

- Use the attached sample project as an example
- Disabling testability fixes this
- Using incremental compilation instead of WMO fixes this
- Putting Foo.swift above Bar.swift in the Compile Sources build phase fixes this
- The test log, xccovreport, and profdata are attached
