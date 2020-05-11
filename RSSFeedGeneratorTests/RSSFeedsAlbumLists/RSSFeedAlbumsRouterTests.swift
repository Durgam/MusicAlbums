//
//  RSSFeedAlbumsRouterTests.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import XCTest
@testable import RSSFeedGenerator

class RSSFeedAlbumsRouterTests: XCTestCase {
    
    var router: RSSFeedsAlbumsRouter?
    var navigationControllerMock = NavigationControllerMock(rootViewController: UIViewController())

    override func setUp() {
        router = RSSFeedsAlbumsRouter(navigation: navigationControllerMock)
    }

    override func tearDown() {
        router = nil
    }
    
    func testNavigateToDetailsScreen() {
        if let mockData = Feeds.getMockFeeds(for: FeedsMock()).feed.results.first {
            router?.gotoRSSFeedsAlbumDetails(result: mockData)
            XCTAssertTrue(navigationControllerMock.topViewController is RSSFeedAlbumDetailViewController)
        }
    }
}
