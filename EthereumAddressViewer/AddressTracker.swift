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
    var name = ""
    var address = ""
    var totalValue = Float(0)
    var ethAddress = ETHAddressInfo()
    
    init (name: String, publicAddress: String) {
        self.name = name
        self.address = publicAddress
        
        let jsonUrlString = "https://api.ethplorer.io/getAddressInfo/" + address + "?apiKey=freekey"
        let urlString = URL(string: jsonUrlString)
        
        URLSession.shared.dataTask(with: urlString!) { (data, response, Error) in
            
            do {
                self.ethAddress = try JSONDecoder().decode(ETHAddressInfo.self, from: data!)
            }
                // If URLSession data cannot be retrieved print error
            catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
        
        
        //self.totalBalance = findBalance()
        
    }
    
    func findBalance() -> float_t {
        
        var totalBalance = ethAddress.ETH!.balance!
        
        for token in ethAddress.tokens! {
            totalBalance += token.balance!
        }
        
        return totalBalance
    }
    
}

