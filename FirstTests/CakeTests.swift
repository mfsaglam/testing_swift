//
//  CakeTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 15.11.2022.
//

import XCTest
@testable import First

final class CakeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThreeIngredientCakeCosts9() {
        // given
        let cake = Cake()
        let ingredients = ["chocolate", "cherries", "frosting"]
        
        // when
        let cost = cake.bake(ingredients: ingredients)
        
        // then
        XCTAssertEqual(cost, 10)
    }

}
