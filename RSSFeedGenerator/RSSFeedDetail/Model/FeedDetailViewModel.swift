//
//  FeedDetailViewModel.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
import UIKit

protocol FeedDetailViewState {
    var nameOfAlbumAttributedString:NSAttributedString { get }
    var nameOfArtistAttributedString:NSAttributedString { get }
    var genresAttributedString: NSAttributedString { get }
    var releaseDateAttributedString: NSAttributedString { get }
    var copyrightsText: String { get }
    var imageURL: String { get }
    var albumURL: String { get }
}

struct FeedDetailViewModel {
    enum Constants {
        static let systemFont = UIFont.systemFont(ofSize: 16)
        static let boldSystemfont = UIFont.boldSystemFont(ofSize: 15)
    }
    let URL: String
    let name: String
    let artist: String
    let genres: [Genres]
    let releaseDate: String
    let copyright: String
    let artworkUrl100: String
    
    func attributedText(fullString: String, boldPartOfString: String, baseFont: UIFont = Constants.systemFont , boldFont: UIFont = Constants.boldSystemfont) -> NSAttributedString {

        let baseFontAttribute = [NSAttributedString.Key.font : baseFont]
        let boldFontAttribute = [NSAttributedString.Key.font : boldFont]

        let attributedString = NSMutableAttributedString(string: fullString, attributes: baseFontAttribute)

        attributedString.addAttributes(boldFontAttribute, range: NSRange(fullString.range(of: boldPartOfString) ?? fullString.startIndex..<fullString.endIndex, in: fullString))

        return attributedString
    }
}

extension FeedDetailViewModel: FeedDetailViewState {
    
    var nameOfAlbumAttributedString: NSAttributedString {
        return attributedText(fullString: "Name\n"+self.name, boldPartOfString: "Name")
    }
    
    var nameOfArtistAttributedString: NSAttributedString {
        return attributedText(fullString: "Artist\n"+self.artist, boldPartOfString: "Artist")
    }
    
    var genresAttributedString: NSAttributedString {
        var allGenre = ""

        genres.forEach { genre in
            if allGenre.isEmpty {
                allGenre.append("/")
            }
            allGenre.append(genre.name)
        }
        return attributedText(fullString: "Gener\n"+allGenre, boldPartOfString: "Gener")
    }
    
    var releaseDateAttributedString: NSAttributedString {
        return attributedText(fullString: "Release Date\n"+self.releaseDate, boldPartOfString: "Release Date")
    }
    var copyrightsText: String {
        return self.copyright
    }
    var imageURL: String {
        return self.artworkUrl100
    }
    var albumURL: String {
        return self.URL
    }
}
