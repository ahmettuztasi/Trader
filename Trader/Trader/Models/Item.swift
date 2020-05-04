//
//  Item.swift
//  Trader
//
//  Created by admin on 3.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

// MARK: - Item
class Item: Codable {
    let accountID, symbol: String
    let qtyT2: Int
    let lastPx: Double
    
    enum CodingKeys: String, CodingKey {
        case accountID = "AccountID"
        case symbol = "Symbol"
        case qtyT2 = "Qty_T2"
        case lastPx = "LastPx"
    }
    
    init(accountID: String, symbol: String, qtyT2: Int, lastPx: Double) {
        self.accountID = accountID
        self.symbol = symbol
        self.qtyT2 = qtyT2
        self.lastPx = lastPx
    }
}
