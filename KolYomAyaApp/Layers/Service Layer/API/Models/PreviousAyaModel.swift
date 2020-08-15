//
//  PreviousAyaModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
struct PreviousAyatModel: BaseModel {
    let status: Int
    let message: String
    let pagesNumber: Int
    var ayaObject: [AyaObjectViewModel]
    
   enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case pagesNumber = "pagesNumber"
        case ayaObject = "ayaObject"
    }
}
