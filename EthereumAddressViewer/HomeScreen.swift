//
//  HomeScreen.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/2/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var publicAddressLabel: UILabel!
    @IBOutlet weak var etherBalanceLabel: UILabel!
    
    @IBAction func checkBalance(_ sender: UIButton) {
        
        let publicAddress = self.userInput.text!
        
        if publicAddress.count != 42 {
            self.publicAddressLabel.text = "Address: Invalid Public Address"
            self.etherBalanceLabel.text = "Balance (Eth): 0"
        }
        
        else {
            self.publicAddressLabel.text = "Address: \(publicAddress)"
            // location to retrieve etherscan.io input
            self.etherBalanceLabel.text = "Balance (Eth): (etherscan.io val)"
        }
        
    }
    
    
}
