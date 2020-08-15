//
//  ElsharawyMediaProgramIdModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation

// MARK: - ElsharawyMediaProgramIDModel
struct ElsharawyMediaProgramIDModel: BaseModel {
    let status: Int?
    let message: String?
    let mediaList: [MediaList]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case mediaList = "mediaList"
      
    }
    
}

// MARK: - MediaList
struct MediaList: BaseModel {
    let id: Int?
    let title: String?
    let mediaListDescription: String?
    let mediaType: String?
//    let image: JSONNull?
    let video: String?
    let videoCover: String?
    let program: Program?
    let displyDate, createdAt: String?
    let displayToday, itemDisplayed: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case mediaListDescription = "description"
        case mediaType = "mediaType"
//        case image = "image"
        case video = "video"
        case videoCover = "videoCover"
        case program = "program"
        case displyDate = "displyDate"
        case createdAt = "createdAt"
        case displayToday = "displayToday"
        case itemDisplayed = "itemDisplayed"
    }
}



// MARK: - Program
struct Program: BaseModel {
    let id: Int
    let programName: String
    let mediaNumber: Int
    let section: Section
    let category: Category
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case programName = "programName"
        case mediaNumber = "mediaNumber"
        case section = "section"
        case category = "category"
    }
}




// MARK: - Section
struct Section: BaseModel {
    let id: Int
    let sectionName: String
    let longName: String
    let sectionImage: String
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case sectionName = "sectionName"
           case longName = "longName"
           case sectionImage = "sectionImage"
       }
}


