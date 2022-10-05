import XCTest
@testable import Teapot

final class TeapotTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Teapot().text, "Hello, World!")
    }
}
