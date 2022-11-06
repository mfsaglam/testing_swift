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
        let number1 = 10
        let number2 = 3
        
        let result = sut.divisionRemainder(of: number1, dividedBy: number2)
        
        XCTAssertEqual(result.quotient, 3)
        XCTAssertEqual(result.remainder, 1)
    }

}
