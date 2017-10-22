//
//  AddressCell.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/22/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

protocol AddressCellDelegate : class {
    
}

class AddressCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: AddressCellDelegate?
    
    //MARK:- Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK:- Public
    
    public func bind(with item: AddressView) {
        label.text = "\(item.id) | \(item.address)"
    }
    
    //MARK:- Actions
    
    
}
