//
//  Cake.swift
//  First
//
//  Created by Fatih Sağlam on 15.11.2022.
//

import Foundation

struct Cake {
    func bake(ingredients: [String]) -> Int {
        for ingredient in ingredients {
            print("Adding \(ingredient).")
        }

        let cost = 1 + (ingredients.count * 3)
        print("The cake is ready; please pay \(cost).")
        return 10
    }
}
