//
//  HomeCoordinator.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/22/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class HomeCoordinator: Coordinator, DelegateForNamereciterProtocol {
    var getNameReciter: String?
       let reader_values = Bundle.main.infoDictionary!["reader_values"] as! NSArray
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator:  Coordinator?
    var delegate: DelegateForNamereciterProtocol?
    private var viewController: UIViewController?
    
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
   
    func start() {
        let viewContoller = HomeViewController.init(nibName: "HomeViewController", bundle: nil)
        let homeCoordinator = HomeCoordinator(viewController: viewContoller)
        childCoordinators.append(homeCoordinator)
        let navigationConteoller = UINavigationController(rootViewController: viewContoller)
        let rootViewController = appDelegate.appCoordinator?.setupSideMenu(viewNavigationContoller: navigationConteoller)
        rootViewController?.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = rootViewController
    }
//    func childDidFinish(_ childCoordinator: Coordinator) {
//        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
//            return childCoordinator === coordinator
//        }) {
//            childCoordinators.remove(at: index)
//        }
//    }
    
}
