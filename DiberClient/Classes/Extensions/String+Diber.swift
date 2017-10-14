//
//  String+Diber.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

extension String {
    
    func substring(from: Int) -> String {
        return substring(from: index(startIndex, offsetBy: from))
    }
    
    func substring(to: Int) -> String {
        return substring(to: index(startIndex, offsetBy: to))
    }
    
}
