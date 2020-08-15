//
//  BookGetAllbyPageNumberModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - BookGetAllbyPageNumber
struct BookGetAllbyPageNumber: BaseModel {
    let status: Int
    let message: String
    let pagesNumber: Int
    let results: [Result]
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case pagesNumber = "pagesNumber"
        case results = "results"
    }
}
