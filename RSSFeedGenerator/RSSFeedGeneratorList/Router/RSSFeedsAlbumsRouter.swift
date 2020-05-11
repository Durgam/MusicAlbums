//
//  RSSFeedsAlbumsRouter.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
import UIKit

protocol RSSFeedsAlbumsRouting: AnyObject {
    func gotoRSSFeedsAlbumDetails(result: Result)
}

final class RSSFeedsAlbumsRouter {
    
    let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
}

extension RSSFeedsAlbumsRouter: RSSFeedsAlbumsRouting {
    func gotoRSSFeedsAlbumDetails(result: Result) {
        let detailViewController = RSSFeedAlbumDetailViewController()
        let feedDetailViewModel = FeedDetailViewModel(URL: result.url, name: result.name, artist: result.artistName, genres: result.genres, releaseDate: result.releaseDate, copyright: result.copyright,artworkUrl100: result.artworkUrl100)
        detailViewController.feedDetailViewModel = feedDetailViewModel
        navigation.pushViewController(detailViewController, animated: true)
    }
}
