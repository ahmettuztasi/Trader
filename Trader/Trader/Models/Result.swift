//
//  Result.swift
//  Trader
//
//  Created by admin on 2.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

// MARK: - Result
class Result: Codable {
    let state: Bool
    let code: Int
    let resultDescription, sessionKey: String
    let duration: Int
    let msgType, v: String
    
    enum CodingKeys: String, CodingKey {
        case state = "State"
        case code = "Code"
        case resultDescription = "Description"
        case sessionKey = "SessionKey"
        case duration = "Duration"
        case msgType = "MsgType"
        case v = "V"
    }
    
    init(state: Bool, code: Int, resultDescription: String, sessionKey: String, duration: Int, msgType: String, v: String) {
        self.state = state
        self.code = code
        self.resultDescription = resultDescription
        self.sessionKey = sessionKey
        self.duration = duration
        self.msgType = msgType
        self.v = v
    }
}
