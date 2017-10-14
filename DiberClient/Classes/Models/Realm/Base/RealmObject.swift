//
//  RealmObject.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import RealmSwift

class RealmObject: Object {
    
    func childrenToDelete() -> [RealmObject] {
        return []
    }
    
}
