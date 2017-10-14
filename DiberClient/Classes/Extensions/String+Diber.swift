//
//  String+Diber.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func contains(string: String) -> Bool{
        return (self.range(of: string) != nil) ? true : false
    }
    
}
