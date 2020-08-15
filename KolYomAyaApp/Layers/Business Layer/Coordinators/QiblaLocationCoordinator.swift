//
//  QiblaLocationCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import UIKit
import Foundation
final class QiblaLocationCoordinator: Coordinator {
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
        let viewController = QiblaLocationViewController.init(nibName: "QiblaLocationViewController", bundle: nil)
        let qiblaLocationCoordinator = QiblaLocationCoordinator(viewController: viewController)
        childCoordinators.append(qiblaLocationCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = navigationController
    }
   
}
