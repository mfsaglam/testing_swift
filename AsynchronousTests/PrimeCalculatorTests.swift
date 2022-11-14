//
//  PrimeCalculatorTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 9.11.2022.
//

import XCTest
@testable import First

final class AI {
    func startMove(_ completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
}

final class PrimeCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testPrimesUpTo100ShouldBe25() {
//        // given
//        let maximumCount = 100
//        let expectation = XCTestExpectation(description: "calculate primes up to \(maximumCount)")
//
//        // when
//        PrimeCalculator.calculate(upTo: maximumCount) {
//            // then
//            XCTAssertEqual($0.count, 25)
//            expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 10)
//    }
//
//    func testPrimesUpTo100ShouldBeStreamed25() {
//        // given
//        let maximumCount = 100
//        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
//        expectation.expectedFulfillmentCount = 25
//
//        // when
//        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
//            expectation.fulfill()
//        }
//
//        wait(for: [expectation], timeout: 3)
//    }
    
    func testPrimesUpTo100ShouldBe25() {
        // given
        let maximumCount = 100

        // when
        let progress = PrimeCalculator.calculate(upTo: maximumCount) { primes in
            XCTAssertEqual(primes.count, 25)
        }

        // then
        let predicate = NSPredicate(
            format: "%@.completedUnitCount == %@", argumentArray: [progress, maximumCount]
        )

        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10)
    }
    
    func testAIShouldWait2SecondsBeforeMove() {
        // given
        let ai = AI()
        let expectation = XCTestExpectation(description: "Computer must wait at least two seconds before taking its turn")
        expectation.isInverted = true

        // when
        ai.startMove() {
            // then
            // pause competed; mark that we finished our turn
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.8)
    }
    
    func testPrimePerformance() {
        measure {
            _ = PrimeCalculator.calculate(upTo: 1_000_000)
        }
    }
}
