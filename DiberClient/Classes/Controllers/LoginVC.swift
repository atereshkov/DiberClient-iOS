//
//  LoginVC.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginVC: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(false)
        
        //skipLoginIfAuthorized()
    }
    
    // MARK: Actions
    
    @IBAction func signInAction(_ sender: Any) {
        let login = loginField.text?.trim() ?? ""
        let password = passwordField.text?.trim() ?? ""
        
        self.perfomLogin(login, password)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    
    // MARK:
    
    fileprivate func skipLoginIfAuthorized() {
        // if PreferenceManager.shared.isAuthorized() && StoreManager.shared.getCurrentUser() != nil {
        if PreferenceManager.shared.isAuthorized() {
            self.performSegue(withIdentifier: Segues.mainScreen.rawValue, sender: self)
        }
    }
    
    private func perfomLogin(_ login: String, _ password: String) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        AuthService.shared.getToken(login: login, password: password) { [weak self] (result) in
            guard let self_ = self else {
                return
            }
            
            defer {
                MBProgressHUD.hide(for: self_.view, animated: true)
            }
            
            switch result {
            case .Success(_):
                PreferenceManager.shared.name = login
                self_.performSegue(withIdentifier: Segues.mainScreen.rawValue, sender: self)
            case .UnexpectedError(let error):
                self_.showUnexpectedErrorAlert(error: error)
                break
            case .OfflineError:
                self_.showOfflineErrorAlert()
                break
            case .InvalidCredentials:
                // TODO
                self_.showMessageErrorAlert(message: "Incorrect password")
                break
            }
        }
    }
    
}
