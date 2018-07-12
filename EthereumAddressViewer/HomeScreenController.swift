//
//  HomeScreen.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/2/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import UIKit
import Foundation

class HomeScreenController: UIViewController, UITextFieldDelegate{
    // TableView 

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UIAlertController , adding form, 
    
    @IBAction func AddAddressButton(_ sender: UIBarButtonItem) {
        /*let alert = UIAlertController(title: "Add Button Pressed", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default Action"), style: .default, handler: { _ in NSLog("The \"OK\" alery occured.")}))
        self.present(alert, animated: true, completion: nil)*/
        
        //insertNewAddress()
        
    }
    
    /*func insertNewAddress() {
        addresses.append(AddressTracker(name: nameTextField.text!, publicAddress: addressTextField.text!))
        
        let indexPath = IndexPath(row: addresses.count - 1, section: 0)
        print(indexPath)
        print(addresses.count - 1)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        nameTextField.text = ""
        addressTextField.text = ""
        view.endEditing(true)
    }*/
    
}
