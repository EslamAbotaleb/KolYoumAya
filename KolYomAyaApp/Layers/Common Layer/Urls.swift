//
//  Urls.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/22/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation

enum Urls {
    case empty
    case baseUrl
    var baseUrl: String {
        switch  self {
        case .empty:
            return ""
            
        case .baseUrl:
            return "http://160.153.235.227:8082/"
        
        }
    }
    enum Path {
        case empty
        case todayAya
        var absolutepath: String {
            switch self {
            case .empty:
                return ""
            case .todayAya:
                return "get/today/aya"
           
            }
        }
    }
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
    }
    enum Scheme: String {
        case https
    }
}
