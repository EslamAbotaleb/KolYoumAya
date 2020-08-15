//
//  CoordinatorProtocol.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
@objc
protocol Coordinator: class {
    //MARK:- coordinator contains child coordinator
    var childCoordinators: [Coordinator] { get }
    //MARK:- start sepsfic coordinator
    func start()
    //MARK:- coordinator was finished
   @objc optional func childDidFinish(_ childCoordiantor: Coordinator)
}
