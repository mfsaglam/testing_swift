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
        if device.batteryState == .unknown {
            return "error"
        } else if device.batteryState == .unplugged {
            return "power is down"
        } else {
            return "power is up"
        }
    }
}

class DeviceMock: UIDevice {
    var testBatteryState: BatteryState
    
    init(testBatteryState: BatteryState) {
        self.testBatteryState = testBatteryState
    }
    
    override var batteryState: UIDevice.BatteryState {
        return testBatteryState
    }
}


