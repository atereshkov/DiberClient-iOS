//
//  Role.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import RealmSwift

class Role: RealmObject {
    
    private(set) dynamic var name: String = ""
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    
}

// MARK: Serialization

extension Role {
    
    class func with(data: [String: Any]) -> Role? {
        guard let name = data["name"] as? String else {
            Swift.print("[Role] Failed to parse role")
            return nil
        }
        return Role(name: name)
    }
}
