//
//  LogManager.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import Foundation
import EXPLogger

class LogManager: NSObject {
    
    static let shared = LogManager()
    static let log = LogManager().logger
    
    let logger = EXPLogger.self
    
    // MARK: Init
    
    func initialize() {
        let console = ConsoleTarget()
        console.minLogLevel = .verbose
        logger.addTarget(console)
    }
    
}
