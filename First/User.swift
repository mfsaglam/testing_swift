//
//  User.swift
//  First
//
//  Created by Fatih Sağlam on 6.11.2022.
//

import Foundation

class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var outstandingTasksString: String {
        get {
            var total = 0
            for project in projects {
                total += project.items.count
            }
            return "\(total) items"
        }
    }
    
    var projects: [Project] = []
    
    func addProject(_ project: Project) {
        projects.append(project)
    }
}

class Project {
    var name: String
    var items: [ToDoItem] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addItem(_ item: ToDoItem) {
        items.append(item)
    }
    
}

class ToDoItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

///LinkedIn User
struct LinkedInUser {
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
//    func upgrade() {
//        DispatchQueue.global().async {
//            Thread.sleep(forTimeInterval: 1)
//            let center = NotificationCenter.default
//            center.post(name: LinkedInUser.upgradedNotification, object: nil)
//        }
//    }
    
//    func upgradeWithLevel() {
//        DispatchQueue.global().async {
//            Thread.sleep(forTimeInterval: 1)
//            let center = NotificationCenter.default
//            center.post(name: LinkedInUser.upgradedNotification, object: nil, userInfo: ["level": "gold"])
//        }
//    }
    
    ///Dependency injection
    func upgradeWithLevel(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: LinkedInUser.upgradedNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}

class Store {
    var user: User?
    
    func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
        Swift.assert(condition(), message(), file: file, line: line)
    }

    func buy(product: String) -> Bool {
        assert(user != nil, "We can't buy anything without a user.")
        print("The user bought \(product).")
        return true
    }
}

class StoreMock: Store {
    var wasAssertionSuccessful = false
    
    override func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
        wasAssertionSuccessful = condition()
    }
}
