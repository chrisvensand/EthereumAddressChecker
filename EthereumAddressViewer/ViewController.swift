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
    
    @IBAction func AddAddressButton(_ sender: UIButton) {
        let name = readLine()
        let publicAddress = readLine()
    }
    
}