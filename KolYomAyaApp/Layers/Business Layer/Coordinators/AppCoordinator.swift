//
//  AppCoordinator.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //MARK:- Goto Splash Page
        let splashControler = SplashViewController()
        let splashPageCoordinator = SplashPageCoordinator(viewController: splashControler)
        childCoordinators.append(splashPageCoordinator)
        splashPageCoordinator.start()
        window.rootViewController = splashControler
    }
    func setupSideMenu(viewNavigationContoller: UINavigationController) -> UIViewController {
        let sideMenuController = PGSideMenu(animationType: .slideOver)
        sideMenuController.addContentController(viewNavigationContoller)
        sideMenuController.hideMenu(animated: false)
        sideMenuController.isLeftMenu = Localizer.isArabic()
        let rightMenuController = SideMenuViewController()
        sideMenuController.addRightMenuController(rightMenuController)
        let leftMenuController = SideMenuViewController()
        sideMenuController.addLeftMenuController(leftMenuController)
        return sideMenuController
    }
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
