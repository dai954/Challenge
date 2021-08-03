//
//  SearchResult.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/24.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [App]
}

struct App: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    var screenshotUrls: [String]?
    let artworkUrl100: String // app icon
    var formattedPrice: String?
    var description: String?
    var releaseNotes: String?
    var artistName: String?
    var collectionName: String?
}
