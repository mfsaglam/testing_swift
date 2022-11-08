//
//  ViewControllerTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 8.11.2022.
//

import XCTest
@testable import First

final class ViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func DISABLED_testViewDidLoadOutletsAreNotNil() {
        let sut = ViewController()
        sut.loadViewIfNeeded()
                
        XCTAssertNotNil(sut.submitButton)
    }

}
