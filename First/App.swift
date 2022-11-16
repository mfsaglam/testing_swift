//
//  App.swift
//  First
//
//  Created by Fatih Sağlam on 16.11.2022.
//

import Foundation

struct App {
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: AppUser) -> Bool {
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

struct AppUser {
    var funds: Decimal
    var age: Int
    var apps: [App]
    
    mutating func buy(_ app: App) -> Bool {
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
