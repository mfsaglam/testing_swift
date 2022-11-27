//
//  News.swift
//  First
//
//  Created by Fatih Sağlam on 25.11.2022.
//

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
    func dataTask(with url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

class DataTaskMock: URLSessionDataTask {
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var resumeWasCalled = false
    
    // stash away the completion handler so we can call it later
    init(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        resumeWasCalled = true
        completionHandler(nil, nil, nil)
    }
}

class URLSessionMock: URLSessionProtocol {
    var dataTask: DataTaskMock?
    var lastURL: URL?
    var testData: Data?
    var testingResume: Bool
    
    init(testingResume: Bool = false) {
        self.testingResume = testingResume
    }
    
    func dataTask(with url: URL, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer {
            if !testingResume {
                completionHandler(testData, nil, nil)
            }
        }
        let newDataTask = DataTaskMock(completionHandler: completionHandler)
        dataTask = newDataTask
        lastURL = url
        return newDataTask
    }
}
