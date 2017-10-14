//
//  LoginVC.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func signInAction(_ sender: Any) {
        self.performSegue(withIdentifier: Segues.mainScreen.rawValue, sender: sender)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
}
