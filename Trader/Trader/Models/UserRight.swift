//
//  UserRight.swift
//  Trader
//
//  Created by admin on 2.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

// MARK: - UserRight
class UserRight: Codable {
    let code, key, value: String
    let timestamp: Int
    
    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case key = "Key"
        case value = "Value"
        case timestamp = "Timestamp"
    }
    
    init(code: String, key: String, value: String, timestamp: Int) {
        self.code = code
        self.key = key
        self.value = value
        self.timestamp = timestamp
    }
}
