//
//  SecondViewController.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/1/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit
import MBProgressHUD

class AddressesVC: UIViewController {
    
    private var addressesTableVC: AddressesTableVC? = nil
    fileprivate var loadingData = false // Used to prevent multiple simultanious load requests
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LogManager.log.info("Initialization")
        loadData(silent: false)
    }
    
    deinit {
        LogManager.log.info("Deinitialization")
    }
    
    // MARK: Prepare segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.ordersTable.rawValue {
            if let addressesTableVC = segue.destination as? AddressesTableVC {
                self.addressesTableVC = addressesTableVC
            }
        }
    }
    
    // MARK: Networking
    
    private func loadData(silent: Bool) {
        guard !loadingData else { return }
        loadingData = true
        if !silent {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        AddressService.shared.getAddresses() { [weak self] (result) in
            guard let self_ = self else { return }
            defer {
                MBProgressHUD.hide(for: self_.view, animated: true)
            }
            
            switch result {
            case .Success(let addresses):
                self_.setup(addresses)
            case .UnexpectedError(let error):
                self_.showUnexpectedErrorAlert(error: error)
                break
            case .OfflineError:
                self_.showOfflineErrorAlert()
                break
            }
        }
    }
    
    // MARK: Helpers
    
    private func setup(_ addresses: [Address]) {
        DataManager.shared.save(addresses: addresses)
    }
    
}

