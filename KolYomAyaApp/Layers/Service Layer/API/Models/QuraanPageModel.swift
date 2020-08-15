//
//  QuraanPageModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
// MARK: - QuraanPageModel
struct QuraanPageModel: BaseModel {
    let status: Int?
    let message: String?
    let quraanPage, nextPage: PageReadQuraan?
    let previousPage: PageReadQuraan?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
        case quraanPage = "quraanPage"
        case nextPage = "nextPage"
        case previousPage = "previousPage"
    }
}

