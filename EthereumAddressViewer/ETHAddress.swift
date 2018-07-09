//
//  ETHAddress.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/8/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import Foundation

class ETHAddress: AddressTracker {
    
    fileprivate struct PriceInfo: Decodable {
        var rate: String?
        var diff: float_t?
        var diff7d: float_t?
        var ts: String?
        var marketCapUsd: String?
        var availableSupply: String?
        var volume24h: String?
        var diff30d: float_t?
        var currency: String?
    }
    
    fileprivate struct TokenInfo: Decodable {
        let address: String?
        let name: String?
        let decimals: String?
        var symbol: String?
        let totalSupply: String?
        var owner: String?
        var transfersCount: intmax_t?
        var lastUpdated: intmax_t?
        var issuancesCount: intmax_t?
        var holdersCount: intmax_t?
        var image: String?
        var description: String?
        var website: String?
        var ethTrasfersCount: intmax_t?
        var price: PriceInfo?
        var countOps: intmax_t?
    }
    
    fileprivate struct Token: Decodable {
        var tokenInfo: TokenInfo?
        var balance: float_t?
        var totalIn: float_t?
        var totalOut: float_t?
    }
    
    fileprivate struct ETHAddressInfo: Decodable {
        let address: String?
        var ETH: Token?
        var countTxs: intmax_t?
        var tokens: [Token]?
    }
    
    fileprivate var addressInfo: ETHAddressInfo?
    
    init (publicAddress: String) {
        
        let jsonUrlString = "https://api.ethplorer.io/getAddressInfo/" + publicAddress + "?apiKey=freekey"
        let urlString = URL(string: jsonUrlString)
        
        // Open a URLSession to try and recieve ETH Address information
        URLSession.shared.dataTask(with: urlString!) { (data, response, Error) in
            
            do {
                self.addressInfo = try JSONDecoder().decode(ETHAddressInfo.self, from: data!)
            }
                // If URLSession data cannot be retrieved print error
            catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
    func totalBalance() -> float_t {
        
        var totalBalance = addressInfo!.ETH!.balance!
        
        for token in addressInfo!.tokens! {
            totalBalance += token.balance!
        }
        
        return totalBalance
    }
    
    
}
