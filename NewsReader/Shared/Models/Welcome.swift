//
//  Welcome.swift
//  NewsReader
//
//  Created by Domagoj Bunoza on 25.08.2021..
//

import Foundation

struct Welcome: Codable {
    let status, source, sortBy: String
    let articles: [Article]
}
