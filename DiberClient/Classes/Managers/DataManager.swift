//
//  DataManager.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/21/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import RealmSwift

class DataManager: NSObject {
    
    static let shared = DataManager()
    
    let realm = try! Realm()
    
    var isInWriteTransaction: Bool {
        return realm.isInWriteTransaction
    }
    
    func save(object: RealmObject) {
        writeTransaction { (realm) in
            realm.add(object, update: true)
        }
    }
    
    func deleteCascade(object: RealmObject) {
        writeTransaction { (realm) in
            realm.deleteCascade(object: object)
        }
    }
    
    func writeTransaction(_ block: @escaping ((Realm) -> ())) {
        do {
            try realm.write {
                block(realm)
            }
        } catch let error {
            LogManager.log.error("Failed to execute write transaction: \(error)")
        }
    }
    
}

// MARK: User
extension DataManager {
    
    func getUser(with name: String) -> User? {
        return realm.objects(User.self).filter("name == %@", name).first
    }
    
    func getCurrentUser() -> User? {
        let name = PreferenceManager.shared.name
        if let user = DataManager.shared.getUser(with: name) {
            return user
        }
        return nil
    }
    
    func removeAllUsers() {
        writeTransaction { (realm) in
            realm.delete(realm.objects(User.self))
        }
    }
    
}

// MARK: Orders
extension DataManager {
    
    func getOrders() -> Results<Order> {
        return realm.objects(Order.self)
    }
    
    func gerOrder(identity: Int) -> Order? {
        return realm.objects(Order.self).filter("identity == \(identity)").first
    }
    
}
