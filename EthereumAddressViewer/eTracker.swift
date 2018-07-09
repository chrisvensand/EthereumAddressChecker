//
//  eTracker.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/8/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import Foundation

class eTracker {
    
    var addressTrackers = [String : AddressTracker]()
    
    func AddAddressTracker(name: String, address: String) {
        if addressTrackers[name] == nil {
            addressTrackers[name] = AddressTracker(name: name, publicAddress: address)
        }
        else {
            // Send some error saying you have already used this name
        }
    }
    
}
