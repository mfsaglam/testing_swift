//
//  ShareViewController.swift
//  First
//
//  Created by Fatih Sağlam on 19.11.2022.
//

import UIKit

class ShareViewController: UIViewController {
    
    override func loadView() {
        view = ShareView { [weak self] in
            self?.shareContent(text: $0)
        }
    }

    
    func shareContent(text: String) {
        print("sharing \(text)...")
    }
    
}
