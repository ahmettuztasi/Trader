//
//  HttpLink.swift
//  Trader
//
//  Created by admin on 1.05.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

/// This enum providing all service connection links.
/// - Usage Example: HttpLink.photos.value
/// - Returns: a string type of link
public enum HttpLink: String {
    /// mainURL is most important case of this enum because it stored main link.
    case mainURL = "https://tbpilot.matriksdata.com/9999/Integration.aspx"
    
    /// this variable returning full link when it is get called
    var UrlValue: String {
        return HttpLink.mainURL.rawValue + self.rawValue
    }
}
