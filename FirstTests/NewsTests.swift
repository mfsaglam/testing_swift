//
//  NewsTest.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 26.11.2022.
//

import XCTest
@testable import First

final class NewsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewsFetchCallsResume() {
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = News(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories triggers resume()")
        
        news.fetch(using: session) {
            XCTAssertEqual(session.dataTask?.resumeWasCalled, true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

}
