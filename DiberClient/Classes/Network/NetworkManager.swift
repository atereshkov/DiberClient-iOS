//
//  NetworkManager.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/8/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Alamofire

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    public var sessionManager: SessionManager
    
    private override init() {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 15
        sessionManager = SessionManager(configuration: configuration)
        let handler = OAuth2Handler(sessionManager)
        sessionManager.adapter = handler
        sessionManager.retrier = handler
    }

}
