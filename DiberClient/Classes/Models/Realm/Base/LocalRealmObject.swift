//
//  SyncRealmObject.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import RealmSwift

class SyncRealmObject: RealmObject {
    
    var identity = RealmOptional<Int>()
    
    func isLocal() -> Bool {
        return identity.value == nil
    }
    
}
