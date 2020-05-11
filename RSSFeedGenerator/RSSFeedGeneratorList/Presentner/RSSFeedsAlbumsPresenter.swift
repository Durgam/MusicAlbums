//
//  RSSFeedsAlbumsPresenter.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/7/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
import UIKit

protocol RSSFeedsAlbumsPresenting {
    func onViewWillAppear()
    func onClickRSSFeedAlbum(result: Result)
}

class RSSFeedsAlbumsPresenter {
    let view: RSSFeedsAlbumsViewing?
    let interactor: RSSFeedAlbumsInteracting
    let router: RSSFeedsAlbumsRouting
    
    init(view: RSSFeedsAlbumsViewing, interactor: RSSFeedAlbumsInteracting, router: RSSFeedsAlbumsRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension RSSFeedsAlbumsPresenter: RSSFeedsAlbumsPresenting {
    func onClickRSSFeedAlbum(result: Result) {
        router.gotoRSSFeedsAlbumDetails(result: result)
    }
    
    func onViewWillAppear() {
        interactor.fetchRSSFeeds { [weak self] (feeds, error) in
            DispatchQueue.main.async { [weak self] in
                self?.view?.stopActivityIndicator()
                if let apiError = error {
                    self?.view?.showAlert(message: apiError.errorDescription)
                }
                self?.view?.loadView(feeds: feeds)
            }
        }
    }
}



