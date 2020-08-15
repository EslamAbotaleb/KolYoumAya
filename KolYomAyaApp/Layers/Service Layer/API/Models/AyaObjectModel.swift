//
//  AyaObjectModel.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/22/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - AyaObject
struct AyaObjectViewModel: BaseModel {
    let id, ayaNumber: Int
    let aya, suraName, tafsirAuthor, tafsir: String
    let displyDate, createdAt: String
    let displayToday, itemDisplayed: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case ayaNumber = "ayaNumber"
        case aya = "aya"
        case suraName = "suraName"
        case tafsirAuthor = "tafsirAuthor"
        case tafsir = "tafsir"
        case displyDate = "displyDate"
        case createdAt = "createdAt"
        case displayToday = "displayToday"
        case itemDisplayed = "itemDisplayed"
    }
}
