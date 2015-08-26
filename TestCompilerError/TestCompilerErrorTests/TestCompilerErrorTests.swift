@testable import TestCompilerError
import Nimble
import Quick
import XCTest

class TestCompilerErrorTests: XCTestCase {
    func testExample() {
        XCTAssertEqual("foo".example(), "example")
    }
}

class TestCompilerErrorQuickSpec: QuickSpec {
    override func spec() {
        describe("example") {
            it("should compile!") {
                expect("foo".example()).to(equal("example"))
            }
        }
    }
}
