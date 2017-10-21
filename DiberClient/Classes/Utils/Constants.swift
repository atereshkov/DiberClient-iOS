//
//  Constants.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import UIKit

enum Segues: String {
    case mainScreen = "MainScreen"
    case ordersTable = "OrdersTableVC"
    case loginFromMain = "LoginFromMain"
}

enum Cells: String {
    case orders = "OrderCell"
}

class NetworkConstant {
    static let grantType = "grant_type"
    static let clientId = "client_id"
    static let clientIdValue = "clientapp"
    static let refreshToken = "refresh_token"
    static let username = "username"
    static let password = "password"
    
    static let headerAuthorization = "Authorization";
    static let authorizationValue = "Basic Y2xpZW50YXBwOjEyMzQ1Ng==";
}
