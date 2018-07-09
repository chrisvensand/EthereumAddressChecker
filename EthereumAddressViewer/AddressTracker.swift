//
//  Address.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/8/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import Foundation

// Address Button on homepage
class AddressTracker {
    
    // Address variables displayed on button in homepage
    var name: String
    var address: String
    var totalBalance: float_t
    
    var ethAddress: ETHAddress
    
    init (name: String, publicAddress: String) {
        self.name = name
        self.address = publicAddress
        
        // Retrieve Ethereum Address data
        ethAddress = ETHAddress(publicAddress: publicAddress)
        
        self.totalBalance = ethAddress.totalBalance()
    }
    
}

