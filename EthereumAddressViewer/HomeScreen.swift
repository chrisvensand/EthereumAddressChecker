//
//  HomeScreen.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/2/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var publicAddress: UITextField!
    
    @IBAction func checkBalance(_ sender: UIButton) {
        print(self.publicAddress.text as Any)
    }
    
    
}
