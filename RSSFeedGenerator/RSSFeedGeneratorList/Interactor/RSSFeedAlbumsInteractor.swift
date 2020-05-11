//
//  RSSFeedAlbumsInteractor.swift
//  RSSFeedGenerator
//
//  Created by Durga Madamanchi on 5/7/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation

public enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}
extension APIServiceError {
    public var errorDescription: String {
        switch self {
        case .apiError,.invalidEndpoint,.invalidResponse:
            return "Encountered a problem while fetching Feeds details. Please try once again."
        case .noData:
            return "There are no Feeds available. Please try once again"
            
        case .decodeError:
            return "Encountered a problem while fetching Feed details. Please try once again"
        }
    }
}
enum Constants {
    static let RSSFeedURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
}

protocol RSSFeedAlbumsInteracting {
    func fetchRSSFeeds(completion: @escaping (Feed?,APIServiceError?) -> Void)
}
class RSSFeedAlbumsInteractor {
    private let session: URLSession
    init(session: URLSession) {
        self.session = session
    }
}
extension RSSFeedAlbumsInteractor: RSSFeedAlbumsInteracting {
    func fetchRSSFeeds(completion: @escaping (Feed?,APIServiceError?) -> Void) {
        guard let urlComponents = URLComponents(string: Constants.RSSFeedURL) else {
            completion(nil,.invalidEndpoint)
            return
        }
        
        // URL should not be nil to proceed furthur
        guard let url = urlComponents.url  else {
            completion(nil,.invalidEndpoint)
            return
        }
      
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            // Parse the data in the response and use it
            guard error == nil else {
                completion(nil, .noData)
              return
            }
            guard let data = data else {
                completion(nil,.noData)
                return
            }
            do {
                let feeds = try JSONDecoder().decode(Feeds.self, from: data)
                completion(feeds.feed,nil)
            } catch let error {
                if let decodeError = error as? DecodingError {
                    print("decodeError",decodeError)
                }
                completion(nil,.decodeError)
            }
        })
        task.resume()
    }
}
