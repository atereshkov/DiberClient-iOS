//
//  OrderService.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Async

class OrderService: NSObject {
    
    static let shared = AuthService()
    let sessionManager = NetworkManager.shared.sessionManager
    
    enum UserOrdersResult {
        case Success(orders: [Order])
        case OfflineError
        case UnexpectedError(error: Error?)
    }
    
    func getToken(login: String, password: String, callback:((_ result: UserOrdersResult) -> ())? = nil) {
        let url = ApiEndpoint.userOrders.url()
        
        sessionManager.request(url)
            .validate()
            .responseJSON { response in
                var orders = [Order]()
                if response.result.error == nil, let data = response.result.value as? [String: Any] {
                    if let ordersData = data["content"] as? [[String: Any]] {
                        for orderData in ordersData {
                            if let order = Order.with(data: orderData) {
                                orders.append(order)
                            }
                        }
                    }
                    callback?(UserOrdersResult.Success(orders: orders))
                } else {
                    callback?(UserOrdersResult.UnexpectedError(error: response.result.error))
                }
        }
    }
    
}
