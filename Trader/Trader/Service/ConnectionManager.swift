//
//  ConnectionManager.swift
//  Trader
//
//  Created by admin on 1.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation
import Alamofire

/// This Connection Manager class responsible for comminicate to service.
/// - Parameters: Url, send model, header, http method
/// - Note: This class using builder pattern. Service words means in this class is API which is send and get data
final class ConnectionManager {
    ///this dictionary going to get parameters when it's called and store all parameters for sendRequest method.
    fileprivate var requestDict: [String:Any] = [:]
    ///this method get url which is app needs to connect service
    /// - Parameters: Url -> String type
    /// - Returns: self which means Connection Manager class
    func setBaseUrl(url: String) -> ConnectionManager {
        requestDict.updateValue(url, forKey: "Url")
        return self
    }
    /// this method get http body parameters which is need to send service
    /// - Parameters: body parameters -> dictionary type
    /// - Returns: self which means Connection Manager class
    func setBodyParameter(parameter: [String: Any]) -> ConnectionManager {
        requestDict.updateValue(parameter, forKey: "parameters")
        return self
    }
    ///this method get http header which is need to send service
    /// - Parameters: headers -> dictionary type
    /// - Returns: self which means Connection Manager class
    func setHeader(header: [String : String] ) -> ConnectionManager {
        requestDict.updateValue(header, forKey: "header")
        return self
    }
    ///this method get http method which is according to process with service
    /// - Parameters: method -> enum (generally it is string type)
    /// - Returns: self which means Connection Manager class
    func setMethod(method: HTTPMethod ) -> ConnectionManager {
        requestDict.updateValue(method, forKey: "method")
        return self
    }
    ///this method send request to service using Alamofire framework and return a result
    /// - Parameters: url, http method, http body parameters, http header,
    /// - Returns: if connection is success, it's returning Data, else it's returning an Error.
    func sendRequest(completion: @escaping (Response<Data>) -> Void) {
        
        request(requestDict["Url"] as! String,
                method: requestDict["method"] as! HTTPMethod,
                parameters: requestDict["parameters"] as? Parameters,
                encoding: URLEncoding.default,
                headers: requestDict["header"] as? HTTPHeaders).responseData { (response) in
                    switch response.result {
                    case .success(let data): completion(.success(data))
                    case .failure(let error): completion(.failure(error))
                    }
        }
    }
}
