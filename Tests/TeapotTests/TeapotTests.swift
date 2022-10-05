import XCTest
import XCTVapor
@testable import Teapot

final class TeapotTests: XCTestCase {
    func testCookieName() throws {
        let expectedValue = "isTea"
        
        XCTAssertEqual(TeapotMiddleware.Header.isTea.rawValue, expectedValue)
    }
    
    func testMiddleware() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        app
            .grouped(TeapotMiddleware())
            .get { _ -> String in "🫖" }
        
        try app.testable().test(.GET, "") { res in
            XCTAssertEqual(res.status, .imATeapot)
            XCTAssertNotEqual(res.body.string, "🫖")
        }
        
        let headers: HTTPHeaders = [TeapotMiddleware.Header.isTea.rawValue: true.description]
        
        try app.testable().test(.GET, "", headers: headers) { res in
            XCTAssertNotEqual(res.status, .imATeapot)
            XCTAssertEqual(res.body.string, "🫖")
        }
    }
}
