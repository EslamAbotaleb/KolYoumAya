//
//  TafserBookByPageNumberModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation

// MARK: - TafsirBookPageByPageNumber
struct TafsirBookPageByPageNumber: BaseModel {
    let status: Int?
    let message: String?
    let page, nextPage, previousPage: Page?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case page = "page"
        case nextPage = "nextPage"
        case previousPage = "previousPage"
      }
}

