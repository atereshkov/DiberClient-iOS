//
//  User.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import RealmSwift

class User: RealmObject {
    
    private(set) dynamic var id: Int = -1
    private(set) dynamic var email: String = ""
    private(set) dynamic var username: String = ""
    private(set) dynamic var password: String = ""
    private(set) dynamic var enabled: Bool = true
    private(set) dynamic var fullname: String = ""
    private(set) var roles = List<Role>()
    
    convenience init(id: Int, email: String, username: String, password: String, enabled: Bool, fullname: String, roles: [Role]) {
        self.init()
        self.id = id
        self.email = email
        self.username = username
        self.password = password
        self.password = password
        self.enabled = enabled
        self.fullname = fullname
        self.roles.append(objectsIn: roles)
    }
    
    // MARK: Realm
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// MARK: Serialization

extension User {
    
    class func with(data: [String: Any]) -> User? {
        guard let id = data["id"] as? Int, let username = data["username"] as? String, let password = data["password"] as? String else {
            LogManager.log.error("Failed to parse User")
            return nil
        }
        let email = data["email"] as? String ?? ""
        let enabled = data["enabled"] as? Bool ?? false
        let fullname = data["fullname"] as? String ?? ""
        
        // TODO: role works incorrectly now in database realm (duplicates)
        let roles = [Role]()
        /*
        if let rolesData = data["roles"] as? [[String: Any]] {
            for dataRole in rolesData {
                guard let userRole = Role.with(data: dataRole) else { return nil }
                roles.append(userRole)
            }
        }
        */
        
        return User(id: id, email: email, username: username, password: password, enabled: enabled, fullname: fullname, roles: roles)
    }
}
