//
//  BooksTafserModel.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
struct BooksTafserViewModel: BaseModel {
    let status: Int?
       let message: String?
       let pagesNumber: Int?
    var results: [Result]?
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case pagesNumber = "pagesNumber"
        case results = "results"
    }
   
}

