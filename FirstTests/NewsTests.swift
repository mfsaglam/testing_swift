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

    func testNewsFetchCallsResume() {
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = News(url: url)
        let session = URLSessionMock(testingResume: true)
        let expectation = XCTestExpectation(description: "Downloading news stories triggers resume()")
        
        news.fetch(using: session) {
            XCTAssertTrue(session.dataTask?.resumeWasCalled ?? false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNewsStoriesAreFetched() {
        // given
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = News(url: url)
        let session = URLSessionMock()
        session.testData = Data("Hello, world!".utf8)
        let expectation = XCTestExpectation(description: "Downloading news stories triggers resume().")

        // when
        news.fetch(using: session) {
            XCTAssertEqual(news.stories, "Hello, world!")
            expectation.fulfill()
        }

        // then
        wait(for: [expectation], timeout: 5)
    }
}
