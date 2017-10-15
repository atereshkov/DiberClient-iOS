//
//  Cells.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/15/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

protocol OrderCellDelegate : class {
    
}

class OrderCell: UITableViewCell {
    
    
    
    weak var delegate: OrderCellDelegate?
    
    //MARK:- Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    //MARK:- Public
    
    public func bind(with item: Order) {
        
    }
    
    //MARK:- Actions
    
    
}
