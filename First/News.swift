//
//  News.swift
//  First
//
//  Created by Fatih Sağlam on 23.11.2022.
//

import Foundation

class News {
    var url: URL
    var stories = ""

    init(url: URL) {
        self.url = url
    }

    func fetch(completionHandler: @escaping () -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            }

            completionHandler()
        }

        task.resume()
    }
}
