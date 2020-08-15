//
//  SplashCoordinator.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class SplashPageCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private var viewController: UIViewController
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func start() {
        let splashViewController :  SplashViewController = SplashViewController.init(nibName: "SplashViewController", bundle: nil)
        

        splashViewController.present(SideMenuViewController(), animated: true, completion: nil)
    }
    func childDidFinish(_ childCoordiantor: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordiantor === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
