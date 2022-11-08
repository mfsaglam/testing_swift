//
//  ThrowingTests.swift
//  FirstTests
//
//  Created by Fatih Sağlam on 8.11.2022.
//

import XCTest

enum GameError: Error {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

struct Game {
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}

final class ThrowingTests: XCTestCase {
        
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBioBiltzFails() {
        let sut = Game(name: "BioBlitz")
        
        do {
            try sut.play()
            XCTFail()
        } catch GameError.notPurchased {
            //there is no XCTSuccess()
        } catch {
            XCTFail()
        }
        
    }
    
}
