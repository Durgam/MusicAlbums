//
//  RSSFeedAlbumDetailViewControllerTests.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import XCTest
@testable import RSSFeedGenerator


class RSSFeedAlbumDetailViewControllerTests: XCTestCase {
    var viewController: RSSFeedAlbumDetailViewController?
    var viewModel:FeedDetailViewModel?
    override func setUp() {
        viewController = RSSFeedAlbumDetailViewController()
        if let mockData = Feeds.getMockFeeds(for: FeedsMock()).feed.results.first {
            viewModel = FeedDetailViewModel(name: mockData.name, artist: mockData.artistName, genres: mockData.genres, releaseDate: mockData.releaseDate, copyright: mockData.copyright, artworkUrl100: mockData.artworkUrl100)
            viewController?.feedDetailViewModel = viewModel
        }
    }

    override func tearDown() {
        viewController = nil
    }

    func testLoadingView() {
        viewController?.viewDidLoad()
        XCTAssertNotNil(viewController, "RSSFeedAlbumDetailViewController should not be nil")
        XCTAssertNotNil(viewController?.nameOfAlbum, "nameOfAlbum should not be nil")
        XCTAssertNotNil(viewController?.nameOfArtist, "nameOfArtist should not be nil")
        XCTAssertNotNil(viewController?.genre, "genre should not be nil")
        XCTAssertNotNil(viewController?.albumImage, "albumImage should not be nil")
        XCTAssertNotNil(viewController?.releaseDate, "releaseDate should not be nil")
        XCTAssertNotNil(viewController?.copyrights, "copyrights should not be nil")
        XCTAssertEqual(viewController?.nameOfArtist.attributedText, viewModel?.nameOfArtistAttributedString)
        XCTAssertEqual(viewController?.nameOfAlbum.attributedText, viewModel?.nameOfAlbumAttributedString)
        XCTAssertEqual(viewController?.genre.attributedText, viewModel?.genresAttributedString)
        XCTAssertEqual(viewController?.releaseDate.attributedText, viewModel?.releaseDateAttributedString)
        XCTAssertEqual(viewController?.copyrights.text, viewModel?.copyrightsText)
    }
}
