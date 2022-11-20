//
//  HouseTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 14.11.2022.
//

import XCTest
@testable import First

final class HouseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test4Bed2BathHouse_Fits3Bed2BathRequirements() {
        // given
        let house = House(bedrooms: 4, bathrooms: 2)
        let desiredBedrooms = 3
        let desiredBathrooms = 2

        // when
        let suitability = house.checkSuitability(desiredBedrooms: desiredBedrooms, desiredBathrooms: desiredBathrooms)

        // then
        XCTAssertTrue(suitability)
    }
    
    func testViewingHouseAddsOneToViewing() {
        let house = HouseForSale()
        let startViewings = house.numberOfViewings
        
        house.conductViewing()
        
        XCTAssertEqual(house.numberOfViewings, startViewings + 1)
    }
    
    func testBuyerViewingHouseAddsOneToViewings() {
        let buyer = Buyer()
        let house = HouseForSaleMock()
        
        buyer.view(house)
        
        XCTAssertEqual(house.numberOfViewings, 1)
    }

}
