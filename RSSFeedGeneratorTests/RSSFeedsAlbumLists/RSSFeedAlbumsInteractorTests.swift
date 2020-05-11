//
//  RSSFeedAlbumsInteractorTests.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//
import XCTest
@testable import RSSFeedGenerator

class RSSFeedAlbumsInteractorTests: XCTestCase {
    func testFetchingFeedsURLHostAndPath() {
        // When
        let mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        let interactor = RSSFeedAlbumsInteractor(session: mockURLSession)

        interactor.fetchRSSFeeds(completion: { (feed, error) in
        })
        XCTAssertEqual(mockURLSession.cachedUrl?.host, "rss.itunes.apple.com")
        XCTAssertEqual(mockURLSession.cachedUrl?.path,
                       "/api/v1/us/apple-music/top-albums/all/100/explicit.json")
    }
    func testFetchingFeeds_Success() {
        let mockFeeds = Feeds.getMockFeeds(for: FeedsMock())
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(mockFeeds) {
            let mockURLSession  = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
            let fetchFeedsExpectation = self.expectation(description: "FetchFeeds")
            var response: Feed?
            let interactor = RSSFeedAlbumsInteractor(session: mockURLSession)

            interactor.fetchRSSFeeds(completion: { (feed, error) in
                response = feed
                fetchFeedsExpectation.fulfill()
            })
            waitForExpectations(timeout: 1) { (error) in
                XCTAssertNotNil(response)
            }
        }
    }
}
