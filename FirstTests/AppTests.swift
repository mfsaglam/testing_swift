//
//  AppTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 17.11.2022.
//

import XCTest
@testable import First

final class AppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserCanNotBuyUnreleasedApp() {
        
        struct UnreleasedAppStub: AppProtocol {
            var price: Decimal = 0
            var minimumAge = 0
            var isReleased = false

            func canBePurchased(by user: AppUserProtocol) -> Bool {
                return false
            }
        }
        
        var sut = AppUser(funds: 100, age: 22, apps: [])
        let unreleasedApp = UnreleasedAppStub()
        
        let wasBought = sut.buy(unreleasedApp)
        
        XCTAssertEqual(wasBought, false)
    }

}
