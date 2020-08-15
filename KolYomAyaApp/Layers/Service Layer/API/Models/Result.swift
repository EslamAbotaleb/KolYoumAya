//
//  Result.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation

struct Result: BaseModel {
       let id: Int?
       let title: String?
       let cover: String?
       let isDisplayed, numberOfPages: Int?
       let bookType: String?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case cover = "cover"
        case isDisplayed = "isDisplayed"
        case numberOfPages = "numberOfPages"
        case bookType = "bookType"

    }
}
