//
//  ProgramsList.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - ProgramsList
struct ProgramsList: BaseModel {
    let id: Int
    let programName: String
    let mediaNumber: Int
    let category: Category
    
    enum CodingKeys: String, CodingKey {
           case mediaNumber = "mediaNumber"
           case programName = "programName"
           case id = "id"
           case category = "category"
          }
}
