//
//  EmailButton.swift
//  EthereumAddressViewer
//
//  Created by Christopher Vensand on 7/14/18.
//  Copyright © 2018 Christopher Vensand. All rights reserved.
//

import Foundation
import UIKit

let email = "chrisvensand@gmail.com"
if let url = URL(string: "mailto:\(email)") {
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(url)
    } else {
        UIApplication.shared.openURL(url)
    }
}
