//
//  ElsharawyProgramModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - ElsharawyProgramModel
struct ElsharawyProgramModel: BaseModel {
    let status: Int
    let message: String
    let id: Int
    let sectionName, longName: String
    let sectionImage: String
    let programsList: [ProgramsList]
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case id = "id"
        case sectionName = "sectionName"
        case longName = "longName"
        case sectionImage = "sectionImage"
        case programsList = "programsList"

       }
}



