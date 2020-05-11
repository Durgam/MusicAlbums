//
//  RSSFeedsAlbumsViewControllerMock.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
@testable import RSSFeedGenerator

class RSSFeedsAlbumsViewMock: RSSFeedsAlbumsViewing {
    var noOfTimesLoadViewCalled = 0
    var noOfTimesShowAlertCalled = 0
    var noOfTimesStopActivityIndicatorCalled = 0
    
    func loadView(feeds: Feed?) {
        noOfTimesLoadViewCalled += 1
    }
    
    func showAlert(message: String) {
        noOfTimesShowAlertCalled += 1
    }
    
    func stopActivityIndicator() {
        noOfTimesStopActivityIndicatorCalled += 1
    }
}
