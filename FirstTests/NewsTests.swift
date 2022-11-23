//
//  NewsTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 23.11.2022.
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

    func testNewsFetchLoadsCorrectURL() {
        // given
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = News(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories.")

        // when
        news.fetch(using: session) {
            XCTAssertEqual(URL(string: "https://www.apple.com/newsroom/rss-feed.rss"), session.lastURL)
            expectation.fulfill()
        }

        // then
        wait(for: [expectation], timeout: 5)
    }

}
