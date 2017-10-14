//
//  AuthService.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Async

class AuthService: NSObject {
    
    static let shared = AuthService()
    let sessionManager = NetworkManager.shared.sessionManager
    
    enum AuthResult {
        case Success()
        case OfflineError
        case UnexpectedError(error: Error?)
        case InvalidCredentials
    }
    
    func getToken(login: String, password: String, callback:((_ result: AuthResult) -> ())? = nil) {
        let url = ApiEndpoint.auth.url()
        
        let params: [String: String] = [
            NetworkConstant.grantType: NetworkConstant.password,
            NetworkConstant.clientId: NetworkConstant.clientIdValue,
            "username": login,
            "password": password
        ]
        
        sessionManager.request(url, method: .post, parameters: params)
            .responseJSON {(response) in
                if let result = response.result.value as? [String: Any] {
                    if let accessToken = result["access_token"] as? String, let refreshToken = result["refresh_token"] as? String {
                        PreferenceManager.shared.token = accessToken
                        PreferenceManager.shared.refreshToken = refreshToken
                        callback?(AuthResult.Success())
                    } else {
                        callback?(AuthResult.UnexpectedError(error: nil))
                    }
                } else {
                    callback?(AuthResult.UnexpectedError(error: response.result.error))
                }
        }
    }
    
}
