//
//  RSSFeedAlbumsIPresenterTests.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import XCTest
@testable import RSSFeedGenerator

class RSSFeedAlbumsListPresenterTests: XCTestCase {
    var rssFeedAlbumsListPresenter: RSSFeedsAlbumsPresenter?
    let viewMock = RSSFeedsAlbumsViewMock()
    let interactorMock = RSSFeedsAlbumsInteractorMock()
    let routerMock = RSSFeedsAlbumsRouterMock()
    
    override func setUp() {
        rssFeedAlbumsListPresenter = RSSFeedsAlbumsPresenter(view: viewMock, interactor: interactorMock, router: routerMock)
    }

    override func tearDown() {
        rssFeedAlbumsListPresenter = nil
    }

    func testOnViewWillAppear() {
        rssFeedAlbumsListPresenter?.onViewWillAppear()
        XCTAssertEqual(interactorMock.noOfTimesFetchRSSFeedsCalled, 1)
    }
    func testonClickRSSFeedAlbum() {
        let mockFeeds = Feeds.getMockFeeds(for: FeedsMock())
        if let mockData = mockFeeds.feed.results.first {
            rssFeedAlbumsListPresenter?.onClickRSSFeedAlbum(result: mockData)
        }
    }
}
