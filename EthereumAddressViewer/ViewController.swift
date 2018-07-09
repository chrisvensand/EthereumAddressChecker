//
//  HomeScreen.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/2/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import UIKit
import Foundation

struct PriceInfo: Decodable {
    let rate: String?
    let diff: float_t?
    let diff7d: float_t?
    let ts: String?
    let marketCapUsd: String?
    let availableSupply: String?
    let volume24h: String?
    let diff30d: float_t?
    let currency: String?
}

struct TokenInfo: Decodable {
    let address: String?
    let name: String?
    let decimals: String?
    let symbol: String?
    let totalSupply: String?
    let owner: String?
    let transfersCount: intmax_t?
    let lastUpdated: intmax_t?
    let issuancesCount: intmax_t?
    let holdersCount: intmax_t?
    let image: String?
    let description: String?
    let website: String?
    let ethTrasfersCount: intmax_t?
    let price: PriceInfo?
    let countOps: intmax_t?
}

struct Token: Decodable {
    let tokenInfo: TokenInfo?
    let balance: float_t?
    let totalIn: float_t?
    let totalOut: float_t?
}

struct EthplorerDescription: Decodable {
    let address: String?
    let ETH: Token?
    let countTxs: intmax_t?
    let tokens: [Token]?
}

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var publicAddressLabel: UILabel!
    @IBOutlet weak var etherBalanceLabel: UILabel!
    
    @IBAction func checkBalance(_ sender: UIButton) {
        
        let publicAddress = self.userInput.text!
        let jsonUrlString = "https://api.ethplorer.io/getAddressInfo/" + publicAddress + "?apiKey=freekey"
        
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
                    print(data!)
                    print(publicAddress)
                    let ethplorerDescription = try JSONDecoder().decode(EthplorerDescription.self, from: data!)
                    print(ethplorerDescription.tokens![0].tokenInfo!.name!)
                } catch let jsonErr {
                    print(jsonErr)
                }
                
            }.resume()
            
        }
        
    }
    
}
