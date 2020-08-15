//
//  ResultAlbumReciter.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - Result
struct ResultAlbumReciter: BaseModel {
    let id: Int?
    let name, itemsNumber, viewsNumber: String?
    let audioList: [AudioList]?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case itemsNumber = "itemsNumber"
        case viewsNumber = "viewsNumber"
        case audioList = "audioList"
        
    }
}
