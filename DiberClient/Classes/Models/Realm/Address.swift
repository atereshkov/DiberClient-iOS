//
//  Address.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import RealmSwift

class Address: RealmObject {
    
    private(set) dynamic var id: Int = -1
    private(set) dynamic var name: String = ""
    private(set) dynamic var postalCode: Int = 0
    private(set) dynamic var country: String = ""
    private(set) dynamic var city: String = ""
    private(set) dynamic var region: String = ""
    private(set) dynamic var address: String = ""
    private(set) dynamic var phone: String = ""
    
    convenience init(id: Int, name: String, postalCode: Int, country: String, city: String, region: String, address: String, phone: String) {
        self.init()
        self.id = id
        self.name = name
        self.postalCode = postalCode
        self.country = country
        self.city = city
        self.region = region
        self.address = address
        self.phone = phone
    }
    
    // MARK: Realm
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: Serialization

extension Address {
    
    class func with(data: [String: Any]) -> Address? {
        guard let id = data["id"] as? Int, let name = data["name"] as? String, let address = data["address"] as? String, let country = data["country"] as? String, let phone = data["phone"] as? String, let city = data["city"] as? String else {
            LogManager.shared.log.error("Failed to parse Address")
            return nil
        }
        let region = data["region"] as? String ?? ""
        let postalCode = data["postalCode"] as? Int ?? 0
        
        return Address(id: id, name: name, postalCode: postalCode, country: country, city: city, region: region, address: address, phone: phone)
    }
}
