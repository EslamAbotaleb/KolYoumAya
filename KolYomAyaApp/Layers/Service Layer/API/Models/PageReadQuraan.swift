//
//  PageReadQuraan.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - PageReadQuraan
struct PageReadQuraan: BaseModel {
    let id, pageNumber: Int?
    let pageDescription: String?
    let image: String?
    let createdAt: String?
    let updateAt: String?
    let surahList: [SurahList]?

    enum CodingKeys: String, CodingKey {
        case pageDescription = "description"
        case id = "id"
        case pageNumber = "pageNumber"
        case image = "image"
        case createdAt = "createdAt"
        case updateAt = "updateAt"
        case surahList = "surahList"

    }
}
