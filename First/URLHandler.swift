//
//  UrlHandler.swift
//  First
//
//  Created by Fatih Sağlam on 19.11.2022.
//

import UIKit

//protocol ApplicationProtocol {
//    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any], completionHandler completion: ((Bool) -> Void)?)
//}
//
//extension UIApplication: ApplicationProtocol { }
//
//struct URLHandler {
//
//    let application: ApplicationProtocol
//
//    func open(url: URL) {
//        if url.absoluteString.hasPrefix("internal://") {
//            // run some app-specific code
//        } else {
//            ///hidden dependency, behaviour  we can not control
//            application.open(url, options: [:], completionHandler: nil)
//        }
//    }
//}

struct URLHandler {
    
    typealias URLOpening = (URL, [UIApplication.OpenExternalURLOptionsKey: Any], ((Bool) -> Void)?) -> Void
    
    let urlOpener: URLOpening = UIApplication.shared.open

    func open(url: URL) {
        if url.absoluteString.hasPrefix("internal://") {
            // run some app-specific code
        } else {
            urlOpener(url, [:], nil)
        }
    }
}
