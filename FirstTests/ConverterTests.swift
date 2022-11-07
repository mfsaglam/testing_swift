//
//  ConverterTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 3.11.2022.
//

import XCTest
@testable import First

final class ConverterTests: XCTestCase {
    
    var sut: Converter!
    
    func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
        sut = Converter()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test32FahrenheitIs0Celcius() {
        let input = 32.0
        
        let result = sut.convertToCelsius(fahrenheit: input)
        
        XCTAssertEqual(result, 0, accuracy: 0.000001)
    }
    
    func test212FahrenheitIs100Celcius() {
        let input = 212.0
        
        let result = sut.convertToCelsius(fahrenheit: input)

        XCTAssertEqual(result, 100, accuracy: 0.000001)
    }
    
    func test10DevidedBy3Is3AndHasReminder1() {
        let divident = 10
        let divisor = 3
        
        let result = sut.divisionRemainder(of: divident, dividedBy: divisor)
        
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 2)
    }

}
