//
//  RSSFeedsAlbumsPresenterMock.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
@testable import RSSFeedGenerator

class RSSFeedsAlbumsPresenterMock: RSSFeedsAlbumsPresenting {
    var noOfTimesOnViewWillAppearCalled = 0
    var noOfTimesOnClickRSSFeedAlbumCalled = 0
    func onViewWillAppear() {
        noOfTimesOnViewWillAppearCalled += 1
    }
    
    func onClickRSSFeedAlbum(result: Result) {
        noOfTimesOnClickRSSFeedAlbumCalled += 1
    }
}
