import XCTest
@testable import SwiftTea

final class SwiftTeaTests: XCTestCase {
    func testTeaCookie() throws {
        let url = try XCTUnwrap(URL(string: "some.url"))
        let urlRequest = URLRequest(url: url)
        let teaRequest = urlRequest.teaRequest
        
        let cookies = try XCTUnwrap(teaRequest.allHTTPHeaderFields)
        
        let expectedCookieName = "isTea"
        let expectedCookieValue = true.description
        
        XCTAssertEqual(cookies[expectedCookieName], expectedCookieValue)
    }
    
    func testTeaURLRequest() throws {
        let url = try XCTUnwrap(URL(string: "some.url"))
        let teaRequest = URLRequest.tea(url: url)
        
        let cookies = try XCTUnwrap(teaRequest.allHTTPHeaderFields)
        
        let expectedCookieName = "isTea"
        let expectedCookieValue = true.description
        
        XCTAssertEqual(cookies[expectedCookieName], expectedCookieValue)
    }
}
