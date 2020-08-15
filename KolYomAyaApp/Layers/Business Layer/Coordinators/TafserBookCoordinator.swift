//
//  TafserBookCoordinator.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
import Foundation
final class TafserBookCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    private var viewController: UIViewController?
  
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }

    func start() {
        let viewController = TafserBookViewController.init(nibName: "TafserBookViewController", bundle: nil)
        let tafserBookCoordinator = TafserBookCoordinator(viewController: viewController)
        childCoordinators.append(tafserBookCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = navigationController
    }
   
}
