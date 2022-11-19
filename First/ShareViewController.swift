//
//  ShareViewController.swift
//  First
//
//  Created by Fatih Sağlam on 19.11.2022.
//

import UIKit

class ShareViewController: UIViewController {
    
    override func loadView() {
        view = ShareView(shareAction: shareContent)
    }
    
    func shareContent(text: String) {
        print("sharing \(text)...")
    }
    
}
