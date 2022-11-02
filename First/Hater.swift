//
//  Hater.swift
//  First
//
//  Created by Fatih Sağlam on 2.11.2022.
//

import Foundation

struct Hater {
    var hating = false

    mutating func hadABadDay() {
        hating = true
    }

    mutating func hadAGoodDay() {
        hating = false
    }
}
