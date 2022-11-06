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

    override func setUpWithError() throws {
        sut = User(name: "Taylor Swift")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test3ItemsAnd10SongsAre30ItemsInTotal() {
        for album in 1...3 {
            let project = Project(name: "Album #\(album)")
            sut.addProject(project)
            
            for song in 1...10 {
                let item = ToDoItem(name: "Write song #\(song)")
                project.addItem(item)
            }
        }
        
        let rowTitle = sut.outstandingTasksString
        
        XCTAssertEqual(rowTitle, "30 items")
    }

}
