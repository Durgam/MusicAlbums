//
//  RSSFeedsAlbumsTableviewCell.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/7/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
import UIKit


class RSSFeedsAlbumsTableviewCell: UITableViewCell {
    static var Identifier: String {
        return "RSSFeedsAlbumsTableviewCell"
    }
    let nameOfAlbum: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    let nameOfArtist: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
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
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        nameOfArtist.sizeToFit()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        nameOfAlbum.translatesAutoresizingMaskIntoConstraints = false
        nameOfArtist.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameOfAlbum)
        contentView.addSubview(nameOfArtist)
        contentView.addSubview(albumImage)

        addconstaintsToAlbumImage()
        addConstrainstsToAlbumName()
        addConstrainstsToNameOfArtist()
    }
    private func addconstaintsToAlbumImage() {
        let albumImageView = ["albumImage": albumImage]
        let widthConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[albumImage(50)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: albumImageView)
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[albumImage(50)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: albumImageView)
        let horizontalConstraint = NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10)
        let leadingConstraint = NSLayoutConstraint(item: albumImage, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 10)
        NSLayoutConstraint.activate(widthConstraints)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint])
    }
    private func addConstrainstsToAlbumName() {
        let views = ["nameOfAlbum": nameOfAlbum]
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[nameOfAlbum(20)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)
        let horizontalConstraint = NSLayoutConstraint(item: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10)
        let leadingConstraint = NSLayoutConstraint(item: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: albumImage, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 5)
        let trailingConstraint = NSLayoutConstraint(item: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -5)
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint,trailingConstraint])
    }
    private func addConstrainstsToNameOfArtist() {
        let views = ["nameOfArtist": nameOfArtist]
        
        let heightConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[nameOfArtist(20)]", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views)

        let horizontalConstraint = NSLayoutConstraint(item: nameOfArtist, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nameOfAlbum, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: nameOfArtist, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: albumImage, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 5)
        
        NSLayoutConstraint.activate(heightConstraints)
        NSLayoutConstraint.activate([leadingConstraint,horizontalConstraint])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(with result: Result) {
        self.nameOfAlbum.text = result.name
        self.nameOfArtist.text = result.artistName
        self.nameOfArtist.sizeToFit()

        self.albumImage.downloaded(from:result.artworkUrl100, contentMode: .scaleAspectFill)
    }
}

