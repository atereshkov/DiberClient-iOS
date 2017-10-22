//
//  AddressService.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/22/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import Async

class AddressService: NSObject {
    
    static let shared = AddressService()
    let sessionManager = NetworkManager.shared.sessionManager
    
    enum UserAddressesResult {
        case Success(addresses: [Address])
        case OfflineError
        case UnexpectedError(error: Error?)
    }
    
    func getAddresses(callback:((_ result: UserAddressesResult) -> ())? = nil) {
        let url = ApiEndpoint.userAddresses.url()
        
        sessionManager.request(url)
            .validate()
            .responseJSON { response in
                var addresses = [Address]()
                if response.result.error == nil, let data = response.result.value as? [String: Any] {
                    if let addressesData = data["content"] as? [[String: Any]] {
                        for addressData in addressesData {
                            if let address = Address.with(data: addressData) {
                                addresses.append(address)
                            }
                        }
                    }
                    callback?(UserAddressesResult.Success(addresses: addresses))
                } else {
                    callback?(UserAddressesResult.UnexpectedError(error: response.result.error))
                }
        }
    }
    
}

