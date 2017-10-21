//
//  MainNavigationVC.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/21/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

class MainNavigationVC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(authExpiredNotification(notification:)), name: .AuthenticationExpired, object: nil)
    }
    
    deinit {
        LogManager.shared.log.info("Deinitialization")
        NotificationCenter.default.removeObserver(self, name: .AuthenticationExpired, object: nil)
    }
    
    //MARK:- Notifications
    
    internal func authExpiredNotification(notification: Notification) {
        self.performSegue(withIdentifier: Segues.loginFromMain.rawValue, sender: self)
    }
    
}
