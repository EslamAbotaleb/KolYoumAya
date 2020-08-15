//
//  Category.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - Category
struct Category: BaseModel {
    let id: Int
    let name: String
    enum CodingKeys: String, CodingKey {
         case name = "name"
         case id = "id"
        }
}
