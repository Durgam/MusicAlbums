//
//  RSSFeedAlbumsViewControllerTests.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import XCTest
@testable import RSSFeedGenerator

class RSSFeedAlbumsViewControllerTests: XCTestCase {
    
    var viewController: RSSFeedsAlbumsViewController?
    let presenter = RSSFeedsAlbumsPresenterMock()

    override func setUp() {
        viewController = RSSFeedsAlbumsViewController()
        viewController?.presenter = presenter
        _ = NavigationControllerMock(rootViewController: viewController ?? UIViewController())
        let mockData = Feeds.getMockFeeds(for: FeedsMock()).feed
        viewController?.feeds = mockData
    }

    override func tearDown() {
        viewController = nil
    }
    func testLoadingView() {
        viewController?.viewDidLoad()
        XCTAssertNotNil(viewController?.view, "RSSFeedsAlbumsViewController should not be nil")
        XCTAssertNotNil(viewController?.tableView, "tableview should not be nil")
        XCTAssertNotNil(viewController?.activityIndicator, "activityIndicator should not be nil")
        XCTAssertNotNil(viewController?.title, "Top RSS Feeds")

    }

    func testRemoveActivityIndicator() {
        viewController?.stopActivityIndicator()
        XCTAssertFalse(viewController?.activityIndicator.isAnimating ?? true)
        XCTAssertTrue(viewController?.activityIndicator.isHidden ?? false)
    }
    
    func testSetupView() {
        let mockData = Feeds.getMockFeeds(for: FeedsMock()).feed
        viewController?.loadView(feeds: mockData)
        XCTAssertEqual(self.viewController?.feeds?.results.count, mockData.results.count)
        
    }
}
