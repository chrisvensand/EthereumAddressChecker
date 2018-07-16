//
//  ETHAddressInfo.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/9/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import Foundation

struct PriceInfo: Decodable {
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

struct TokenInfo: Decodable {
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

struct Token: Decodable {
    var tokenInfo: TokenInfo?
    var balance: float_t?
    var totalIn: float_t?
    var totalOut: float_t?
}

struct ETHAddressInfo: Decodable {
    var address: String?
    var ETH: Token?
    var countTxs: intmax_t?
    var tokens: [Token]?
    
}
