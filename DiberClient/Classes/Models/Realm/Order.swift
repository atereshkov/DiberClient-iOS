//
//  Order.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import RealmSwift

class Order: RealmObject {
    
    private(set) dynamic var id: Int = -1
    private(set) dynamic var date: Date = Date(timeIntervalSince1970: 1)
    private(set) dynamic var descr: String = ""
    private(set) dynamic var price: Double = 0
    private(set) dynamic var status: String = ""
    private(set) dynamic var addressFrom: Address? = nil
    private(set) dynamic var addressTo: Address? = nil
    private(set) dynamic var courier: User? = nil
    private(set) dynamic var customer: User? = nil
    
    convenience init(id: Int, date: Date, descr: String, price: Double, status: String, addressFrom: Address? = nil, addressTo: Address? = nil, courier: User? = nil, customer: User? = nil) {
        self.init()
        self.id = id
        self.date = date
        self.descr = descr
        self.price = price
        self.status = status
        self.addressTo = addressTo
        self.addressFrom = addressFrom
        self.courier = courier
        self.customer = customer
    }
    
    // MARK: Realm
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: Serialization

extension Order {
    
    class func with(data: [String: Any]) -> Order? {
        guard let id = data["id"] as? Int, let date = data["date"] as? Date, let price = data["price"] as? Double, let status = data["status"] as? String else {
            Swift.print("[Order] Failed to parse order")
            return nil
        }
        let descr = data["description"] as? String ?? ""
        
        var addressTo: Address?
        if let addressToData = data["addressTo"] as? [String: Any] {
            addressTo = Address.with(data: addressToData)
        }
        var addressFrom: Address?
        if let addressFromData = data["addressFrom"] as? [String: Any] {
            addressFrom = Address.with(data: addressFromData)
        }
        var courier: User?
        if let courierData = data["courier"] as? [String: Any] {
            courier = User.with(data: courierData)
        }
        var customer: User?
        if let customerData = data["customer"] as? [String: Any] {
            customer = User.with(data: customerData)
        }
        
        return Order(id: id, date: date, descr: descr, price: price, status: status, addressFrom: addressFrom, addressTo: addressTo, courier: courier, customer: customer)
    }
}

