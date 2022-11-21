//
//  PowerMonitor.swift
//  First
//
//  Created by Fatih Sağlam on 21.11.2022.
//

import UIKit

struct PowerMonitor {
    ///using partial mock
    ///
    // var device: UIDevice
    
    ///using full mock
    ///
    var device: DeviceProtocol
    
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

///Partial mock
//class DeviceMock: UIDevice {
//    var testBatteryState: BatteryState
//
//    init(testBatteryState: BatteryState) {
//        self.testBatteryState = testBatteryState
//    }
//
//    override var batteryState: UIDevice.BatteryState {
//        return testBatteryState
//    }
//}

///Full mock
protocol DeviceProtocol {
    var batteryState: UIDevice.BatteryState { get }
}

extension UIDevice: DeviceProtocol { }

struct DeviceMock2: DeviceProtocol {
    var testBatteryState: UIDevice.BatteryState

    var batteryState: UIDevice.BatteryState {
        return testBatteryState
    }
}


