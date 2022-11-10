//
//  PrimeCalculatorTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 9.11.2022.
//

import XCTest
@testable import First

final class PrimeCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrimesUpTo100ShouldBe0() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "calculate primes up to \(maximumCount)")

        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            // then
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testPrimesUpTo100ShouldBe25() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25

        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 3)
    }
}
