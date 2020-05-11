//
//  RSSFeedAlbumDetailViewController.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/10/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
import UIKit

protocol RSSFeedAlbumDetailViewing {
    func update(result: Result)
}

class RSSFeedAlbumDetailViewController: UIViewController {
    private enum Constants {
        static let Horizontalspacing:CGFloat = 30.0
    }
    var feedDetailViewModel: FeedDetailViewModel?
    let nameOfAlbum: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let nameOfArtist: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let genre: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let releaseDate: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let albumImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.backgroundColor = .brown
        imgView.clipsToBounds = true
        return imgView
    }()
    let copyrights: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .black
        return label
    }()
    let goToiTunes: UIButton = {
        let button = UIButton()
        button.setTitle("Open in itunes", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(onClickOpenIniTunes), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        navigationController?.navigationBar.backgroundColor = .white
        
        title = "Album Details"
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        nameOfAlbum.translatesAutoresizingMaskIntoConstraints = false
        nameOfArtist.translatesAutoresizingMaskIntoConstraints = false
        genre.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        copyrights.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(nameOfAlbum)
        self.view.addSubview(nameOfArtist)
        self.view.addSubview(albumImage)
        self.view.addSubview(genre)
        self.view.addSubview(releaseDate)
        self.view.addSubview(copyrights)
        self.view.addSubview(goToiTunes)
        
        addconstaintsToAlbumImage()
        addConstrainstsToAlbumName()
        addConstrainstsToNameOfArtist()
        addConstrainstsToGenre()
        addConstrainstsToReleaseDate()
        addConstrainstsToCopyRights()
        addConstrainstsToOpenInitunes()
        
        if let viewModel = feedDetailViewModel {
            update(feedDetailViewModel: viewModel)
        }
    }
    private func addconstaintsToAlbumImage() {
        let albumImageView = ["albumImage": albumImage]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[albumImage(200)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: albumImageView)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[albumImage(200)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: albumImageView)
        let verticalConstraint = NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0)

        let centerXConstraint = NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.centerXWithinMargins, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerXWithinMargins, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([centerXConstraint,verticalConstraint])
    }
    private func addConstrainstsToAlbumName() {
        let views = ["nameOfAlbum": nameOfAlbum]
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[nameOfAlbum(40)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let horizontalConstraint = NSLayoutConstraint(item: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: albumImage, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: Constants.Horizontalspacing)
        let leadingConstraint = NSLayoutConstraint(item: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 5)
        let trailingConstraint = NSLayoutConstraint(item: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1, constant: -5)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint,trailingConstraint])
    }
    private func addConstrainstsToNameOfArtist() {
        let views = ["nameOfArtist": nameOfArtist]

        let horizontalConstraint = NSLayoutConstraint(item: nameOfArtist, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: Constants.Horizontalspacing)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[nameOfArtist(40)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)

        let leadingConstraint = NSLayoutConstraint(item: nameOfArtist, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 5)
        let trailingConstraint = NSLayoutConstraint(item: nameOfArtist, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1, constant: -5)

        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint, trailingConstraint])
    }
    private func addConstrainstsToGenre() {
        let views = ["genre": genre]

        let horizontalConstraint = NSLayoutConstraint(item: genre, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nameOfArtist, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: Constants.Horizontalspacing)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[genre(40)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)

        let leadingConstraint = NSLayoutConstraint(item: genre, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 5)
        let trailingConstraint = NSLayoutConstraint(item: genre, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1, constant: -5)

        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint, trailingConstraint])
    }
    private func addConstrainstsToReleaseDate() {
        let views = ["releaseDate": releaseDate]

        let horizontalConstraint = NSLayoutConstraint(item: releaseDate, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: genre, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: Constants.Horizontalspacing)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[releaseDate(40)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)

        let leadingConstraint = NSLayoutConstraint(item: releaseDate, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 5)
        let trailingConstraint = NSLayoutConstraint(item: releaseDate, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1, constant: -5)

        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint, trailingConstraint])
    }
    private func addConstrainstsToCopyRights() {
        let views = ["copyrights": copyrights]

        let horizontalConstraint = NSLayoutConstraint(item: copyrights, attribute: NSLayoutConstraint.Attribute.topMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: releaseDate, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: Constants.Horizontalspacing)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[copyrights(40)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)

        let leadingConstraint = NSLayoutConstraint(item: copyrights, attribute: NSLayoutConstraint.Attribute.leadingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 5)
        let trailingConstraint = NSLayoutConstraint(item: copyrights, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailingMargin, multiplier: 1, constant: -5)

        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint, trailingConstraint])
    }
    private func addConstrainstsToOpenInitunes() {
        let views = ["goToiTunes": goToiTunes]

        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[goToiTunes(40)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let verticalConstraint = NSLayoutConstraint(item: goToiTunes, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -20)
        let leadingConstraint = NSLayoutConstraint(item: goToiTunes, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 20)
        let trailingConstraint = NSLayoutConstraint(item: goToiTunes, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)

        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,trailingConstraint,verticalConstraint])
    }
    private func update(feedDetailViewModel: FeedDetailViewModel) {
        self.nameOfAlbum.attributedText = feedDetailViewModel.nameOfAlbumAttributedString
            
        self.nameOfArtist.attributedText = feedDetailViewModel.nameOfArtistAttributedString
        
        
        self.genre.attributedText = feedDetailViewModel.genresAttributedString
        self.releaseDate.attributedText = feedDetailViewModel.releaseDateAttributedString
        self.copyrights.text = feedDetailViewModel.copyrightsText
        self.albumImage.downloaded(from:feedDetailViewModel.imageURL, contentMode: .scaleAspectFill)
    }
    func addBoldText(fullString: String, boldPartOfString: String, baseFont: UIFont, boldFont: UIFont) -> NSAttributedString {

        let baseFontAttribute = [NSAttributedString.Key.font : baseFont]
        let boldFontAttribute = [NSAttributedString.Key.font : boldFont]

        let attributedString = NSMutableAttributedString(string: fullString, attributes: baseFontAttribute)

        attributedString.addAttributes(boldFontAttribute, range: NSRange(fullString.range(of: boldPartOfString) ?? fullString.startIndex..<fullString.endIndex, in: fullString))

        return attributedString
    }
    @objc private func onClickOpenIniTunes(sender: UIButton) {
        guard let feedDetailViewModel = feedDetailViewModel else {
            return
        }
        if let url = URL(string: feedDetailViewModel.albumURL) {
            let application = UIApplication.shared
            application.open(url, options: [:]) { (succes) in
            }
        }
    }
}
