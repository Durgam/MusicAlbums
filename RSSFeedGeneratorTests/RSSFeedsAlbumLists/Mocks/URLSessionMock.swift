//
//  URLSessionMock.swift
//  RSSFeedGeneratorTests
//
//  Created by Durga Madamanchi on 5/11/20.
//  Copyright © 2020 Nike Test. All rights reserved.
//

import Foundation
class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    internal let error1: Error?
    
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.error1 = error
        
    }
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler!(self.data, self.urlResponse, self.error1)
        }
    }
}
class MockURLSession: URLSession {
    var cachedUrl: URL?
    let mockTask: MockTask
    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        mockTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }
    override func dataTask(with url: URL, completionHandler:      @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.cachedUrl = url
        mockTask.completionHandler = completionHandler
        return mockTask
    }
}
