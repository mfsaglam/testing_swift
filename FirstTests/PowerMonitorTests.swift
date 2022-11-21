//
//  PowerMonitorTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 21.11.2022.
//

import XCTest
@testable import First

final class PowerMonitorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUnknownDeviceShowsError() {
        let sut = PowerMonitor(device: DeviceMock2(testBatteryState: .unknown))
        
        let state = sut.getStatus()
        
        XCTAssertEqual(state, "error")
    }
    
    func testConnectedDeviceShowsUp() {
        let sut = PowerMonitor(device: DeviceMock2(testBatteryState: .charging))
        
        let state = sut.getStatus()
        
        XCTAssertEqual(state, "power is up")
    }
    
    func testUnpluggedDeviceShowsDown() {
        let sut = PowerMonitor(device: DeviceMock2(testBatteryState: .unplugged))
        
        let state = sut.getStatus()
        
        XCTAssertEqual(state, "power is down")
    }

}
