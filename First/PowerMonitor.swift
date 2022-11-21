//
//  PowerMonitor.swift
//  First
//
//  Created by Fatih Sağlam on 21.11.2022.
//

import UIKit

struct PowerMonitor {
    var device: UIDevice
    
    func getStatus() -> String {
        switch device.batteryState {
        case .unknown:
            return "error"
        case .unplugged:
            return "power is down"
        case .charging:
            return "power is up"
        case .full:
            return "power is up"
        @unknown default:
            return "error"
        }
    }
}
