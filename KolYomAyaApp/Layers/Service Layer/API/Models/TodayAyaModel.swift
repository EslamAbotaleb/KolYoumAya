//
//  TodayAyaModel.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/22/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - TodayAyaModel
struct TodayAyaViewModel: BaseModel {
    let status: Int?
    let message: String?
    let ayaObject: AyaObjectViewModel?
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case ayaObject = "ayaObject"
    }
}


