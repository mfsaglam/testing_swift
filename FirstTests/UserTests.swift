//
//  UserTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 6.11.2022.
//

import XCTest
@testable import First

final class UserTests: XCTestCase {
    
    var sut: User!
    
    func createTestUser(projects: Int, itemsPerProject: Int) -> User {
        let user = User(name: UUID().uuidString)
        XCTAssertEqual(user.projects.count, 0)
        
        for album in 1...projects {
            let project = Project(name: "Album #\(album)")
            user.addProject(project)
            
            for song in 1...itemsPerProject {
                let item = ToDoItem(name: "Write song #\(song)")
                project.addItem(item)
            }
        }
        return user
    }

    override func setUpWithError() throws {
        sut = createTestUser(projects: 3, itemsPerProject: 10)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test3ItemsAnd10SongsAre30ItemsInTotal() {
        
        let rowTitle = sut.outstandingTasksString
        
        XCTAssertEqual(rowTitle, "30 items")
    }
    
    func testStoreBuyingWithoutUser() {
        // given
        let store = StoreMock()

        // when
        _ = store.buy(product: "War of the Worlds")

        // then
        XCTAssertFalse(store.wasAssertionSuccessful)
    }

}
