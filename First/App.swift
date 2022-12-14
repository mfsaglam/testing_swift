//
//  App.swift
//  First
//
//  Created by Fatih Sağlam on 16.11.2022.
//

import Foundation

protocol AppUserProtocol {
    var funds: Decimal { get set }
    var age: Int { get set }
    var apps: [AppProtocol] { get set }

    mutating func buy(_ app: AppProtocol) -> Bool
}

protocol AppProtocol {
    var price: Decimal { get set }
    var minimumAge: Int { get set }
    var isReleased: Bool { get set }

    func canBePurchased(by user: AppUserProtocol) -> Bool
    static func printTerms()
}

extension AppProtocol {
    static func printTerms() {
        print("Here are 50 pages of terms and conditions for you to read on a tiny phone screen.")
    }
}

struct App: AppProtocol {
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: AppUserProtocol) -> Bool {
        guard isReleased else {
            return false
        }
        
        guard user.funds >= price else {
            return false
        }
        
        if user.age >= minimumAge {
            return true
        } else {
            return false
        }
    }
}

struct AppUser: AppUserProtocol {
    var funds: Decimal
    var age: Int
    var apps: [AppProtocol]

    mutating func buy(_ app: AppProtocol) -> Bool {
        let possible = app.canBePurchased(by: self)

        if possible {
            apps.append(app)
            funds -= app.price
            return true
        } else {
            return false
        }
    }
}
