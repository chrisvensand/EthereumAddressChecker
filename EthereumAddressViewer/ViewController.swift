//
//  HomeScreen.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/2/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var frontScreen = eTracker()
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var AddressTextField: UITextField!
    
    @IBAction func AddAddressButton(_ sender: UIButton) {
        let name = self.NameTextField.text!
        let publicAddress = self.AddressTextField.text!
        
        frontScreen.AddAddressTracker(name: name, address: publicAddress)
        
        
    }
    
}
