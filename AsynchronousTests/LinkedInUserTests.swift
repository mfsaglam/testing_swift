//
//  LinkedInUsers.swift
//  AsynchronousTests
//
//  Created by Fatih Sağlam on 13.11.2022.
//

import XCTest
@testable import First

final class LinkedInUserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserUpgradedPostsNotification() {
        // given
        let user = LinkedInUser()
        let expectation = XCTNSNotificationExpectation(name: LinkedInUser.upgradedNotification)

        // when
        user.upgrade()

        // then
        wait(for: [expectation], timeout: 3)
    }
    
    func testUserUpgradedWithLevelPostsNotification() {
        // given
        let user = LinkedInUser()
        let expectation = XCTNSNotificationExpectation(name: LinkedInUser.upgradedNotification)

        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }

            if level == "gold" {
                return true
            } else {
                return false
            }
        }

        // when
        user.upgradeWithLevel()

        // then
        wait(for: [expectation], timeout: 3)
    }

}
