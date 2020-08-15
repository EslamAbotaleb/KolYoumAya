//
//  ReciterModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - ReciterModel
struct ReciterModel: BaseModel {
    let status: Int
    let message: String
    let pagesNumber: Int
    var results: [ResultReciter]
     enum CodingKeys: String, CodingKey {
          
            case status = "status"
            case message = "message"
            case pagesNumber = "pagesNumber"
            case results = "results"
           
        }
}



