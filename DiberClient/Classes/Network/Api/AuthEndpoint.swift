//
//  AuthEndpoint.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/29/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Alamofire

enum AuthEndpoint: BaseEndPoint {
    
    case userInfo
    case auth(login: String, password: String)
    
    func provideCallDetails() -> (url: String, method: HTTPMethod, parameters: [String : Any]?) {
        switch self {
        case .auth(let login, let password):
            let params: [String: String] = [
                NetworkConstant.grantType: NetworkConstant.password,
                NetworkConstant.clientId: NetworkConstant.clientIdValue,
                "username": login,
                "password": password
            ]
            return (url: Endpoint.auth.url(), method: .post, parameters: params)
        case .userInfo:
            return (url: Endpoint.userInfo.url(), method: .get, parameters: nil)
        }
    }
    
    /*
    private func parameters(for page: Int, searchTerm: String) -> [String : String] {
        return [
            "search" : searchTerm,
            "page"   : String(page)
        ]
    }
    */
    
}
