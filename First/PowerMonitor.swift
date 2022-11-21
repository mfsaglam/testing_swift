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

class UnpluggedDeviceMock: UIDevice {
    override var batteryState: UIDevice.BatteryState {
        return .unplugged
    }
}

class UnknownDeviceMock: UIDevice {
    override var batteryState: UIDevice.BatteryState {
        return .unknown
    }
}

class ChargingDeviceMock: UIDevice {
    override var batteryState: UIDevice.BatteryState {
        return .charging
    }
}
