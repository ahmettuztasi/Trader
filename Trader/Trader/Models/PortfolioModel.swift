//
//  PortfolioModel.swift
//  Trader
//
//  Created by admin on 2.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

// MARK: - PortfolioModel
class PortfolioModel: Codable {
    let result: Result
    let item: [Item]
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case item = "Item"
    }
    
    init(result: Result, item: [Item]) {
        self.result = result
        self.item = item
    }
}
