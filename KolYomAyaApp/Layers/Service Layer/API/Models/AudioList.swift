//
//  AudioList.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - AudioList
struct AudioList: BaseModel {
    let id: Int?
    let name: String?
    let audioLink: String?
    let viewsNumber: String?
    let audioTime: String?

   enum CodingKeys: String, CodingKey {
          case id = "id"
          case name = "name"
          case audioLink = "audioLink"
          case viewsNumber = "viewsNumber"
          case audioTime = "audioTime"
      }
}

