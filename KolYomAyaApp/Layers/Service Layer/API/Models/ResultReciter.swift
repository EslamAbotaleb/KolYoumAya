//
//  ResultReciter.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - Result
struct ResultReciter: BaseModel {
    let id: Int?
    let name: String?
    let image: String?
    let cardColor: String?
    let bio: String?
    let viewsNumber: Int?
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case image = "image"
        case cardColor = "cardColor"
        case bio = "bio"
        case viewsNumber = "viewsNumber"
    }
}
