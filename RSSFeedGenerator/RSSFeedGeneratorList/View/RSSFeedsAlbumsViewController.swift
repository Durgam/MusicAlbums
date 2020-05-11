//
//  RSSFeedsAlbumsViewController.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/7/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
import UIKit

protocol RSSFeedsAlbumsViewing {
    func loadView(feeds: Feed?)
    func showAlert(message: String)
    func stopActivityIndicator()
}

class RSSFeedsAlbumsViewController: UIViewController {
    var presenter: RSSFeedsAlbumsPresenting?
    let tableView = UITableView(frame: .zero)
    let activityIndicator: UIActivityIndicatorView = {
        var activityIN : UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
        return activityIN
    }()

    var feeds: Feed?

    override func loadView() {
        super.loadView()
        title = "Top RSS Feeds"
        self.view.backgroundColor = .white
        setupTableView()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)

        view.bringSubviewToFront(self.activityIndicator)

        activityIndicator.startAnimating()
        self.presenter?.onViewWillAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupTableView() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(RSSFeedsAlbumsTableviewCell.self, forCellReuseIdentifier: RSSFeedsAlbumsTableviewCell.Identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RSSFeedsAlbumsViewController: RSSFeedsAlbumsViewing {
    func loadView(feeds: Feed?) {
        self.feeds = feeds
        tableView.reloadData()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
}

extension RSSFeedsAlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.feeds?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RSSFeedsAlbumsTableviewCell.Identifier, for: indexPath) as! RSSFeedsAlbumsTableviewCell
        if let result = self.feeds?.results[indexPath.row] {
            cell.configure(with: result)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
extension RSSFeedsAlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let result = self.feeds?.results[indexPath.row] {
            self.presenter?.onClickRSSFeedAlbum(result: result)
        }
    }
}
