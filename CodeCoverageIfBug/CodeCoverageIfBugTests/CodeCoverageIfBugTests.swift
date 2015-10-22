import CodeCoverageIfBug
import XCTest

final class CodeCoverageIfBugTests: XCTestCase {
    func testBrokenOn() {
        XCTAssertTrue(exampleBroken(true) == "Hi")
    }

    func testBrokenOff() {
        XCTAssertNil(exampleBroken(false))
    }

    func testFixedOn() {
        XCTAssertTrue(exampleFixed(true) == "Hi")
    }

    func testFixedOff() {
        XCTAssertNil(exampleFixed(false))
    }
}
