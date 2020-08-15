//
//  PageModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - Page
struct Page: BaseModel {
    let id, pageNumber: Int?
    let title: String?
    let pageContent, tafsir, createdAt, updateAt: String?
    let surahList: [SurahList]?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case pageNumber = "pageNumber"
        case title = "title"
        case pageContent = "pageContent"
        case tafsir = "tafsir"
        case createdAt = "createdAt"
        case updateAt = "updateAt"
        case surahList = "surahList"
    }
}
