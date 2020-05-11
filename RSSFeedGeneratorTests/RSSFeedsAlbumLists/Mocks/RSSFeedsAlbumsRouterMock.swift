//
//  RSSFeedsAlbumsRouterMock.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
@testable import RSSFeedGenerator

class RSSFeedsAlbumsRouterMock: RSSFeedsAlbumsRouting {
    var noOfTimesAlbumDetailsCalled = 0
    func gotoRSSFeedsAlbumDetails(result: Result) {
        noOfTimesAlbumDetailsCalled += 1
    }
}
