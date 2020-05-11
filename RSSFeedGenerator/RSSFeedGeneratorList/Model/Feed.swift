//
//  Feed.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/7/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation

struct Feeds: Codable {
    let feed: Feed
}
struct Feed: Codable {
    let title: String
    let results: [Result]
}
struct Result: Codable {
    let artistName: String
    let id: String
    let releaseDate: String
    let artworkUrl100: String
    let name: String
    let genres: [Genres]
    let copyright: String
    let url: String
}

struct Genres: Codable {
    let genreId: String
    let name: String
    let url: String
}


