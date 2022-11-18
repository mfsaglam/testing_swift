//
//  Tweet.swift
//  First
//
//  Created by Fatih Sağlam on 18.11.2022.
//

import Foundation

struct Tweet {
    var text: String
    var author: String
    var date: Date

    init(text: String, author: String, date: Date = Date()) {
        self.text = text
        self.author = author
        self.date = Date()
    }
}
