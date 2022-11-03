//
//  Converter.swift
//  First
//
//  Created by Fatih Sağlam on 3.11.2022.
//

import Foundation

struct Converter {
    func convertToCelsius(fahrenheit: Double) -> Double {
        return (fahrenheit - 32) * 5 / 9
    }
}
