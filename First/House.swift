//
//  House.swift
//  First
//
//  Created by Fatih Sağlam on 14.11.2022.
//

import Foundation

struct House {
    var bedrooms: Int
    var bathrooms: Int
    var cost: Int

    init(bedrooms: Int, bathrooms: Int) {
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.cost = bedrooms * bathrooms * 50_000
    }

    func checkSuitability(desiredBedrooms: Int, desiredBathrooms: Int) -> Bool {
        if bedrooms >= desiredBedrooms && bathrooms >= desiredBathrooms {
            return true
        } else {
            return false
        }
    }
}

protocol HouseProtocol {
    var numberOfViewings: Int { get set }

    func conductViewing()
}

class Buyer {
    func view(_ house: HouseProtocol) {
        house.conductViewing()
    }
}

class HouseForSale: HouseProtocol {
    var numberOfViewings = 0

    func conductViewing() {
        numberOfViewings += 1
    }
}
