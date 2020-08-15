//
//  TypeAlias.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/22/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//


import Foundation
 import UIKit
 import Alamofire
 
 //Network Services
 typealias completionHandlerHomeMedia = (NetworkServiceResult<TodayAyaViewModel, ErrorService>)->()
 
 //Request Services
 typealias requestforHomeMedia = RequestService<TodayAyaViewModel, ErrorService>
 
 
 //network use generic
 typealias completionHandlerForExecute<Request: RequestServiceProtocol> =
    (NetworkServiceResult<Request.ResponseModel, Request.ResponseError>)->()
