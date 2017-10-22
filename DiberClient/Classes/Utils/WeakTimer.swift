//
//  WeakTimer.swift
//  DiberClient
//
//  Created by Alexander Tereshkov on 10/22/17.
//  Copyright © 2017 Alexander Tereshkov. All rights reserved.
//

import UIKit

class WeakTimer: NSObject {
    
    private weak var target: AnyObject? = nil
    private var selector: Selector
    private var timer: Timer!
    
    init(timeInterval: TimeInterval, target: AnyObject, selector: Selector, repeats: Bool) {
        self.target = target
        self.selector = selector
        super.init()
        timer = Timer(timeInterval: timeInterval, target: self, selector: #selector(timerSelector), userInfo: nil, repeats: repeats)
        RunLoop.current.add(timer, forMode: .commonModes)
    }
    
    deinit {
        timer.invalidate()
    }
    
    func invalidate() {
        timer.invalidate()
    }
    
    @objc private func timerSelector() {
        _ = target?.perform(selector)
    }
}
