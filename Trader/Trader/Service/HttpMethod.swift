//
//  HttpMethod.swift
//  Trader
//
//  Created by admin on 1.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

/// This enum contains http method. It gives method that string type when it's called.
/// Usage Example: HttpMethod.get
public enum HttpMethod: String{
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}
