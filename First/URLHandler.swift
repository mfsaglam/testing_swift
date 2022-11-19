//
//  UrlHandler.swift
//  First
//
//  Created by Fatih Sağlam on 19.11.2022.
//

import UIKit

struct URLHandler {
    func open(url: URL) {
        if url.absoluteString.hasPrefix("internal://") {
            // run some app-specific code
        } else {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
