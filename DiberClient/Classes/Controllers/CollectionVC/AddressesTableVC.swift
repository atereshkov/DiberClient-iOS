//
//  AddressesTableVC.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/22/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit
import RealmSwift

class AddressesTableVC: UITableViewController {
    
    fileprivate var addressesDBO: Results<Address> = DataManager.shared.getAddresses()
    fileprivate var addresses = [AddressView]()
    
    fileprivate var addressesChangedNotification: NotificationToken? = nil
    fileprivate var debounceTimer: WeakTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNotifications()
    }
    
    deinit {
        debounceTimer?.invalidate()
        addressesChangedNotification?.stop()
        LogManager.log.info("Deinitialization")
    }
    
    // MARK: Private
    
    fileprivate func registerNotifications() {
        guard !DataManager.shared.isInWriteTransaction else { return }
        addressesChangedNotification?.stop()
        addressesChangedNotification = addressesDBO.addNotificationBlock { [weak self] (changes) in
            guard let _self = self else { return }
            switch changes {
            case .initial:
                _self.reloadAddressesDebounced()
            case .update(_, _, _, _):
                _self.reloadAddressesDebounced()
            case .error(let error):
                LogManager.log.error("Failed to update fetch results: \(error)")
            }
        }
    }
    
    fileprivate func reloadAddressesDebounced() {
        debounceTimer?.invalidate()
        debounceTimer = WeakTimer(timeInterval: 0.05, target: self, selector: #selector(reloadAddresses), repeats: false)
    }
    
    @objc fileprivate func reloadAddresses() {
        self.addresses = AddressView.from(addresses: addressesDBO)
        self.tableView.reloadData()
    }
    
    // MARK: TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.addresses.rawValue, for: indexPath)
            as? AddressCell else {
                fatalError("The dequeued cell is not an instance of AddressCell")
        }
        
        let address = addresses[indexPath.row]
        cell.bind(with: address)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addresses.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

