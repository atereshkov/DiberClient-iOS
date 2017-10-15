//
//  UserService.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Async

class UserService: NSObject {
    
    static let shared = UserService()
    let sessionManager = NetworkManager.shared.sessionManager
    
    enum UserInfoResult {
        case Success(user: User)
        case OfflineError
        case UnexpectedError(error: Error?)
    }
    
    func getUserInfo(callback:((_ result: UserInfoResult) -> ())? = nil) {
        let url = ApiEndpoint.userInfo.url()
        
        sessionManager.request(url)
            .validate()
            .responseJSON {(response) in
                if let result = response.result.value as? [String: Any] {
                    if let user = User.with(data: result) {
                        callback?(UserInfoResult.Success(user: user))
                    } else {
                        callback?(UserInfoResult.UnexpectedError(error: nil))
                    }
                } else {
                    callback?(UserInfoResult.UnexpectedError(error: response.result.error))
                }
        }
    }
    
}
