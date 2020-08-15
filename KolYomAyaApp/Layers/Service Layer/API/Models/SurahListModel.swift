//
//  SurahListModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - SurahList
struct SurahList: BaseModel {
    let id: Int?
    let name: String?
    var ayat: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case ayat = "ayat"
      
    }
}
