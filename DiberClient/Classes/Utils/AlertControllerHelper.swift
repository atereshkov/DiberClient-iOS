//
//  AlertControllerHelper.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/14/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    // MARK: Util
    
    static func showErrorAlertController(error: Error?, fromViewController viewController: UIViewController) -> Void {
        UIAlertController.showAlert(
            title: NSLocalizedString("alert.error.title", comment: ""),
            message: error?.localizedDescription,
            fromViewController: viewController)
    }
    
    static func showErrorAlertControllerWithMessage(message: String, fromViewController viewController: UIViewController) -> Void {
        UIAlertController.showAlert(
            title: NSLocalizedString("alert.error.title", comment: ""),
            message: message,
            fromViewController: viewController)
    }
    
    static func showAlertController(title: String? = nil, message: String? = nil, fromViewController viewController: UIViewController) -> Void {
        let errorTitle = title ?? NSLocalizedString("alert.error.title", comment: "")
        
        let errorMessage = message ?? "\(NSLocalizedString("alert.error.unexpected.description", comment: "")) \(NSLocalizedString("alert.error.unexpected.recovery", comment: ""))"
        
        UIAlertController.showAlert(
            title: errorTitle,
            message: errorMessage,
            fromViewController: viewController)
    }
    
    // MARK: Offline error
    
    static func showOfflineErrorAlert(fromViewController controller: UIViewController) -> Void {
        UIAlertController.showAlert(
            title: NSLocalizedString("alert.error.title", comment: ""),
            message: NSLocalizedString("alert.offline.message", comment: ""),
            fromViewController: controller)
    }
    
    // MARK: Login errors
    
    static func showInvalidLoginDataAlert(fromViewController controller: UIViewController) -> Void {
        UIAlertController.showAlert(
            title: NSLocalizedString("alert.error.title", comment: ""),
            message: NSLocalizedString("alert.register.user.error.message", comment: ""),
            fromViewController: controller)
    }
    
    // MARK: Common
    
    static func showAlert(title: String?, message: String?, fromViewController controller: UIViewController) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("alert.ok", comment: ""), style: UIAlertActionStyle.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    
    func showOfflineErrorAlert() -> Void {
        UIAlertController.showOfflineErrorAlert(fromViewController: self);
    }
    
    func showMessageErrorAlert(message: String) -> Void {
        UIAlertController.showAlertController(title: NSLocalizedString("alert.error.title", comment: ""),
                                              message: message,
                                              fromViewController: self);
    }
    
    func showUnexpectedErrorAlert(error: Error? = nil) -> Void {
        if let err = error {
            UIAlertController.showAlertController(title: NSLocalizedString("alert.error.title", comment: ""),
                                                  message: err.localizedDescription,
                                                  fromViewController: self);
        } else {
            UIAlertController.showAlertController(fromViewController: self)
        }
    }
    
    func showAlert(title : String?, message: String?) -> Void {
        UIAlertController.showAlert(title: title, message: message, fromViewController: self)
    }
    
    func showMissingErrorAlert() -> Void {
        UIAlertController.showAlertController(title: NSLocalizedString("alert.error.title", comment: ""),
                                              message: NSLocalizedString("alert.error.unexpected.nodata", comment: ""),
                                              fromViewController: self)
        
    }
    
    func showAuthExpiredAlert(callback: (() -> Void)? = nil) -> Void {
        let alert = UIAlertController(title: NSLocalizedString("alert.error.title", comment: ""),
                                      message: NSLocalizedString("alert.session.expired.error.msg", comment: ""),
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("alert.ok", comment: ""), style: UIAlertActionStyle.default, handler: { (action) in
            callback?()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithCallback(title : String?, message: String?, callback : (() -> Void)? = nil) -> Void {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("alert.ok", comment: ""), style: UIAlertActionStyle.default, handler: { (action) in
            callback?()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(with title: String,
                   and message: String,
                   buttons : [(title: String, style : UIAlertActionStyle, callback: (()->())?)]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for button in buttons {
            let defaultAction = UIAlertAction(title: button.title, style: button.style, handler: { action in
                button.callback?();
            })
            alertController.addAction(defaultAction)
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

