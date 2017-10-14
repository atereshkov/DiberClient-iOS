//
//  ApiEndpoint.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/8/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation

enum ApiEndpoint: String {
    
    case base = "https://pacific-forest-76418.herokuapp.com/"
    case apiVersion = "api/v1/"
    
    case auth = "oauth/token"
    case userOrders = "users/2/orders"
    
    func url(queryParams: [String: String]? = nil) -> String {
        let authUrl = "\(ApiEndpoint.base.rawValue)\(self.rawValue)"
        let commonUrl = "\(ApiEndpoint.base.rawValue)\(ApiEndpoint.apiVersion)\(self.rawValue)"
        var url = self == .auth ? authUrl : commonUrl
        
        if let queryParams = queryParams {
            url += "?"
            var index = 0
            for (key, value) in queryParams {
                if index > 0 {
                    url += "&"
                }
                url += "\(key)=\(value)"
                index += 1
            }
        }
        return url
    }
}
