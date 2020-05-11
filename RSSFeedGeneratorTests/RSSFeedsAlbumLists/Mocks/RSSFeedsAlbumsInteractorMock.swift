//
//  RSSFeedsAlbumsInteractorMock.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
@testable import RSSFeedGenerator

class RSSFeedsAlbumsInteractorMock: RSSFeedAlbumsInteracting {
    var noOfTimesFetchRSSFeedsCalled = 0
    func fetchRSSFeeds(completion: @escaping (Feed?, APIServiceError?) -> Void) {
        noOfTimesFetchRSSFeedsCalled += 1
    }
}
