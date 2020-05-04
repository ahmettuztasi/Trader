//
//  ParemeterBuilder.swift
//  Trader
//
//  Created by admin on 1.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

/// Parameter builder class responsible to create http parameter
/// - Note: this class desinged according to builder pattern.
/// - Parameters: msgType, userName, password, accountId, exchangeId and outputType
class ParameterBuilder {
    /// it's defined for store parameters to create http parameter in createParameters method
    fileprivate var paramDict: [String:Any] = [:]
    
    ///this method get platform key and set it to paramDict
    /// - Parameters: msgType -> string type
    /// - Returns: self which means Parameter builder class
    func setMsgType(_ msgType: String) -> ParameterBuilder {
        self.paramDict.updateValue(msgType, forKey: "MsgType")
        return self
    }
    ///this method get platform key and set it to paramDict
    /// - Parameters: customerNo -> string type
    /// - Returns: self which means Parameter builder class
    func setCustomerNo(_ customerNo: String) -> ParameterBuilder {
        self.paramDict.updateValue(customerNo, forKey: "CustomerNo")
        return self
    }
    ///this method get content type and set it to paramDict
    /// - Parameters: userName -> string type
    /// - Returns: self which means Parameter builder class
    func setUsername(_ userName: String) -> ParameterBuilder {
        self.paramDict.updateValue(userName, forKey: "Username")
        return self
    }
    ///this method get content type and set it to paramDict
    /// - Parameters: password -> string type
    /// - Returns: self which means Parameter builder class
    func setPassword(_ password: String) -> ParameterBuilder {
        self.paramDict.updateValue(password, forKey: "Password")
        return self
    }
    ///this method get content type and set it to paramDict
    /// - Parameters: accountId -> string type
    /// - Returns: self which means Parameter builder class
    func setAccountID(_ accountId: String) -> ParameterBuilder {
        self.paramDict.updateValue(accountId, forKey: "AccountID")
        return self
    }
    ///this method get content type and set it to paramDict
    /// - Parameters: exchangeId -> string type
    /// - Returns: self which means Parameter builder class
    func setExchangeID(_ exchangeId: String) -> ParameterBuilder {
        self.paramDict.updateValue(exchangeId, forKey: "ExchangeID")
        return self
    }
    ///this method get content type and set it to paramDict
    /// - Parameters: outputType -> string type
    /// - Returns: self which means Parameter builder class
    func setOutputType(_ outputType: String) -> ParameterBuilder {
        self.paramDict.updateValue(outputType, forKey: "OutputType")
        return self
    }
    ///this method returning a parameter dictionary which is seted before by developers.
    /// - Returns: paramDict -> dictionary type
    func createParameters() -> [String:Any] {
        return paramDict
    }
}
