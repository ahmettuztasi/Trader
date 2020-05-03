//
//  LoginModel.swift
//  Trader
//
//  Created by admin on 2.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

// MARK: - LoginModel
class LoginModel: Codable {
    let result: Result
    let accountList: [String]
    let defaultAccount, customerID: String
    let userRights: [UserRight]
    let exCode: Int
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case accountList = "AccountList"
        case defaultAccount = "DefaultAccount"
        case customerID = "CustomerID"
        case userRights = "UserRights"
        case exCode = "ExCode"
    }
    
    init(result: Result, accountList: [String], defaultAccount: String, customerID: String, userRights: [UserRight], exCode: Int) {
        self.result = result
        self.accountList = accountList
        self.defaultAccount = defaultAccount
        self.customerID = customerID
        self.userRights = userRights
        self.exCode = exCode
    }
}
