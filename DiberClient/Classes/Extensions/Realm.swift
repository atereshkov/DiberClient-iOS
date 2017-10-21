//
//  Realm+Diber.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/21/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import RealmSwift

extension Realm {
    
    func deleteCascade(object: RealmObject) {
        var objectsToDelete = [RealmObject]()
        objectsToDelete.append(object)
        objectsToDelete.append(contentsOf: object.childrenToDelete())
        delete(objectsToDelete)
    }
    
}
