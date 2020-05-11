//
//  RSSFeedsAlbumsTableviewCellTests.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import XCTest
@testable import RSSFeedGenerator

class RSSFeedsAlbumsTableviewCellTests: XCTestCase {
    let cell = RSSFeedsAlbumsTableviewCell(style: .default, reuseIdentifier: RSSFeedsAlbumsTableviewCell.Identifier)

    func testLoadingCell() {
        XCTAssertNotNil(cell, "Cell should not be nil")
        XCTAssertNotNil(cell.nameOfAlbum, "nameOfAlbum should not be nil")
        XCTAssertNotNil(cell.nameOfArtist, "nameOfArtist should not be nil")
        XCTAssertNotNil(cell.albumImage, "albumImage should not be nil")
    }
    func testConfigureCell() {
        if let mockData = Feeds.getMockFeeds(for: FeedsMock()).feed.results.first {
            cell.layoutSubviews()
            cell.configure(with: mockData)
            XCTAssertEqual(cell.nameOfAlbum.text, mockData.name)
            XCTAssertEqual(cell.nameOfArtist.text, mockData.artistName)
        }
    }
}
