//
//  News.swift
//  First
//
//  Created by Fatih Sağlam on 23.11.2022.
//

///1- What was the URL that was requested?
///2- Was a network request actually started?
///3- Did the request come back with certain data?
///4- Did the request come back with a specific error?

import Foundation

class News {
    var url: URL
    var stories = ""

    init(url: URL) {
        self.url = url
    }

    func fetch(using session: URLSessionProtocol = URLSession.shared, completionHandler: @escaping () -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            }

            completionHandler()
        }

        task.resume()
    }
}

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
