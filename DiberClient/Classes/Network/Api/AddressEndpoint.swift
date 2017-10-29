//
//  AddressEndpoint.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/29/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Alamofire

enum AddressEndpoint: BaseEndPoint {
    
    case addresses(userId: Int)
    
    func provideCallDetails() -> (url: String, method: HTTPMethod, parameters: [String : Any]?) {
        switch self {
        case .addresses(let userId):
            var url = "\(Endpoint.base.rawValue)\(Endpoint.apiVersion.rawValue)"
            url.append("/users/")
            url.append(String(userId))
            url.append("/addresses")
            return (url: url, method: .get, parameters: nil)
        }
    }
    
}
