//
//  BaseEndpoint.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/29/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Alamofire

/// Types that conform to this model an API endpoint
protocol BaseEndPoint {
    
    /// Provides all the information required to make the API call
    func provideCallDetails() -> (url: String, method: HTTPMethod, parameters: [String: Any]?)
    
    var url: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    
}

extension BaseEndPoint {
    
    var url: String { return provideCallDetails().url }
    var method: HTTPMethod { return provideCallDetails().method }
    var parameters: [String: Any]? { return provideCallDetails().parameters }
    
}
