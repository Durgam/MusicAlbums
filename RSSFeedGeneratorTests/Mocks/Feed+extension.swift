//
//  Feed+extension.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
@testable import RSSFeedGenerator

extension Feeds {
    static func getMockFeeds(for mockInfo: FeedsMock) -> Feeds {
        let geners = Genres(genreId: mockInfo.genreId, name: mockInfo.genreName, url: mockInfo.generUrl)
        let results = Result(artistName: mockInfo.artistName, id: mockInfo.id, releaseDate: mockInfo.releaseDate, artworkUrl100: mockInfo.artworkUrl100, name: mockInfo.name, genres: [geners], copyright: mockInfo.copyright, url: mockInfo.url)
        let feed = Feed(title: mockInfo.title, results: [results])
        let feeds = Feeds(feed:feed)
        return feeds
    }
}
