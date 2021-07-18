//
//  AppResult.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/15.
//

import Foundation

struct AppResult: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let name: String
    let artworkUrl100: String
}
