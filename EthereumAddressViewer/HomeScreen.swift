//
//  HomeScreen.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/2/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import UIKit
import Foundation

struct AddressData: Decodable {
    let status: String
    let message: String
    let result: String
}

class HomeScreen: UIViewController {
    
    let weiPerEther = 1e18
    var etherBalance = 0.0
    // Etherscan.io APIKey
    let apiKeyToken = "5VSMNSG8R9K4W6M7KC85RXRSVHYZZHGNTZ"

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var publicAddressLabel: UILabel!
    @IBOutlet weak var etherBalanceLabel: UILabel!
    
    @IBAction func checkBalance(_ sender: UIButton) {
        
        let publicAddress = self.userInput.text!
        let jsonUrlString = "https://api.etherscan.io/api?module=account&action=balance&address=" + publicAddress + "&tag=latest&apikey=" + apiKeyToken
        
        if publicAddress.count != 42 {
            self.publicAddressLabel.text = "Address: Invalid Public Address"
        }
            
        else if publicAddress.prefix(2) != "0x" {
            self.publicAddressLabel.text = "Address: Must begin with 0x"
        }
        
        else {
            
            let urlString = URL(string: jsonUrlString)
            
            URLSession.shared.dataTask(with: urlString!) { (data, response, Error) in
                
                do {
                    let addressData = try JSONDecoder().decode(AddressData.self, from: data!)
                    self.etherBalance = Double(addressData.result)! / self.weiPerEther
                    self.etherBalanceLabel.text = "Balance (Eth): " + String(self.etherBalance)
                } catch let jsonErr {
                    print(jsonErr)
                }
                
            }.resume()
            
        }
        
    }
    
}
